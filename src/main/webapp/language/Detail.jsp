<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Language Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Language Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="LanguageId:"/>
                    <h:outputText value="#{language.language.languageId}" title="LanguageId" />
                    <h:outputText value="Name:"/>
                    <h:outputText value="#{language.language.name}" title="Name" />
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{language.language.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>

                    <h:outputText value="FilmCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty language.language.filmCollection}" value="(No Items)"/>
                        <h:dataTable value="#{language.language.filmCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty language.language.filmCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="FilmId"/>
                                </f:facet>
                                <h:outputText value="#{item.filmId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Title"/>
                                </f:facet>
                                <h:outputText value="#{item.title}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Description"/>
                                </f:facet>
                                <h:outputText value="#{item.description}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ReleaseYear"/>
                                </f:facet>
                                <h:outputText value="#{item.releaseYear}">
                                    <f:convertDateTime pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="RentalDuration"/>
                                </f:facet>
                                <h:outputText value="#{item.rentalDuration}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="RentalRate"/>
                                </f:facet>
                                <h:outputText value="#{item.rentalRate}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Length"/>
                                </f:facet>
                                <h:outputText value="#{item.length}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ReplacementCost"/>
                                </f:facet>
                                <h:outputText value="#{item.replacementCost}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Rating"/>
                                </f:facet>
                                <h:outputText value="#{item.rating}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="SpecialFeatures"/>
                                </f:facet>
                                <h:outputText value="#{item.specialFeatures}"/>
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
                                    <h:outputText value="LanguageId"/>
                                </f:facet>
                                <h:outputText value="#{item.languageId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="OriginalLanguageId"/>
                                </f:facet>
                                <h:outputText value="#{item.originalLanguageId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{film.detailSetup}">
                                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="language" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.LanguageController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{film.editSetup}">
                                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="language" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.LanguageController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{film.destroy}">
                                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="language" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.LanguageController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="FilmCollection1:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty language.language.filmCollection1}" value="(No Items)"/>
                        <h:dataTable value="#{language.language.filmCollection1}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty language.language.filmCollection1}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="FilmId"/>
                                </f:facet>
                                <h:outputText value="#{item.filmId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Title"/>
                                </f:facet>
                                <h:outputText value="#{item.title}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Description"/>
                                </f:facet>
                                <h:outputText value="#{item.description}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ReleaseYear"/>
                                </f:facet>
                                <h:outputText value="#{item.releaseYear}">
                                    <f:convertDateTime pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="RentalDuration"/>
                                </f:facet>
                                <h:outputText value="#{item.rentalDuration}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="RentalRate"/>
                                </f:facet>
                                <h:outputText value="#{item.rentalRate}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Length"/>
                                </f:facet>
                                <h:outputText value="#{item.length}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ReplacementCost"/>
                                </f:facet>
                                <h:outputText value="#{item.replacementCost}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Rating"/>
                                </f:facet>
                                <h:outputText value="#{item.rating}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="SpecialFeatures"/>
                                </f:facet>
                                <h:outputText value="#{item.specialFeatures}"/>
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
                                    <h:outputText value="LanguageId"/>
                                </f:facet>
                                <h:outputText value="#{item.languageId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="OriginalLanguageId"/>
                                </f:facet>
                                <h:outputText value="#{item.originalLanguageId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{film.detailSetup}">
                                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="language" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.LanguageController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{film.editSetup}">
                                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="language" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.LanguageController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{film.destroy}">
                                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="language" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.LanguageController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{language.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{language.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{language.createSetup}" value="New Language" />
                <br />
                <h:commandLink action="#{language.listSetup}" value="Show All Language Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
