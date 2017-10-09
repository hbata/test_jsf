<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Country</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Country</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="CountryId:"/>
                    <h:outputText value="#{country.country.countryId}" title="CountryId" />
                    <h:outputText value="Country:"/>
                    <h:inputText id="country" value="#{country.country.country}" title="Country" required="true" requiredMessage="The country field is required." />
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{country.country.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="CityCollection:"/>
                    <h:selectManyListbox id="cityCollection" value="#{country.country.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].cityCollection}" title="CityCollection" size="6" converter="#{city.converter}" >
                        <f:selectItems value="#{city.cityItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{country.edit}" value="Save">
                    <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][country.country][country.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{country.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][country.country][country.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{country.listSetup}" value="Show All Country Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
