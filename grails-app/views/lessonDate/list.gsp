
<%@ page import="org.bworks.bworksdb.LessonDate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>LessonDate List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New LessonDate</g:link></span>
        </div>
        <div class="body">
            <h1>LessonDate List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="lessonDate" title="Lesson Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${lessonDateInstanceList}" status="i" var="lessonDateInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${lessonDateInstance.id}">${fieldValue(bean:lessonDateInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:lessonDateInstance, field:'lessonDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${lessonDateInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
