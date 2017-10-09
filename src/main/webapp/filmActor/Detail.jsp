<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>FilmActor Detail</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>FilmActor Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="LastUpdate:"/>
                    <h:outputText value="#{filmActor.filmActor.lastUpdate}" title="LastUpdate" >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:outputText>
                    <h:outputText value="Actor:"/>
                    <h:panelGroup>
                        <h:outputText value="#{filmActor.filmActor.actor}"/>
                        <h:panelGroup rendered="#{filmActor.filmActor.actor != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{actor.detailSetup}">
                                <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor][filmActor.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor.actor][actor.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="filmActor"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmActorController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{actor.editSetup}">
                                <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor][filmActor.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor.actor][actor.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="filmActor"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmActorController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{actor.destroy}">
                                <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor][filmActor.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor.actor][actor.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="filmActor"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmActorController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="Film:"/>
                    <h:panelGroup>
                        <h:outputText value="#{filmActor.filmActor.film}"/>
                        <h:panelGroup rendered="#{filmActor.filmActor.film != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{film.detailSetup}">
                                <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor][filmActor.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor.film][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="filmActor"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmActorController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{film.editSetup}">
                                <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor][filmActor.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor.film][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="filmActor"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmActorController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{film.destroy}">
                                <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor][filmActor.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor.film][film.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="filmActor"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.mkyoung.faces.FilmActorController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{filmActor.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor][filmActor.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{filmActor.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][filmActor.filmActor][filmActor.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{filmActor.createSetup}" value="New FilmActor" />
                <br />
                <h:commandLink action="#{filmActor.listSetup}" value="Show All FilmActor Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
