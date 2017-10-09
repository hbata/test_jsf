<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Store</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Store</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{store.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{store.store.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="StaffCollection:"/>
                    <h:selectManyListbox id="staffCollection" value="#{store.store.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].staffCollection}" title="StaffCollection" size="6" converter="#{staff.converter}" >
                        <f:selectItems value="#{staff.staffItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="AddressId:"/>
                    <h:selectOneMenu id="addressId" value="#{store.store.addressId}" title="AddressId" required="true" requiredMessage="The addressId field is required." >
                        <f:selectItems value="#{address.addressItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="ManagerStaffId:"/>
                    <h:selectOneMenu id="managerStaffId" value="#{store.store.managerStaffId}" title="ManagerStaffId" required="true" requiredMessage="The managerStaffId field is required." >
                        <f:selectItems value="#{staff.staffItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="InventoryCollection:"/>
                    <h:selectManyListbox id="inventoryCollection" value="#{store.store.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].inventoryCollection}" title="InventoryCollection" size="6" converter="#{inventory.converter}" >
                        <f:selectItems value="#{inventory.inventoryItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="CustomerCollection:"/>
                    <h:selectManyListbox id="customerCollection" value="#{store.store.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].customerCollection}" title="CustomerCollection" size="6" converter="#{customer.converter}" >
                        <f:selectItems value="#{customer.customerItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{store.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{store.listSetup}" value="Show All Store Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
