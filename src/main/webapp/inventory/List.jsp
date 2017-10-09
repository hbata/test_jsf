<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Inventory Items</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Inventory Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Inventory Items Found)<br />" rendered="#{inventory.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{inventory.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{inventory.pagingInfo.firstItem + 1}..#{inventory.pagingInfo.lastItem} of #{inventory.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{inventory.prev}" value="Previous #{inventory.pagingInfo.batchSize}" rendered="#{inventory.pagingInfo.firstItem >= inventory.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{inventory.next}" value="Next #{inventory.pagingInfo.batchSize}" rendered="#{inventory.pagingInfo.lastItem + inventory.pagingInfo.batchSize <= inventory.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{inventory.next}" value="Remaining #{inventory.pagingInfo.itemCount - inventory.pagingInfo.lastItem}"
                                   rendered="#{inventory.pagingInfo.lastItem < inventory.pagingInfo.itemCount && inventory.pagingInfo.lastItem + inventory.pagingInfo.batchSize > inventory.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{inventory.inventoryItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="InventoryId"/>
                            </f:facet>
                            <h:outputText value="#{item.inventoryId}"/>
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
                                <h:outputText value="FilmId"/>
                            </f:facet>
                            <h:outputText value="#{item.filmId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="StoreId"/>
                            </f:facet>
                            <h:outputText value="#{item.storeId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{inventory.detailSetup}">
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][inventory.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{inventory.editSetup}">
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][inventory.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{inventory.remove}">
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][inventory.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{inventory.createSetup}" value="New Inventory"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
