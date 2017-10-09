<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New FilmActor</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New FilmActor</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{filmActor.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{filmActor.filmActor.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="Actor:"/>
                    <h:selectOneMenu id="actor" value="#{filmActor.filmActor.actor}" title="Actor" required="true" requiredMessage="The actor field is required." >
                        <f:selectItems value="#{actor.actorItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="Film:"/>
                    <h:selectOneMenu id="film" value="#{filmActor.filmActor.film}" title="Film" required="true" requiredMessage="The film field is required." >
                        <f:selectItems value="#{film.filmItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{filmActor.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{filmActor.listSetup}" value="Show All FilmActor Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
