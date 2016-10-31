<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8 />
<meta name=viewport content="width=device-width, initial-scale=1.0" />
<meta http-equiv=X-UA-Compatible content="IE=Edge" />
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" href="<c:url value='/webjars/bootstrap/3.0.1/css/bootstrap.min.css' />" media="screen" />
<script src="<c:url value='/webjars/jquery/2.0.2/jquery.min.js' />"></script>
<script src="<c:url value='/webjars/bootstrap/3.0.1/js/bootstrap.min.js '/>"></script>
</head>
<body>
    <div class="container">
        <header id="header">
            <tiles:insertAttribute name="header" />
        </header>
        <section id="content">
            <tiles:insertAttribute name="content" />
        </section>
        <footer id="footer">
            <tiles:insertAttribute name="footer" />
        </footer>
    </div>
</body>
</html>
