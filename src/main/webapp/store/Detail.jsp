<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Store Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Store Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="StoreId:"/>
                    <h:outputText value="#{store.store.storeId}" title="StoreId" />
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{store.store.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="AddressId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{store.store.addressId}"/>
                        <h:panelGroup rendered="#{store.store.addressId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{address.detailSetup}">
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store.addressId][address.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="store"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{address.editSetup}">
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store.addressId][address.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="store"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{address.destroy}">
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store.addressId][address.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="store"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="ManagerStaffId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{store.store.managerStaffId}"/>
                        <h:panelGroup rendered="#{store.store.managerStaffId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{staff.detailSetup}">
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store.managerStaffId][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="store"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{staff.editSetup}">
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store.managerStaffId][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="store"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{staff.destroy}">
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store.managerStaffId][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="store"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="StaffCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty store.store.staffCollection}" value="(No Items)"/>
                        <h:dataTable value="#{store.store.staffCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty store.store.staffCollection}">
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
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="store" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{staff.editSetup}">
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="store" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{staff.destroy}">
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="store" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="InventoryCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty store.store.inventoryCollection}" value="(No Items)"/>
                        <h:dataTable value="#{store.store.inventoryCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty store.store.inventoryCollection}">
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
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][inventory.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="store" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{inventory.editSetup}">
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][inventory.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="store" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{inventory.destroy}">
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][inventory.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="store" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="CustomerCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty store.store.customerCollection}" value="(No Items)"/>
                        <h:dataTable value="#{store.store.customerCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty store.store.customerCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="CustomerId"/>
                                </f:facet>
                                <h:outputText value="#{item.customerId}"/>
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
                                    <h:outputText value="CreateDate"/>
                                </f:facet>
                                <h:outputText value="#{item.createDate}">
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
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{customer.detailSetup}">
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="store" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{customer.editSetup}">
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="store" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{customer.destroy}">
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="store" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StoreController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{store.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{store.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][store.store][store.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{store.createSetup}" value="New Store" />
                <br />
                <h:commandLink action="#{store.listSetup}" value="Show All Store Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
