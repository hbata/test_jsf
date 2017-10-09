/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyoung.faces;

import com.mkyoung.editor.FilmFacade;
import com.mkyoung.entities.Film;
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
public class FilmController {

    public FilmController() {
        pagingInfo = new PagingInfo();
        converter = new FilmConverter();
    }
    private Film film = null;
    private List<Film> filmItems = null;
    private FilmFacade jpaController = null;
    private FilmConverter converter = null;
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

    public FilmFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (FilmFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "filmJpa");
        }
        return jpaController;
    }

    public SelectItem[] getFilmItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getFilmItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Film getFilm() {
        if (film == null) {
            film = (Film) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentFilm", converter, null);
        }
        if (film == null) {
            film = new Film();
        }
        return film;
    }

    public String listSetup() {
        reset(true);
        return "film_list";
    }

    public String createSetup() {
        reset(false);
        film = new Film();
        return "film_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(film);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Film was successfully created.");
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
        return scalarSetup("film_detail");
    }

    public String editSetup() {
        return scalarSetup("film_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        film = (Film) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentFilm", converter, null);
        if (film == null) {
            String requestFilmString = JsfUtil.getRequestParameter("jsfcrud.currentFilm");
            JsfUtil.addErrorMessage("The film with id " + requestFilmString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String filmString = converter.getAsString(FacesContext.getCurrentInstance(), null, film);
        String currentFilmString = JsfUtil.getRequestParameter("jsfcrud.currentFilm");
        if (filmString == null || filmString.length() == 0 || !filmString.equals(currentFilmString)) {
            String outcome = editSetup();
            if ("film_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit film. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(film);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Film was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentFilm");
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
                JsfUtil.addSuccessMessage("Film was successfully deleted.");
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

    public List<Film> getFilmItems() {
        if (filmItems == null) {
            getPagingInfo();
            filmItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return filmItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "film_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "film_list";
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
        film = null;
        filmItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Film newFilm = new Film();
        String newFilmString = converter.getAsString(FacesContext.getCurrentInstance(), null, newFilm);
        String filmString = converter.getAsString(FacesContext.getCurrentInstance(), null, film);
        if (!newFilmString.equals(filmString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
