package com.mkyoung.editor;

import javax.faces.bean.ManagedBean;

/**
 *
 * @author hesham
 */
@ManagedBean(name = "editor")
public class EditorBean {

    private String value = "This editor is provided by PrimeFaces";
    private String t_val = "GJU";

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getT_val() {
        return t_val;
    }

    public void setT_val(String t_val) {
        this.t_val = t_val;
    }

}
