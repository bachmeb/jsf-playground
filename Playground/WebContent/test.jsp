<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<f:view>
    <html lang="en">
        <head>
            <title>Insert title here</title>
        </head>
        <body>
            
            
            
            <h:form>
    <h:outputLabel for="input" value="Enter your name:" />
    <h:inputText id="input" value="#{myBean.input}" required="true" />
    <h:commandButton value="submit" action="#{myBean.action}" />
    <h:outputText value="#{myBean.output}" />
    <h:messages />
</h:form>
            
            
            
        </body>
    </html>
</f:view>