<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8 />
<meta name=viewport content="width=device-width, initial-scale=1.0" />
<meta http-equiv=X-UA-Compatible content="IE=Edge" />
<title>JSP</title>
<link rel="stylesheet" href="${ctx}/webjars/bootstrap/3.0.1/css/bootstrap.min.css" media="screen" />
<script src="${ctx}/webjars/jquery/2.0.2/jquery.min.js"></script>
<script src="${ctx}/webjars/bootstrap/3.0.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <header>
            <%@ include file="header.jspf" %>
            <h2>JSP</h2>
            <hr />
        </header>
        <section>
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
        </section>
        <footer>
            <hr />
            <h2>Thymeleaf 3</h2>
            <%@ include file="footer.jspf" %>
        </footer>
    </div>
</body>
</html>
