/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyoung.faces;

import com.mkyoung.editor.FilmActorFacade;
import com.mkyoung.entities.FilmActor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.mkyoung.faces.util.JsfUtil;
import com.mkyoung.entities.FilmActorPK;
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
public class FilmActorController {

    public FilmActorController() {
        pagingInfo = new PagingInfo();
        converter = new FilmActorConverter();
    }
    private FilmActor filmActor = null;
    private List<FilmActor> filmActorItems = null;
    private FilmActorFacade jpaController = null;
    private FilmActorConverter converter = null;
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

    public FilmActorFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (FilmActorFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "filmActorJpa");
        }
        return jpaController;
    }

    public SelectItem[] getFilmActorItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getFilmActorItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public FilmActor getFilmActor() {
        if (filmActor == null) {
            filmActor = (FilmActor) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentFilmActor", converter, null);
        }
        if (filmActor == null) {
            filmActor = new FilmActor();
        }
        return filmActor;
    }

    public String listSetup() {
        reset(true);
        return "filmActor_list";
    }

    public String createSetup() {
        reset(false);
        filmActor = new FilmActor();
        filmActor.setFilmActorPK(new FilmActorPK());
        return "filmActor_create";
    }

    public String create() {
        filmActor.getFilmActorPK().setActorId(filmActor.getActor().getActorId());
        filmActor.getFilmActorPK().setFilmId(filmActor.getFilm().getFilmId());
        // TODO: no setter methods were found in your primary key class
        //    com.mkyoung.entities.FilmActorPK
        // and therefore initialization code need manual adjustments.
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(filmActor);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("FilmActor was successfully created.");
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
        return scalarSetup("filmActor_detail");
    }

    public String editSetup() {
        return scalarSetup("filmActor_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        filmActor = (FilmActor) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentFilmActor", converter, null);
        if (filmActor == null) {
            String requestFilmActorString = JsfUtil.getRequestParameter("jsfcrud.currentFilmActor");
            JsfUtil.addErrorMessage("The filmActor with id " + requestFilmActorString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        filmActor.getFilmActorPK().setActorId(filmActor.getActor().getActorId());
        filmActor.getFilmActorPK().setFilmId(filmActor.getFilm().getFilmId());
        // TODO: no setter methods were found in your primary key class
        //    com.mkyoung.entities.FilmActorPK
        // and therefore initialization code need manual adjustments.
        String filmActorString = converter.getAsString(FacesContext.getCurrentInstance(), null, filmActor);
        String currentFilmActorString = JsfUtil.getRequestParameter("jsfcrud.currentFilmActor");
        if (filmActorString == null || filmActorString.length() == 0 || !filmActorString.equals(currentFilmActorString)) {
            String outcome = editSetup();
            if ("filmActor_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit filmActor. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(filmActor);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("FilmActor was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentFilmActor");
        FilmActorPK id = converter.getId(idAsString);
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
                JsfUtil.addSuccessMessage("FilmActor was successfully deleted.");
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

    public List<FilmActor> getFilmActorItems() {
        if (filmActorItems == null) {
            getPagingInfo();
            filmActorItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return filmActorItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "filmActor_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "filmActor_list";
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
        filmActor = null;
        filmActorItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        FilmActor newFilmActor = new FilmActor();
        newFilmActor.setFilmActorPK(new FilmActorPK());
        String newFilmActorString = converter.getAsString(FacesContext.getCurrentInstance(), null, newFilmActor);
        String filmActorString = converter.getAsString(FacesContext.getCurrentInstance(), null, filmActor);
        if (!newFilmActorString.equals(filmActorString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
