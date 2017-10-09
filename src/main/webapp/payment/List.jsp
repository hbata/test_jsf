<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Payment Items</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Payment Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Payment Items Found)<br />" rendered="#{payment.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{payment.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{payment.pagingInfo.firstItem + 1}..#{payment.pagingInfo.lastItem} of #{payment.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{payment.prev}" value="Previous #{payment.pagingInfo.batchSize}" rendered="#{payment.pagingInfo.firstItem >= payment.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{payment.next}" value="Next #{payment.pagingInfo.batchSize}" rendered="#{payment.pagingInfo.lastItem + payment.pagingInfo.batchSize <= payment.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{payment.next}" value="Remaining #{payment.pagingInfo.itemCount - payment.pagingInfo.lastItem}"
                                   rendered="#{payment.pagingInfo.lastItem < payment.pagingInfo.itemCount && payment.pagingInfo.lastItem + payment.pagingInfo.batchSize > payment.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{payment.paymentItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][payment.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{payment.editSetup}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][payment.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{payment.remove}">
                                <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][payment.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{payment.createSetup}" value="New Payment"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
