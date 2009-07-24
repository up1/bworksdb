
<%@ page import="org.bworks.bworksdb.LessonDate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit LessonDate</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LessonDate List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LessonDate</g:link></span>
        </div>
        <div class="body">
            <h1>Edit LessonDate</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${lessonDateInstance}">
            <div class="errors">
                <g:renderErrors bean="${lessonDateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${lessonDateInstance?.id}" />
                <input type="hidden" name="version" value="${lessonDateInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="attendees">Attendees:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lessonDateInstance,field:'attendees','errors')}">
                                    <g:select name="attendees"
from="${org.bworks.bworksdb.Attendance.list()}"
size="5" multiple="yes" optionKey="id"
value="${lessonDateInstance?.attendees}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lessonDate">Lesson Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lessonDateInstance,field:'lessonDate','errors')}">
                                    <g:datePicker name="lessonDate" value="${lessonDateInstance?.lessonDate}" precision="minute" ></g:datePicker>
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
