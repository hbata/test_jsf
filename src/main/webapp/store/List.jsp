<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Store Items</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Store Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Store Items Found)<br />" rendered="#{store.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{store.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{store.pagingInfo.firstItem + 1}..#{store.pagingInfo.lastItem} of #{store.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{store.prev}" value="Previous #{store.pagingInfo.batchSize}" rendered="#{store.pagingInfo.firstItem >= store.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{store.next}" value="Next #{store.pagingInfo.batchSize}" rendered="#{store.pagingInfo.lastItem + store.pagingInfo.batchSize <= store.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{store.next}" value="Remaining #{store.pagingInfo.itemCount - store.pagingInfo.lastItem}"
                                   rendered="#{store.pagingInfo.lastItem < store.pagingInfo.itemCount && store.pagingInfo.lastItem + store.pagingInfo.batchSize > store.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{store.storeItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="StoreId"/>
                            </f:facet>
                            <h:outputText value="#{item.storeId}"/>
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
                                <h:outputText value="AddressId"/>
                            </f:facet>
                            <h:outputText value="#{item.addressId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ManagerStaffId"/>
                            </f:facet>
                            <h:outputText value="#{item.managerStaffId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{store.detailSetup}">
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][store.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{store.editSetup}">
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][store.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{store.remove}">
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][store.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{store.createSetup}" value="New Store"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
