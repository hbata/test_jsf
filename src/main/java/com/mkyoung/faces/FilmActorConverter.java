/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyoung.faces;

import java.util.regex.Pattern;
import java.util.regex.Matcher;
import com.mkyoung.editor.FilmActorFacade;
import com.mkyoung.entities.FilmActor;
import com.mkyoung.entities.FilmActorPK;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

/**
 *
 * @author hesham
 */
public class FilmActorConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        FilmActorPK id = getId(string);
        FilmActorController controller = (FilmActorController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "filmActor");
        return controller.getJpaController().find(id);
    }

    FilmActorPK getId(String string) {
        FilmActorPK id = new FilmActorPK();
        String[] params = new String[2];
        int p = 0;
        int grabStart = 0;
        String delim = "#";
        String escape = "~";
        Pattern pattern = Pattern.compile(escape + "*" + delim);
        Matcher matcher = pattern.matcher(string);
        while (matcher.find()) {
            String found = matcher.group();
            if (found.length() % 2 == 1) {
                params[p] = string.substring(grabStart, matcher.start());
                p++;
                grabStart = matcher.end();
            }
        }
        if (p != params.length - 1) {
            throw new IllegalArgumentException("string " + string + " is not in expected format. expected 2 ids delimited by " + delim);
        }
        params[p] = string.substring(grabStart);
        for (int i = 0; i < params.length; i++) {
            params[i] = params[i].replace(escape + delim, delim);
            params[i] = params[i].replace(escape + escape, escape);
        }
        id.setActorId(Short.parseShort(params[0]));
        id.setFilmId(Short.parseShort(params[1]));
        return id;
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof FilmActor) {
            FilmActor o = (FilmActor) object;
            FilmActorPK id = o.getFilmActorPK();
            if (id == null) {
                return "";
            }
            String delim = "#";
            String escape = "~";
            Object actorIdObj = id.getActorId();
            String actorId = actorIdObj == null ? "" : String.valueOf(actorIdObj);
            actorId = actorId.replace(escape, escape + escape);
            actorId = actorId.replace(delim, escape + delim);
            Object filmIdObj = id.getFilmId();
            String filmId = filmIdObj == null ? "" : String.valueOf(filmIdObj);
            filmId = filmId.replace(escape, escape + escape);
            filmId = filmId.replace(delim, escape + delim);
            return actorId + delim + filmId;
            // TODO: no setter methods were found in your primary key class
            //    com.mkyoung.entities.FilmActorPK
            // and therefore getAsString() method could not be pre-generated.
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: com.mkyoung.entities.FilmActor");
        }
    }
    
}
