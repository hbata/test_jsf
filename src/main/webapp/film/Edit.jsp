<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Film</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Film</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="FilmId:"/>
                    <h:outputText value="#{film.film.filmId}" title="FilmId" />
                    <h:outputText value="Title:"/>
                    <h:inputText id="title" value="#{film.film.title}" title="Title" required="true" requiredMessage="The title field is required." />
                    <h:outputText value="Description:"/>
                    <h:inputTextarea rows="4" cols="30" id="description" value="#{film.film.description}" title="Description" />
                    <h:outputText value="ReleaseYear (MM/dd/yyyy):"/>
                    <h:inputText id="releaseYear" value="#{film.film.releaseYear}" title="ReleaseYear" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="RentalDuration:"/>
                    <h:inputText id="rentalDuration" value="#{film.film.rentalDuration}" title="RentalDuration" required="true" requiredMessage="The rentalDuration field is required." />
                    <h:outputText value="RentalRate:"/>
                    <h:inputText id="rentalRate" value="#{film.film.rentalRate}" title="RentalRate" required="true" requiredMessage="The rentalRate field is required." />
                    <h:outputText value="Length:"/>
                    <h:inputText id="length" value="#{film.film.length}" title="Length" />
                    <h:outputText value="ReplacementCost:"/>
                    <h:inputText id="replacementCost" value="#{film.film.replacementCost}" title="ReplacementCost" required="true" requiredMessage="The replacementCost field is required." />
                    <h:outputText value="Rating:"/>
                    <h:inputText id="rating" value="#{film.film.rating}" title="Rating" />
                    <h:outputText value="SpecialFeatures:"/>
                    <h:inputText id="specialFeatures" value="#{film.film.specialFeatures}" title="SpecialFeatures" />
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{film.film.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="FilmActorCollection:"/>
                    <h:outputText escape="false" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getCollectionAsString'][film.film.filmActorCollection == null ? jsfcrud_null : film.film.filmActorCollection].jsfcrud_invoke}" title="FilmActorCollection" />
                    <h:outputText value="LanguageId:"/>
                    <h:selectOneMenu id="languageId" value="#{film.film.languageId}" title="LanguageId" required="true" requiredMessage="The languageId field is required." >
                        <f:selectItems value="#{language.languageItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="OriginalLanguageId:"/>
                    <h:selectOneMenu id="originalLanguageId" value="#{film.film.originalLanguageId}" title="OriginalLanguageId" >
                        <f:selectItems value="#{language.languageItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="InventoryCollection:"/>
                    <h:selectManyListbox id="inventoryCollection" value="#{film.film.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].inventoryCollection}" title="InventoryCollection" size="6" converter="#{inventory.converter}" >
                        <f:selectItems value="#{inventory.inventoryItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{film.edit}" value="Save">
                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{film.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][film.film][film.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{film.listSetup}" value="Show All Film Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
