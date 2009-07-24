
<%@ page import="org.bworks.bworksdb.Enrollment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Enrollment List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Enrollment</g:link></span>
        </div>
        <div class="body">
            <h1>Enrollment List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${enrollmentInstanceList}" status="i" var="enrollmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${enrollmentInstance.id}">${fieldValue(bean:enrollmentInstance, field:'id')}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${enrollmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
