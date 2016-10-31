<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-striped">
    <caption>This is Data Table</caption>
    <thead>
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>SpeakerName</th>
            <th>Summary</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${presentations}" var="item">
            <tr>
                <td><c:if test="${item.id % 2 == 0}">
                                *
                            </c:if> <c:out value="${item.id}" /></td>
                <td><c:out value="${item.title}" /></td>
                <td><c:out value="${item.speakerName}" /></td>
                <td><c:out value="${item.summary}" escapeXml="false" /></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
