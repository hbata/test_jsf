/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyoung.faces;

import com.mkyoung.entities.Store;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

/**
 *
 * @author hesham
 */
public class StoreConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Short id = new Short(string);
        StoreController controller = (StoreController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "store");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Store) {
            Store o = (Store) object;
            return o.getStoreId() == null ? "" : o.getStoreId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: com.mkyoung.entities.Store");
        }
    }
    
}
