<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Inventory</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Inventory</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{inventory.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{inventory.inventory.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="FilmId:"/>
                    <h:selectOneMenu id="filmId" value="#{inventory.inventory.filmId}" title="FilmId" required="true" requiredMessage="The filmId field is required." >
                        <f:selectItems value="#{film.filmItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="StoreId:"/>
                    <h:selectOneMenu id="storeId" value="#{inventory.inventory.storeId}" title="StoreId" required="true" requiredMessage="The storeId field is required." >
                        <f:selectItems value="#{store.storeItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="RentalCollection:"/>
                    <h:selectManyListbox id="rentalCollection" value="#{inventory.inventory.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].rentalCollection}" title="RentalCollection" size="6" converter="#{rental.converter}" >
                        <f:selectItems value="#{rental.rentalItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{inventory.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{inventory.listSetup}" value="Show All Inventory Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
