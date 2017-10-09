<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Actor Items</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Actor Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Actor Items Found)<br />" rendered="#{actor.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{actor.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{actor.pagingInfo.firstItem + 1}..#{actor.pagingInfo.lastItem} of #{actor.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{actor.prev}" value="Previous #{actor.pagingInfo.batchSize}" rendered="#{actor.pagingInfo.firstItem >= actor.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{actor.next}" value="Next #{actor.pagingInfo.batchSize}" rendered="#{actor.pagingInfo.lastItem + actor.pagingInfo.batchSize <= actor.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{actor.next}" value="Remaining #{actor.pagingInfo.itemCount - actor.pagingInfo.lastItem}"
                                   rendered="#{actor.pagingInfo.lastItem < actor.pagingInfo.itemCount && actor.pagingInfo.lastItem + actor.pagingInfo.batchSize > actor.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{actor.actorItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ActorId"/>
                            </f:facet>
                            <h:outputText value="#{item.actorId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="FirstName"/>
                            </f:facet>
                            <h:outputText value="#{item.firstName}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="LastName"/>
                            </f:facet>
                            <h:outputText value="#{item.lastName}"/>
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
                            <h:commandLink value="Show" action="#{actor.detailSetup}">
                                <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][actor.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{actor.editSetup}">
                                <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][actor.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{actor.remove}">
                                <f:param name="jsfcrud.currentActor" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][actor.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{actor.createSetup}" value="New Actor"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
