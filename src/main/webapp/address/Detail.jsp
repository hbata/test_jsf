<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Address Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Address Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="AddressId:"/>
                    <h:outputText value="#{address.address.addressId}" title="AddressId" />
                    <h:outputText value="Address:"/>
                    <h:outputText value="#{address.address.address}" title="Address" />
                    <h:outputText value="Address2:"/>
                    <h:outputText value="#{address.address.address2}" title="Address2" />
                    <h:outputText value="District:"/>
                    <h:outputText value="#{address.address.district}" title="District" />
                    <h:outputText value="PostalCode:"/>
                    <h:outputText value="#{address.address.postalCode}" title="PostalCode" />
                    <h:outputText value="Phone:"/>
                    <h:outputText value="#{address.address.phone}" title="Phone" />
                    <h:outputText value="Location:"/>
                    <h:outputText value="#{address.address.location}" title="Location" />
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{address.address.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="CityId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{address.address.cityId}"/>
                        <h:panelGroup rendered="#{address.address.cityId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{city.detailSetup}">
                                <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address.cityId][city.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="address"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{city.editSetup}">
                                <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address.cityId][city.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="address"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{city.destroy}">
                                <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address.cityId][city.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="address"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="StaffCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty address.address.staffCollection}" value="(No Items)"/>
                        <h:dataTable value="#{address.address.staffCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty address.address.staffCollection}">
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
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="address" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{staff.editSetup}">
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="address" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{staff.destroy}">
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="address" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="StoreCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty address.address.storeCollection}" value="(No Items)"/>
                        <h:dataTable value="#{address.address.storeCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty address.address.storeCollection}">
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
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="address" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{store.editSetup}">
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="address" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{store.destroy}">
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][store.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="address" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="CustomerCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty address.address.customerCollection}" value="(No Items)"/>
                        <h:dataTable value="#{address.address.customerCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty address.address.customerCollection}">
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
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="address" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{customer.editSetup}">
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="address" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{customer.destroy}">
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCustomer" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][customer.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="address" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.AddressController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{address.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{address.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][address.address][address.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{address.createSetup}" value="New Address" />
                <br />
                <h:commandLink action="#{address.listSetup}" value="Show All Address Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
