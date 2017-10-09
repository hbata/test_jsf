<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Rental</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Rental</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="RentalId:"/>
                    <h:outputText value="#{rental.rental.rentalId}" title="RentalId" />
                    <h:outputText value="RentalDate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="rentalDate" value="#{rental.rental.rentalDate}" title="RentalDate" required="true" requiredMessage="The rentalDate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="ReturnDate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="returnDate" value="#{rental.rental.returnDate}" title="ReturnDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{rental.rental.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="CustomerId:"/>
                    <h:selectOneMenu id="customerId" value="#{rental.rental.customerId}" title="CustomerId" required="true" requiredMessage="The customerId field is required." >
                        <f:selectItems value="#{customer.customerItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="InventoryId:"/>
                    <h:selectOneMenu id="inventoryId" value="#{rental.rental.inventoryId}" title="InventoryId" required="true" requiredMessage="The inventoryId field is required." >
                        <f:selectItems value="#{inventory.inventoryItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="StaffId:"/>
                    <h:selectOneMenu id="staffId" value="#{rental.rental.staffId}" title="StaffId" required="true" requiredMessage="The staffId field is required." >
                        <f:selectItems value="#{staff.staffItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="PaymentCollection:"/>
                    <h:selectManyListbox id="paymentCollection" value="#{rental.rental.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].paymentCollection}" title="PaymentCollection" size="6" converter="#{payment.converter}" >
                        <f:selectItems value="#{payment.paymentItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{rental.edit}" value="Save">
                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{rental.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{rental.listSetup}" value="Show All Rental Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
