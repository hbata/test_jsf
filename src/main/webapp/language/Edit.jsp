<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Language</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Language</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="LanguageId:"/>
                    <h:outputText value="#{language.language.languageId}" title="LanguageId" />
                    <h:outputText value="Name:"/>
                    <h:inputText id="name" value="#{language.language.name}" title="Name" required="true" requiredMessage="The name field is required." />
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{language.language.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="FilmCollection:"/>
                    <h:selectManyListbox id="filmCollection" value="#{language.language.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].filmCollection}" title="FilmCollection" size="6" converter="#{film.converter}" >
                        <f:selectItems value="#{film.filmItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="FilmCollection1:"/>
                    <h:selectManyListbox id="filmCollection1" value="#{language.language.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].filmCollection1}" title="FilmCollection1" size="6" converter="#{film.converter}" >
                        <f:selectItems value="#{film.filmItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{language.edit}" value="Save">
                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{language.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][language.language][language.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{language.listSetup}" value="Show All Language Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
