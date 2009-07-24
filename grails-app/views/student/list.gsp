
<%@ page import="org.bworks.bworksdb.Student" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Student List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Student</g:link></span>
        </div>
        <div class="body">
            <h1>Student List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="birthDate" title="Birth Date" />
                        
                   	        <g:sortableColumn property="firstName" title="First Name" />
                        
                   	        <g:sortableColumn property="gender" title="Gender" />
                        
                   	        <g:sortableColumn property="lastName" title="Last Name" />
                        
                   	        <g:sortableColumn property="middleName" title="Middle Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${studentInstanceList}" status="i" var="studentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${studentInstance.id}">${fieldValue(bean:studentInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:studentInstance, field:'birthDate')}</td>
                        
                            <td>${fieldValue(bean:studentInstance, field:'firstName')}</td>
                        
                            <td>${fieldValue(bean:studentInstance, field:'gender')}</td>
                        
                            <td>${fieldValue(bean:studentInstance, field:'lastName')}</td>
                        
                            <td>${fieldValue(bean:studentInstance, field:'middleName')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${studentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
