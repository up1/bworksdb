
<%@ page import="org.bworks.bworksdb.Program" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Program</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Program List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Program</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Program</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${programInstance}">
            <div class="errors">
                <g:renderErrors bean="${programInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${programInstance?.id}" />
                <input type="hidden" name="version" value="${programInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="classSessions">Class Sessions:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:programInstance,field:'classSessions','errors')}">
                                    <g:select name="classSessions"
from="${org.bworks.bworksdb.ClassSession.list()}"
size="5" multiple="yes" optionKey="id"
value="${programInstance?.classSessions}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:programInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:programInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="interests">Interests:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:programInstance,field:'interests','errors')}">
                                    <g:select name="interests"
from="${org.bworks.bworksdb.Interest.list()}"
size="5" multiple="yes" optionKey="id"
value="${programInstance?.interests}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lessons">Lessons:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:programInstance,field:'lessons','errors')}">
                                    <g:select name="lessons"
from="${org.bworks.bworksdb.Lesson.list()}"
size="5" multiple="yes" optionKey="id"
value="${programInstance?.lessons}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:programInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:programInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
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
