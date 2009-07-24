
<%@ page import="org.bworks.bworksdb.Lesson" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Lesson List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Lesson</g:link></span>
        </div>
        <div class="body">
            <h1>Lesson List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="sequence" title="Sequence" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${lessonInstanceList}" status="i" var="lessonInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${lessonInstance.id}">${fieldValue(bean:lessonInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:lessonInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:lessonInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:lessonInstance, field:'sequence')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${lessonInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
