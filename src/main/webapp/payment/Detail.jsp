<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Payment Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Payment Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="PaymentId:"/>
                    <h:outputText value="#{payment.payment.paymentId}" title="PaymentId" />
                    <h:outputText value="Amount:"/>
                    <h:outputText value="#{payment.payment.amount}" title="Amount" />
                    <h:outputText value="PaymentDate:"/>
                    <h:outputText value="#{payment.payment.paymentDate}" title="PaymentDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{payment.payment.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="CustomerId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{payment.payment.customerId}"/>
                        <h:panelGroup rendered="#{payment.payment.customerId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{customer.detailSetup}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment.customerId][customer.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="payment"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.PaymentController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{customer.editSetup}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment.customerId][customer.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="payment"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.PaymentController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{customer.destroy}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment.customerId][customer.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="payment"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.PaymentController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="RentalId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{payment.payment.rentalId}"/>
                        <h:panelGroup rendered="#{payment.payment.rentalId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{rental.detailSetup}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment.rentalId][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="payment"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.PaymentController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{rental.editSetup}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment.rentalId][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="payment"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.PaymentController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{rental.destroy}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment.rentalId][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="payment"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.PaymentController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="StaffId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{payment.payment.staffId}"/>
                        <h:panelGroup rendered="#{payment.payment.staffId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{staff.detailSetup}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment.staffId][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="payment"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.PaymentController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{staff.editSetup}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment.staffId][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="payment"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.PaymentController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{staff.destroy}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment.staffId][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="payment"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.PaymentController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{payment.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{payment.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][payment.payment][payment.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{payment.createSetup}" value="New Payment" />
                <br />
                <h:commandLink action="#{payment.listSetup}" value="Show All Payment Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
