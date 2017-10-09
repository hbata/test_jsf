/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyoung.faces;

import com.mkyoung.editor.PaymentFacade;
import com.mkyoung.entities.Payment;
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
public class PaymentController {

    public PaymentController() {
        pagingInfo = new PagingInfo();
        converter = new PaymentConverter();
    }
    private Payment payment = null;
    private List<Payment> paymentItems = null;
    private PaymentFacade jpaController = null;
    private PaymentConverter converter = null;
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

    public PaymentFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (PaymentFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "paymentJpa");
        }
        return jpaController;
    }

    public SelectItem[] getPaymentItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getPaymentItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Payment getPayment() {
        if (payment == null) {
            payment = (Payment) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPayment", converter, null);
        }
        if (payment == null) {
            payment = new Payment();
        }
        return payment;
    }

    public String listSetup() {
        reset(true);
        return "payment_list";
    }

    public String createSetup() {
        reset(false);
        payment = new Payment();
        return "payment_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(payment);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Payment was successfully created.");
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
        return scalarSetup("payment_detail");
    }

    public String editSetup() {
        return scalarSetup("payment_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        payment = (Payment) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPayment", converter, null);
        if (payment == null) {
            String requestPaymentString = JsfUtil.getRequestParameter("jsfcrud.currentPayment");
            JsfUtil.addErrorMessage("The payment with id " + requestPaymentString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String paymentString = converter.getAsString(FacesContext.getCurrentInstance(), null, payment);
        String currentPaymentString = JsfUtil.getRequestParameter("jsfcrud.currentPayment");
        if (paymentString == null || paymentString.length() == 0 || !paymentString.equals(currentPaymentString)) {
            String outcome = editSetup();
            if ("payment_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit payment. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(payment);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Payment was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPayment");
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
                JsfUtil.addSuccessMessage("Payment was successfully deleted.");
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

    public List<Payment> getPaymentItems() {
        if (paymentItems == null) {
            getPagingInfo();
            paymentItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return paymentItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "payment_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "payment_list";
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
        payment = null;
        paymentItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Payment newPayment = new Payment();
        String newPaymentString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPayment);
        String paymentString = converter.getAsString(FacesContext.getCurrentInstance(), null, payment);
        if (!newPaymentString.equals(paymentString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
