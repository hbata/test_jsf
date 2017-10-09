/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyoung.faces;

import com.mkyoung.editor.LanguageFacade;
import com.mkyoung.entities.Language;
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
public class LanguageController {

    public LanguageController() {
        pagingInfo = new PagingInfo();
        converter = new LanguageConverter();
    }
    private Language language = null;
    private List<Language> languageItems = null;
    private LanguageFacade jpaController = null;
    private LanguageConverter converter = null;
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

    public LanguageFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (LanguageFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "languageJpa");
        }
        return jpaController;
    }

    public SelectItem[] getLanguageItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getLanguageItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Language getLanguage() {
        if (language == null) {
            language = (Language) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentLanguage", converter, null);
        }
        if (language == null) {
            language = new Language();
        }
        return language;
    }

    public String listSetup() {
        reset(true);
        return "language_list";
    }

    public String createSetup() {
        reset(false);
        language = new Language();
        return "language_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(language);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Language was successfully created.");
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
        return scalarSetup("language_detail");
    }

    public String editSetup() {
        return scalarSetup("language_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        language = (Language) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentLanguage", converter, null);
        if (language == null) {
            String requestLanguageString = JsfUtil.getRequestParameter("jsfcrud.currentLanguage");
            JsfUtil.addErrorMessage("The language with id " + requestLanguageString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String languageString = converter.getAsString(FacesContext.getCurrentInstance(), null, language);
        String currentLanguageString = JsfUtil.getRequestParameter("jsfcrud.currentLanguage");
        if (languageString == null || languageString.length() == 0 || !languageString.equals(currentLanguageString)) {
            String outcome = editSetup();
            if ("language_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit language. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(language);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Language was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentLanguage");
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
                JsfUtil.addSuccessMessage("Language was successfully deleted.");
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

    public List<Language> getLanguageItems() {
        if (languageItems == null) {
            getPagingInfo();
            languageItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return languageItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "language_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "language_list";
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
        language = null;
        languageItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Language newLanguage = new Language();
        String newLanguageString = converter.getAsString(FacesContext.getCurrentInstance(), null, newLanguage);
        String languageString = converter.getAsString(FacesContext.getCurrentInstance(), null, language);
        if (!newLanguageString.equals(languageString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
