/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyoung.faces;

import com.mkyoung.editor.StaffFacade;
import com.mkyoung.entities.Staff;
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
public class StaffController {

    public StaffController() {
        pagingInfo = new PagingInfo();
        converter = new StaffConverter();
    }
    private Staff staff = null;
    private List<Staff> staffItems = null;
    private StaffFacade jpaController = null;
    private StaffConverter converter = null;
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

    public StaffFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (StaffFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "staffJpa");
        }
        return jpaController;
    }

    public SelectItem[] getStaffItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getStaffItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Staff getStaff() {
        if (staff == null) {
            staff = (Staff) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentStaff", converter, null);
        }
        if (staff == null) {
            staff = new Staff();
        }
        return staff;
    }

    public String listSetup() {
        reset(true);
        return "staff_list";
    }

    public String createSetup() {
        reset(false);
        staff = new Staff();
        return "staff_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(staff);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Staff was successfully created.");
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
        return scalarSetup("staff_detail");
    }

    public String editSetup() {
        return scalarSetup("staff_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        staff = (Staff) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentStaff", converter, null);
        if (staff == null) {
            String requestStaffString = JsfUtil.getRequestParameter("jsfcrud.currentStaff");
            JsfUtil.addErrorMessage("The staff with id " + requestStaffString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String staffString = converter.getAsString(FacesContext.getCurrentInstance(), null, staff);
        String currentStaffString = JsfUtil.getRequestParameter("jsfcrud.currentStaff");
        if (staffString == null || staffString.length() == 0 || !staffString.equals(currentStaffString)) {
            String outcome = editSetup();
            if ("staff_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit staff. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(staff);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Staff was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentStaff");
        Short id = new Short(idAsString);
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
                JsfUtil.addSuccessMessage("Staff was successfully deleted.");
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

    public List<Staff> getStaffItems() {
        if (staffItems == null) {
            getPagingInfo();
            staffItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return staffItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "staff_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "staff_list";
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
        staff = null;
        staffItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Staff newStaff = new Staff();
        String newStaffString = converter.getAsString(FacesContext.getCurrentInstance(), null, newStaff);
        String staffString = converter.getAsString(FacesContext.getCurrentInstance(), null, staff);
        if (!newStaffString.equals(staffString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
