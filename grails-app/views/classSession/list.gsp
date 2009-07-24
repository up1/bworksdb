
<%@ page import="org.bworks.bworksdb.ClassSession" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ClassSession List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ClassSession</g:link></span>
        </div>
        <div class="body">
            <h1>ClassSession List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <th>Note</th>
                   	    
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classSessionInstanceList}" status="i" var="classSessionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${classSessionInstance.id}">${fieldValue(bean:classSessionInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:classSessionInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:classSessionInstance, field:'note')}</td>
                        
                            <td>${fieldValue(bean:classSessionInstance, field:'startDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${classSessionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
