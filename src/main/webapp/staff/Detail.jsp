<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Staff Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Staff Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="StaffId:"/>
                    <h:outputText value="#{staff.staff.staffId}" title="StaffId" />
                    <h:outputText value="FirstName:"/>
                    <h:outputText value="#{staff.staff.firstName}" title="FirstName" />
                    <h:outputText value="LastName:"/>
                    <h:outputText value="#{staff.staff.lastName}" title="LastName" />
                    <h:outputText value="Picture:"/>
                    <h:outputText value="#{staff.staff.picture}" title="Picture" />
                    <h:outputText value="Email:"/>
                    <h:outputText value="#{staff.staff.email}" title="Email" />
                    <h:outputText value="Active:"/>
                    <h:outputText value="#{staff.staff.active}" title="Active" />
                    <h:outputText value="Username:"/>
                    <h:outputText value="#{staff.staff.username}" title="Username" />
                    <h:outputText value="Password:"/>
                    <h:outputText value="#{staff.staff.password}" title="Password" />
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{staff.staff.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="AddressId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{staff.staff.addressId}"/>
                        <h:panelGroup rendered="#{staff.staff.addressId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{address.detailSetup}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff.addressId][address.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="staff"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{address.editSetup}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff.addressId][address.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="staff"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{address.destroy}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff.addressId][address.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="staff"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="StoreId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{staff.staff.storeId}"/>
                        <h:panelGroup rendered="#{staff.staff.storeId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{store.detailSetup}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff.storeId][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="staff"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{store.editSetup}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff.storeId][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="staff"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{store.destroy}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff.storeId][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="staff"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="Store:"/>
                    <h:panelGroup>
                        <h:outputText value="#{staff.staff.store}"/>
                        <h:panelGroup rendered="#{staff.staff.store != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{store.detailSetup}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff.store][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="staff"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{store.editSetup}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff.store][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="staff"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{store.destroy}">
                                <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff.store][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="staff"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="RentalCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty staff.staff.rentalCollection}" value="(No Items)"/>
                        <h:dataTable value="#{staff.staff.rentalCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty staff.staff.rentalCollection}">
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
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rental.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="staff" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{rental.editSetup}">
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rental.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="staff" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{rental.destroy}">
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rental.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="staff" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="PaymentCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty staff.staff.paymentCollection}" value="(No Items)"/>
                        <h:dataTable value="#{staff.staff.paymentCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty staff.staff.paymentCollection}">
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
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][payment.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="staff" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{payment.editSetup}">
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][payment.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="staff" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{payment.destroy}">
                                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPayment" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][payment.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="staff" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.StaffController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{staff.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{staff.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{staff.createSetup}" value="New Staff" />
                <br />
                <h:commandLink action="#{staff.listSetup}" value="Show All Staff Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
