
<%@ page import="org.bworks.bworksdb.Attendance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Attendance List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Attendance</g:link></span>
        </div>
        <div class="body">
            <h1>Attendance List</h1>
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
                    <g:each in="${attendanceInstanceList}" status="i" var="attendanceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${attendanceInstance.id}">${fieldValue(bean:attendanceInstance, field:'id')}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${attendanceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
