<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Rental Items</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Rental Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Rental Items Found)<br />" rendered="#{rental.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{rental.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{rental.pagingInfo.firstItem + 1}..#{rental.pagingInfo.lastItem} of #{rental.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{rental.prev}" value="Previous #{rental.pagingInfo.batchSize}" rendered="#{rental.pagingInfo.firstItem >= rental.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{rental.next}" value="Next #{rental.pagingInfo.batchSize}" rendered="#{rental.pagingInfo.lastItem + rental.pagingInfo.batchSize <= rental.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{rental.next}" value="Remaining #{rental.pagingInfo.itemCount - rental.pagingInfo.lastItem}"
                                   rendered="#{rental.pagingInfo.lastItem < rental.pagingInfo.itemCount && rental.pagingInfo.lastItem + rental.pagingInfo.batchSize > rental.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{rental.rentalItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="RentalId"/>
                            </f:facet>
                            <h:outputText value="#{item.rentalId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="RentalDate"/>
                            </f:facet>
                            <h:outputText value="#{item.rentalDate}">
                                <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ReturnDate"/>
                            </f:facet>
                            <h:outputText value="#{item.returnDate}">
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
                                <h:outputText value="InventoryId"/>
                            </f:facet>
                            <h:outputText value="#{item.inventoryId}"/>
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
                            <h:commandLink value="Show" action="#{rental.detailSetup}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rental.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{rental.editSetup}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rental.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{rental.remove}">
                                <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rental.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{rental.createSetup}" value="New Rental"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
