/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyoung.faces;

import com.mkyoung.editor.InventoryFacade;
import com.mkyoung.entities.Inventory;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.mkyoung.faces.util.JsfUtil;
import com.mkyoung.faces.util.PagingInfo;
import java.util.List;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author hesham
 */
public class InventoryController {

    public InventoryController() {
        pagingInfo = new PagingInfo();
        converter = new InventoryConverter();
    }
    private Inventory inventory = null;
    private List<Inventory> inventoryItems = null;
    private InventoryFacade jpaController = null;
    private InventoryConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "com.mycompany_jsf_1_war_1.0-SNAPSHOTPU")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public InventoryFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (InventoryFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "inventoryJpa");
        }
        return jpaController;
    }

    public SelectItem[] getInventoryItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getInventoryItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Inventory getInventory() {
        if (inventory == null) {
            inventory = (Inventory) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentInventory", converter, null);
        }
        if (inventory == null) {
            inventory = new Inventory();
        }
        return inventory;
    }

    public String listSetup() {
        reset(true);
        return "inventory_list";
    }

    public String createSetup() {
        reset(false);
        inventory = new Inventory();
        return "inventory_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(inventory);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Inventory was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("inventory_detail");
    }

    public String editSetup() {
        return scalarSetup("inventory_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        inventory = (Inventory) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentInventory", converter, null);
        if (inventory == null) {
            String requestInventoryString = JsfUtil.getRequestParameter("jsfcrud.currentInventory");
            JsfUtil.addErrorMessage("The inventory with id " + requestInventoryString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String inventoryString = converter.getAsString(FacesContext.getCurrentInstance(), null, inventory);
        String currentInventoryString = JsfUtil.getRequestParameter("jsfcrud.currentInventory");
        if (inventoryString == null || inventoryString.length() == 0 || !inventoryString.equals(currentInventoryString)) {
            String outcome = editSetup();
            if ("inventory_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit inventory. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(inventory);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Inventory was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentInventory");
        Integer id = new Integer(idAsString);
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Inventory was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if ((ERROR)) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<Inventory> getInventoryItems() {
        if (inventoryItems == null) {
            getPagingInfo();
            inventoryItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return inventoryItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "inventory_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "inventory_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        inventory = null;
        inventoryItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Inventory newInventory = new Inventory();
        String newInventoryString = converter.getAsString(FacesContext.getCurrentInstance(), null, newInventory);
        String inventoryString = converter.getAsString(FacesContext.getCurrentInstance(), null, inventory);
        if (!newInventoryString.equals(inventoryString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
