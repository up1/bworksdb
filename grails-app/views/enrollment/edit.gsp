
<%@ page import="org.bworks.bworksdb.Enrollment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Enrollment</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Enrollment List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Enrollment</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Enrollment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${enrollmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${enrollmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${enrollmentInstance?.id}" />
                <input type="hidden" name="version" value="${enrollmentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
