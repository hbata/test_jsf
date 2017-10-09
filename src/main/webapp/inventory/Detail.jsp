<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Inventory Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Inventory Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="InventoryId:"/>
                    <h:outputText value="#{inventory.inventory.inventoryId}" title="InventoryId" />
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{inventory.inventory.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="FilmId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{inventory.inventory.filmId}"/>
                        <h:panelGroup rendered="#{inventory.inventory.filmId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{film.detailSetup}">
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory.filmId][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="inventory"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.InventoryController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{film.editSetup}">
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory.filmId][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="inventory"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.InventoryController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{film.destroy}">
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory.filmId][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="inventory"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.InventoryController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="StoreId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{inventory.inventory.storeId}"/>
                        <h:panelGroup rendered="#{inventory.inventory.storeId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{store.detailSetup}">
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory.storeId][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="inventory"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.InventoryController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{store.editSetup}">
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory.storeId][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="inventory"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.InventoryController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{store.destroy}">
                                <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentStore" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory.storeId][store.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="inventory"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.InventoryController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="RentalCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty inventory.inventory.rentalCollection}" value="(No Items)"/>
                        <h:dataTable value="#{inventory.inventory.rentalCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty inventory.inventory.rentalCollection}">
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
                                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rental.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="inventory" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.InventoryController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{rental.editSetup}">
                                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rental.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="inventory" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.InventoryController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{rental.destroy}">
                                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentRental" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rental.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="inventory" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.InventoryController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{inventory.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{inventory.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][inventory.inventory][inventory.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{inventory.createSetup}" value="New Inventory" />
                <br />
                <h:commandLink action="#{inventory.listSetup}" value="Show All Inventory Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
