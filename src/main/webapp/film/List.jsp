<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Film Items</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Film Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Film Items Found)<br />" rendered="#{film.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{film.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{film.pagingInfo.firstItem + 1}..#{film.pagingInfo.lastItem} of #{film.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{film.prev}" value="Previous #{film.pagingInfo.batchSize}" rendered="#{film.pagingInfo.firstItem >= film.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{film.next}" value="Next #{film.pagingInfo.batchSize}" rendered="#{film.pagingInfo.lastItem + film.pagingInfo.batchSize <= film.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{film.next}" value="Remaining #{film.pagingInfo.itemCount - film.pagingInfo.lastItem}"
                                   rendered="#{film.pagingInfo.lastItem < film.pagingInfo.itemCount && film.pagingInfo.lastItem + film.pagingInfo.batchSize > film.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{film.filmItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][film.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{film.editSetup}">
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][film.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{film.remove}">
                                <f:param name="jsfcrud.currentFilm" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][film.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{film.createSetup}" value="New Film"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
