
<%@ page import="org.bworks.bworksdb.PhoneNumber" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>PhoneNumber List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New PhoneNumber</g:link></span>
        </div>
        <div class="body">
            <h1>PhoneNumber List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="phoneNumber" title="Phone Number" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${phoneNumberInstanceList}" status="i" var="phoneNumberInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${phoneNumberInstance.id}">${fieldValue(bean:phoneNumberInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:phoneNumberInstance, field:'phoneNumber')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${phoneNumberInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
