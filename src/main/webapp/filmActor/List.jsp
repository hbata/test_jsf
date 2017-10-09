<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing FilmActor Items</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing FilmActor Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No FilmActor Items Found)<br />" rendered="#{filmActor.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{filmActor.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{filmActor.pagingInfo.firstItem + 1}..#{filmActor.pagingInfo.lastItem} of #{filmActor.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{filmActor.prev}" value="Previous #{filmActor.pagingInfo.batchSize}" rendered="#{filmActor.pagingInfo.firstItem >= filmActor.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{filmActor.next}" value="Next #{filmActor.pagingInfo.batchSize}" rendered="#{filmActor.pagingInfo.lastItem + filmActor.pagingInfo.batchSize <= filmActor.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{filmActor.next}" value="Remaining #{filmActor.pagingInfo.itemCount - filmActor.pagingInfo.lastItem}"
                                   rendered="#{filmActor.pagingInfo.lastItem < filmActor.pagingInfo.itemCount && filmActor.pagingInfo.lastItem + filmActor.pagingInfo.batchSize > filmActor.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{filmActor.filmActorItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                                <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][filmActor.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{filmActor.editSetup}">
                                <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][filmActor.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{filmActor.remove}">
                                <f:param name="jsfcrud.currentFilmActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][filmActor.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{filmActor.createSetup}" value="New FilmActor"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
