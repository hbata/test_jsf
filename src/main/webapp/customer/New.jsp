<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Customer</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Customer</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{customer.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="FirstName:"/>
                    <h:inputText id="firstName" value="#{customer.customer.firstName}" title="FirstName" required="true" requiredMessage="The firstName field is required." />
                    <h:outputText value="LastName:"/>
                    <h:inputText id="lastName" value="#{customer.customer.lastName}" title="LastName" required="true" requiredMessage="The lastName field is required." />
                    <h:outputText value="Email:"/>
                    <h:inputText id="email" value="#{customer.customer.email}" title="Email" />
                    <h:outputText value="Active:"/>
                    <h:inputText id="active" value="#{customer.customer.active}" title="Active" required="true" requiredMessage="The active field is required." />
                    <h:outputText value="CreateDate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="createDate" value="#{customer.customer.createDate}" title="CreateDate" required="true" requiredMessage="The createDate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{customer.customer.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="RentalCollection:"/>
                    <h:selectManyListbox id="rentalCollection" value="#{customer.customer.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].rentalCollection}" title="RentalCollection" size="6" converter="#{rental.converter}" >
                        <f:selectItems value="#{rental.rentalItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="PaymentCollection:"/>
                    <h:selectManyListbox id="paymentCollection" value="#{customer.customer.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].paymentCollection}" title="PaymentCollection" size="6" converter="#{payment.converter}" >
                        <f:selectItems value="#{payment.paymentItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="AddressId:"/>
                    <h:selectOneMenu id="addressId" value="#{customer.customer.addressId}" title="AddressId" required="true" requiredMessage="The addressId field is required." >
                        <f:selectItems value="#{address.addressItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="StoreId:"/>
                    <h:selectOneMenu id="storeId" value="#{customer.customer.storeId}" title="StoreId" required="true" requiredMessage="The storeId field is required." >
                        <f:selectItems value="#{store.storeItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{customer.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{customer.listSetup}" value="Show All Customer Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
