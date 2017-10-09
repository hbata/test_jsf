<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Rental Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Rental Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="RentalId:"/>
                    <h:outputText value="#{rental.rental.rentalId}" title="RentalId" />
                    <h:outputText value="RentalDate:"/>
                    <h:outputText value="#{rental.rental.rentalDate}" title="RentalDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="ReturnDate:"/>
                    <h:outputText value="#{rental.rental.returnDate}" title="ReturnDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{rental.rental.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="CustomerId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{rental.rental.customerId}"/>
                        <h:panelGroup rendered="#{rental.rental.customerId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{customer.detailSetup}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental.customerId][customer.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="rental"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{customer.editSetup}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental.customerId][customer.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="rental"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{customer.destroy}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental.customerId][customer.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="rental"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="InventoryId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{rental.rental.inventoryId}"/>
                        <h:panelGroup rendered="#{rental.rental.inventoryId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{inventory.detailSetup}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental.inventoryId][inventory.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="rental"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{inventory.editSetup}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental.inventoryId][inventory.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="rental"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{inventory.destroy}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental.inventoryId][inventory.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="rental"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="StaffId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{rental.rental.staffId}"/>
                        <h:panelGroup rendered="#{rental.rental.staffId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{staff.detailSetup}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental.staffId][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="rental"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{staff.editSetup}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental.staffId][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="rental"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{staff.destroy}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental.staffId][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="rental"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="PaymentCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty rental.rental.paymentCollection}" value="(No Items)"/>
                        <h:dataTable value="#{rental.rental.paymentCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty rental.rental.paymentCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="PaymentId"/>
                                </f:facet>
                                <h:outputText value="#{item.paymentId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Amount"/>
                                </f:facet>
                                <h:outputText value="#{item.amount}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="PaymentDate"/>
                                </f:facet>
                                <h:outputText value="#{item.paymentDate}">
                                    <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                                </h:outputText>
                            </h:column>
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
                                    <h:outputText value="CustomerId"/>
                                </f:facet>
                                <h:outputText value="#{item.customerId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="RentalId"/>
                                </f:facet>
                                <h:outputText value="#{item.rentalId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="StaffId"/>
                                </f:facet>
                                <h:outputText value="#{item.staffId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{payment.detailSetup}">
                                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][payment.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="rental" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{payment.editSetup}">
                                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][payment.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="rental" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{payment.destroy}">
                                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][payment.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="rental" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.RentalController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{rental.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{rental.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rental.rental][rental.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{rental.createSetup}" value="New Rental" />
                <br />
                <h:commandLink action="#{rental.listSetup}" value="Show All Rental Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
