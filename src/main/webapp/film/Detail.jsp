<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Film Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Film Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="FilmId:"/>
                    <h:outputText value="#{film.film.filmId}" title="FilmId" />
                    <h:outputText value="Title:"/>
                    <h:outputText value="#{film.film.title}" title="Title" />
                    <h:outputText value="Description:"/>
                    <h:outputText value="#{film.film.description}" title="Description" />
                    <h:outputText value="ReleaseYear:"/>
                    <h:outputText value="#{film.film.releaseYear}" title="ReleaseYear" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="RentalDuration:"/>
                    <h:outputText value="#{film.film.rentalDuration}" title="RentalDuration" />
                    <h:outputText value="RentalRate:"/>
                    <h:outputText value="#{film.film.rentalRate}" title="RentalRate" />
                    <h:outputText value="Length:"/>
                    <h:outputText value="#{film.film.length}" title="Length" />
                    <h:outputText value="ReplacementCost:"/>
                    <h:outputText value="#{film.film.replacementCost}" title="ReplacementCost" />
                    <h:outputText value="Rating:"/>
                    <h:outputText value="#{film.film.rating}" title="Rating" />
                    <h:outputText value="SpecialFeatures:"/>
                    <h:outputText value="#{film.film.specialFeatures}" title="SpecialFeatures" />
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{film.film.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="LanguageId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{film.film.languageId}"/>
                        <h:panelGroup rendered="#{film.film.languageId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{language.detailSetup}">
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film.languageId][language.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="film"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{language.editSetup}">
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film.languageId][language.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="film"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{language.destroy}">
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film.languageId][language.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="film"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="OriginalLanguageId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{film.film.originalLanguageId}"/>
                        <h:panelGroup rendered="#{film.film.originalLanguageId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{language.detailSetup}">
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film.originalLanguageId][language.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="film"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{language.editSetup}">
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film.originalLanguageId][language.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="film"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{language.destroy}">
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film.originalLanguageId][language.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="film"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="FilmActorCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty film.film.filmActorCollection}" value="(No Items)"/>
                        <h:dataTable value="#{film.film.filmActorCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty film.film.filmActorCollection}">
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
                                    <h:outputText value="Actor"/>
                                </f:facet>
                                <h:outputText value="#{item.actor}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Film"/>
                                </f:facet>
                                <h:outputText value="#{item.film}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{filmActor.detailSetup}">
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][filmActor.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="film" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{filmActor.editSetup}">
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][filmActor.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="film" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{filmActor.destroy}">
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][filmActor.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="film" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="InventoryCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty film.film.inventoryCollection}" value="(No Items)"/>
                        <h:dataTable value="#{film.film.inventoryCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty film.film.inventoryCollection}">
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
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][inventory.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="film" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{inventory.editSetup}">
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][inventory.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="film" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{inventory.destroy}">
                                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentInventory" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][inventory.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="film" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{film.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{film.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{film.createSetup}" value="New Film" />
                <br />
                <h:commandLink action="#{film.listSetup}" value="Show All Film Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
