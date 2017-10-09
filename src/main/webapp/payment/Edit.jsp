<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Payment</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Payment</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="PaymentId:"/>
                    <h:outputText value="#{payment.payment.paymentId}" title="PaymentId" />
                    <h:outputText value="Amount:"/>
                    <h:inputText id="amount" value="#{payment.payment.amount}" title="Amount" required="true" requiredMessage="The amount field is required." />
                    <h:outputText value="PaymentDate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="paymentDate" value="#{payment.payment.paymentDate}" title="PaymentDate" required="true" requiredMessage="The paymentDate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{payment.payment.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="CustomerId:"/>
                    <h:selectOneMenu id="customerId" value="#{payment.payment.customerId}" title="CustomerId" required="true" requiredMessage="The customerId field is required." >
                        <f:selectItems value="#{customer.customerItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="RentalId:"/>
                    <h:selectOneMenu id="rentalId" value="#{payment.payment.rentalId}" title="RentalId" >
                        <f:selectItems value="#{rental.rentalItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="StaffId:"/>
                    <h:selectOneMenu id="staffId" value="#{payment.payment.staffId}" title="StaffId" required="true" requiredMessage="The staffId field is required." >
                        <f:selectItems value="#{staff.staffItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{payment.edit}" value="Save">
                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{payment.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{payment.listSetup}" value="Show All Payment Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
