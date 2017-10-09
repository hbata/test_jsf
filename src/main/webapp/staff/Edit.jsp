<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Staff</title>
            <link rel="stylesheet" type="text/css" href="/jsf_1/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Staff</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="StaffId:"/>
                    <h:outputText value="#{staff.staff.staffId}" title="StaffId" />
                    <h:outputText value="FirstName:"/>
                    <h:inputText id="firstName" value="#{staff.staff.firstName}" title="FirstName" required="true" requiredMessage="The firstName field is required." />
                    <h:outputText value="LastName:"/>
                    <h:inputText id="lastName" value="#{staff.staff.lastName}" title="LastName" required="true" requiredMessage="The lastName field is required." />
                    <h:outputText value="Picture:"/>
                    <h:inputTextarea rows="4" cols="30" id="picture" value="#{staff.staff.picture}" title="Picture" />
                    <h:outputText value="Email:"/>
                    <h:inputText id="email" value="#{staff.staff.email}" title="Email" />
                    <h:outputText value="Active:"/>
                    <h:inputText id="active" value="#{staff.staff.active}" title="Active" required="true" requiredMessage="The active field is required." />
                    <h:outputText value="Username:"/>
                    <h:inputText id="username" value="#{staff.staff.username}" title="Username" required="true" requiredMessage="The username field is required." />
                    <h:outputText value="Password:"/>
                    <h:inputText id="password" value="#{staff.staff.password}" title="Password" />
                    <h:outputText value="LastUpdate (MM/dd/yyyy HH:mm:ss):"/>
                    <h:inputText id="lastUpdate" value="#{staff.staff.lastUpdate}" title="LastUpdate" required="true" requiredMessage="The lastUpdate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy HH:mm:ss" />
                    </h:inputText>
                    <h:outputText value="AddressId:"/>
                    <h:selectOneMenu id="addressId" value="#{staff.staff.addressId}" title="AddressId" required="true" requiredMessage="The addressId field is required." >
                        <f:selectItems value="#{address.addressItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="StoreId:"/>
                    <h:selectOneMenu id="storeId" value="#{staff.staff.storeId}" title="StoreId" required="true" requiredMessage="The storeId field is required." >
                        <f:selectItems value="#{store.storeItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="Store:"/>
                    <h:selectOneMenu id="store" value="#{staff.staff.store}" title="Store" >
                        <f:selectItems value="#{store.storeItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="RentalCollection:"/>
                    <h:selectManyListbox id="rentalCollection" value="#{staff.staff.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].rentalCollection}" title="RentalCollection" size="6" converter="#{rental.converter}" >
                        <f:selectItems value="#{rental.rentalItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="PaymentCollection:"/>
                    <h:selectManyListbox id="paymentCollection" value="#{staff.staff.jsfcrud_transform[jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method.arrayToList].paymentCollection}" title="PaymentCollection" size="6" converter="#{payment.converter}" >
                        <f:selectItems value="#{payment.paymentItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{staff.edit}" value="Save">
                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{staff.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentStaff" value="#{jsfcrud_class['com.mkyoung.faces.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][staff.staff][staff.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{staff.listSetup}" value="Show All Staff Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
