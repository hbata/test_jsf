<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Staff Items</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Staff Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Staff Items Found)<br />" rendered="#{staff.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{staff.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{staff.pagingInfo.firstItem + 1}..#{staff.pagingInfo.lastItem} of #{staff.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{staff.prev}" value="Previous #{staff.pagingInfo.batchSize}" rendered="#{staff.pagingInfo.firstItem >= staff.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{staff.next}" value="Next #{staff.pagingInfo.batchSize}" rendered="#{staff.pagingInfo.lastItem + staff.pagingInfo.batchSize <= staff.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{staff.next}" value="Remaining #{staff.pagingInfo.itemCount - staff.pagingInfo.lastItem}"
                                   rendered="#{staff.pagingInfo.lastItem < staff.pagingInfo.itemCount && staff.pagingInfo.lastItem + staff.pagingInfo.batchSize > staff.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{staff.staffItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="StaffId"/>
                            </f:facet>
                            <h:outputText value="#{item.staffId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FirstName"/>
                            </f:facet>
                            <h:outputText value="#{item.firstName}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="LastName"/>
                            </f:facet>
                            <h:outputText value="#{item.lastName}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Picture"/>
                            </f:facet>
                            <h:outputText value="#{item.picture}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Email"/>
                            </f:facet>
                            <h:outputText value="#{item.email}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Active"/>
                            </f:facet>
                            <h:outputText value="#{item.active}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Username"/>
                            </f:facet>
                            <h:outputText value="#{item.username}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Password"/>
                            </f:facet>
                            <h:outputText value="#{item.password}"/>
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
                                <h:outputText value="StoreId"/>
                            </f:facet>
                            <h:outputText value="#{item.storeId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Store"/>
                            </f:facet>
                            <h:outputText value="#{item.store}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{staff.detailSetup}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][staff.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{staff.editSetup}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][staff.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{staff.remove}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][staff.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{staff.createSetup}" value="New Staff"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
