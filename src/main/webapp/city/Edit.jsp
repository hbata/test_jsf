<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing City</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing City</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="CityId:"/>
                    <h:outputText value="#{city.city.cityId}" title="CityId" />
                    <h:outputText value="City:"/>
                    <h:inputText id="city" value="#{city.city.city}" title="City" required="true" requiredMessage="The city field is required." />
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{city.city.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="AddressCollection:"/>
                    <h:selectManyListbox id="addressCollection" value="#{city.city.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].addressCollection}" title="AddressCollection" size="6" converter="#{address.converter}" >
                        <f:selectItems value="#{address.addressItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="CountryId:"/>
                    <h:selectOneMenu id="countryId" value="#{city.city.countryId}" title="CountryId" required="true" requiredMessage="The countryId field is required." >
                        <f:selectItems value="#{country.countryItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{city.edit}" value="Save">
                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{city.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{city.listSetup}" value="Show All City Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
