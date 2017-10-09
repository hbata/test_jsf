<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>City Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>City Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="CityId:"/>
                    <h:outputText value="#{city.city.cityId}" title="CityId" />
                    <h:outputText value="City:"/>
                    <h:outputText value="#{city.city.city}" title="City" />
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{city.city.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="CountryId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{city.city.countryId}"/>
                        <h:panelGroup rendered="#{city.city.countryId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{country.detailSetup}">
                                <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city.countryId][country.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="city"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.CityController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{country.editSetup}">
                                <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city.countryId][country.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="city"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.CityController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{country.destroy}">
                                <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCountry" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city.countryId][country.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="city"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.CityController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="AddressCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty city.city.addressCollection}" value="(No Items)"/>
                        <h:dataTable value="#{city.city.addressCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty city.city.addressCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="AddressId"/>
                                </f:facet>
                                <h:outputText value="#{item.addressId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Address"/>
                                </f:facet>
                                <h:outputText value="#{item.address}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Address2"/>
                                </f:facet>
                                <h:outputText value="#{item.address2}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="District"/>
                                </f:facet>
                                <h:outputText value="#{item.district}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="PostalCode"/>
                                </f:facet>
                                <h:outputText value="#{item.postalCode}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Phone"/>
                                </f:facet>
                                <h:outputText value="#{item.phone}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Location"/>
                                </f:facet>
                                <h:outputText value="#{item.location}"/>
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
                                    <h:outputText value="CityId"/>
                                </f:facet>
                                <h:outputText value="#{item.cityId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{address.detailSetup}">
                                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="city" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.CityController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{address.editSetup}">
                                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="city" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.CityController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{address.destroy}">
                                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentAddress" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][address.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="city" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.CityController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{city.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{city.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentCity" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][city.city][city.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{city.createSetup}" value="New City" />
                <br />
                <h:commandLink action="#{city.listSetup}" value="Show All City Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
