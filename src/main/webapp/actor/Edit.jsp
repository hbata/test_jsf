<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Actor</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Actor</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="ActorId:"/>
                    <h:outputText value="#{actor.actor.actorId}" title="ActorId" />
                    <h:outputText value="FirstName:"/>
                    <h:inputText id="firstName" value="#{actor.actor.firstName}" title="FirstName" required="true" requiredMessage="The firstName field is required." />
                    <h:outputText value="LastName:"/>
                    <h:inputText id="lastName" value="#{actor.actor.lastName}" title="LastName" required="true" requiredMessage="The lastName field is required." />
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{actor.actor.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="FilmActorCollection:"/>
                    <h:outputText escape="false" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getCollectionAsString'][actor.actor.filmActorCollection == null ? jsfcrud_null : actor.actor.filmActorCollection].jsfcrud_invoke}" title="FilmActorCollection" />

                </h:panelGrid>
                <br />
                <h:commandLink action="#{actor.edit}" value="Save">
                    <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][actor.actor][actor.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{actor.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][actor.actor][actor.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{actor.listSetup}" value="Show All Actor Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
