
<%@ page import="org.bworks.bworksdb.Interest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Interest List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Interest</g:link></span>
        </div>
        <div class="body">
            <h1>Interest List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="active" title="Active" />
                        
                   	        <th>Note</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${interestInstanceList}" status="i" var="interestInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${interestInstance.id}">${fieldValue(bean:interestInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:interestInstance, field:'active')}</td>
                        
                            <td>${fieldValue(bean:interestInstance, field:'note')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${interestInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
