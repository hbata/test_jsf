/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyoung.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author hesham
 */
@Entity
@Table(name = "actor_info")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ActorInfo.findAll", query = "SELECT a FROM ActorInfo a")
    , @NamedQuery(name = "ActorInfo.findByActorId", query = "SELECT a FROM ActorInfo a WHERE a.actorId = :actorId")
    , @NamedQuery(name = "ActorInfo.findByFirstName", query = "SELECT a FROM ActorInfo a WHERE a.firstName = :firstName")
    , @NamedQuery(name = "ActorInfo.findByLastName", query = "SELECT a FROM ActorInfo a WHERE a.lastName = :lastName")})
public class ActorInfo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Column(name = "actor_id", nullable = false)
    private short actorId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "first_name", nullable = false, length = 45)
    private String firstName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "last_name", nullable = false, length = 45)
    private String lastName;
    @Lob
    @Size(max = 65535)
    @Column(name = "film_info", length = 65535)
    private String filmInfo;

    public ActorInfo() {
    }

    public short getActorId() {
        return actorId;
    }

    public void setActorId(short actorId) {
        this.actorId = actorId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFilmInfo() {
        return filmInfo;
    }

    public void setFilmInfo(String filmInfo) {
        this.filmInfo = filmInfo;
    }
    
}
