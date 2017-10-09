<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Address</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Address</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{address.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Address:"/>
                    <h:inputText id="address" value="#{address.address.address}" title="Address" required="true" requiredMessage="The address field is required." />
                    <h:outputText value="Address2:"/>
                    <h:inputText id="address2" value="#{address.address.address2}" title="Address2" />
                    <h:outputText value="District:"/>
                    <h:inputText id="district" value="#{address.address.district}" title="District" required="true" requiredMessage="The district field is required." />
                    <h:outputText value="PostalCode:"/>
                    <h:inputText id="postalCode" value="#{address.address.postalCode}" title="PostalCode" />
                    <h:outputText value="Phone:"/>
                    <h:inputText id="phone" value="#{address.address.phone}" title="Phone" required="true" requiredMessage="The phone field is required." />
                    <h:outputText value="Location:"/>
                    <h:inputTextarea rows="4" cols="30" id="location" value="#{address.address.location}" title="Location" required="true" requiredMessage="The location field is required." />
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{address.address.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="CityId:"/>
                    <h:selectOneMenu id="cityId" value="#{address.address.cityId}" title="CityId" required="true" requiredMessage="The cityId field is required." >
                        <f:selectItems value="#{city.cityItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="StaffCollection:"/>
                    <h:selectManyListbox id="staffCollection" value="#{address.address.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].staffCollection}" title="StaffCollection" size="6" converter="#{staff.converter}" >
                        <f:selectItems value="#{staff.staffItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="StoreCollection:"/>
                    <h:selectManyListbox id="storeCollection" value="#{address.address.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].storeCollection}" title="StoreCollection" size="6" converter="#{store.converter}" >
                        <f:selectItems value="#{store.storeItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="CustomerCollection:"/>
                    <h:selectManyListbox id="customerCollection" value="#{address.address.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].customerCollection}" title="CustomerCollection" size="6" converter="#{customer.converter}" >
                        <f:selectItems value="#{customer.customerItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{address.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{address.listSetup}" value="Show All Address Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
