<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Language Items</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Language Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Language Items Found)<br />" rendered="#{language.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{language.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{language.pagingInfo.firstItem + 1}..#{language.pagingInfo.lastItem} of #{language.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{language.prev}" value="Previous #{language.pagingInfo.batchSize}" rendered="#{language.pagingInfo.firstItem >= language.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{language.next}" value="Next #{language.pagingInfo.batchSize}" rendered="#{language.pagingInfo.lastItem + language.pagingInfo.batchSize <= language.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{language.next}" value="Remaining #{language.pagingInfo.itemCount - language.pagingInfo.lastItem}"
                                   rendered="#{language.pagingInfo.lastItem < language.pagingInfo.itemCount && language.pagingInfo.lastItem + language.pagingInfo.batchSize > language.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{language.languageItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="LanguageId"/>
                            </f:facet>
                            <h:outputText value="#{item.languageId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Name"/>
                            </f:facet>
                            <h:outputText value="#{item.name}"/>
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
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{language.detailSetup}">
                                <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][language.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{language.editSetup}">
                                <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][language.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{language.remove}">
                                <f:param name="jsfcrud.currentLanguage" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][language.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{language.createSetup}" value="New Language"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
