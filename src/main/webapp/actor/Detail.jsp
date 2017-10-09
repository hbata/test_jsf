<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Actor Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Actor Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="ActorId:"/>
                    <h:outputText value="#{actor.actor.actorId}" title="ActorId" />
                    <h:outputText value="FirstName:"/>
                    <h:outputText value="#{actor.actor.firstName}" title="FirstName" />
                    <h:outputText value="LastName:"/>
                    <h:outputText value="#{actor.actor.lastName}" title="LastName" />
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{actor.actor.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>

                    <h:outputText value="FilmActorCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty actor.actor.filmActorCollection}" value="(No Items)"/>
                        <h:dataTable value="#{actor.actor.filmActorCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty actor.actor.filmActorCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="LastUpdate"/>
                                </f:facet>
                                <h:outputText value="#{item.lastUpdate}">
                                    <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Actor"/>
                                </f:facet>
                                <h:outputText value="#{item.actor}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Film"/>
                                </f:facet>
                                <h:outputText value="#{item.film}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{filmActor.detailSetup}">
                                    <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][actor.actor][actor.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][filmActor.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="actor" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.ActorController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{filmActor.editSetup}">
                                    <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][actor.actor][actor.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][filmActor.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="actor" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.ActorController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{filmActor.destroy}">
                                    <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][actor.actor][actor.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][filmActor.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="actor" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.ActorController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{actor.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][actor.actor][actor.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{actor.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][actor.actor][actor.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{actor.createSetup}" value="New Actor" />
                <br />
                <h:commandLink action="#{actor.listSetup}" value="Show All Actor Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
