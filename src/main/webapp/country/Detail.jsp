<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Country Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Country Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="CountryId:"/>
                    <h:outputText value="#{country.country.countryId}" title="CountryId" />
                    <h:outputText value="Country:"/>
                    <h:outputText value="#{country.country.country}" title="Country" />
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{country.country.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>

                    <h:outputText value="CityCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty country.country.cityCollection}" value="(No Items)"/>
                        <h:dataTable value="#{country.country.cityCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty country.country.cityCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="CityId"/>
                                </f:facet>
                                <h:outputText value="#{item.cityId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="City"/>
                                </f:facet>
                                <h:outputText value="#{item.city}"/>
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
                                    <h:outputText value="CountryId"/>
                                </f:facet>
                                <h:outputText value="#{item.countryId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{city.detailSetup}">
                                    <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][country.country][country.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][city.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="country" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.CountryController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{city.editSetup}">
                                    <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][country.country][country.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][city.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="country" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.CountryController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{city.destroy}">
                                    <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][country.country][country.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][city.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="country" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.CountryController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{country.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][country.country][country.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{country.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][country.country][country.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{country.createSetup}" value="New Country" />
                <br />
                <h:commandLink action="#{country.listSetup}" value="Show All Country Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
