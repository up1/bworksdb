
<%@ page import="org.bworks.bworksdb.ClassSession" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit ClassSession</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ClassSession List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ClassSession</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ClassSession</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${classSessionInstance}">
            <div class="errors">
                <g:renderErrors bean="${classSessionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${classSessionInstance?.id}" />
                <input type="hidden" name="version" value="${classSessionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enrollments">Enrollments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classSessionInstance,field:'enrollments','errors')}">
                                    <g:select name="enrollments"
from="${org.bworks.bworksdb.Enrollment.list()}"
size="5" multiple="yes" optionKey="id"
value="${classSessionInstance?.enrollments}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lessonDates">Lesson Dates:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classSessionInstance,field:'lessonDates','errors')}">
                                    <g:select name="lessonDates"
from="${org.bworks.bworksdb.LessonDate.list()}"
size="5" multiple="yes" optionKey="id"
value="${classSessionInstance?.lessonDates}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classSessionInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:classSessionInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="note">Note:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classSessionInstance,field:'note','errors')}">
                                    <g:select optionKey="id" from="${org.bworks.bworksdb.Note.list()}" name="note.id" value="${classSessionInstance?.note?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classSessionInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${classSessionInstance?.startDate}" precision="minute" ></g:datePicker>
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
