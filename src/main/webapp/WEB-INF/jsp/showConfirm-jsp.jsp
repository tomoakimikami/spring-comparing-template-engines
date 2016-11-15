<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="utf-8"/>
<title>JSP/JSTL</title>
<c:import url="head.jsp" />
</head>
<body>
    <div class="container">
        <header>
            <c:import url="header.jsp" charEncoding="UTF-8" />
        </header>
        <section class="content">
            <div class="row">
                <spring:url value="/complete" var="url" htmlEscape="true" />
                <form:form cssClass="form-horizontal" action="${url}" method="POST" modelAttribute="presentation">
                    <!-- ID -->
                    <div class="form-group">
                        <div class="col-md-2">
                            <!-- ラベル -->
                            <form:label class="control-label" path="id"> ID </form:label>
                        </div>
                        <div class="col-md-10">
                            <!-- コントロール -->
                            <p class="form-control-static">
                            <spring:bind path="id">${status.value}</spring:bind>
                            </>
                        </div>
                    </div>

                    <!-- タイトル -->
                    <div class="form-group" >
                        <div class="col-md-2">
                            <!-- ラベル -->
                            <form:label class="control-label" path="title">タイトル </form:label>
                        </div>
                        <div class="col-md-10">
                            <!-- コントロール -->
                            <p class="form-control-static">
                            <spring:bind path="title">${status.value}</spring:bind>
                            </p>
                        </div>
                    </div>

                    <!-- スピーカー -->
                    <div class="form-group" >
                        <div class="col-md-2">
                            <!-- ラベル -->
                            <form:label class="control-label" path="speakerName">スピーカー </form:label>
                        </div>
                        <div class="col-md-10">
                            <!-- コントロール -->
                            <p class="form-control-static">
                            <spring:bind path="speakerName">${status.value}</spring:bind>
                            </p>
                        </div>
                    </div>

                    <!-- サマリー -->
                    <div class="form-group" >
                        <div class="col-md-2">
                            <!-- ラベル -->
                            <form:label class="control-label" path="summary"> サマリー </form:label>
                        </div>
                        <div class="col-md-10">
                            <!-- コントロール -->
                            <p class="form-control-static">
                            <spring:bind path="summary">${status.value}</spring:bind>
                            </p>
                        </div>
                    </div>

                    <!-- ルーム -->
                    <div class="form-group">
                        <div class="col-md-2">
                            <!-- ラベル -->
                            <form:label class="control-label" path="room"> ルーム </form:label>
                        </div>
                        <div class="col-md-10">
                            <!-- コントロール -->
                            <p class="form-control-static">
                            <spring:bind path="room">${status.value}</spring:bind>
                            </p>
                        </div>
                    </div>

                    <!-- 開始日付 -->
                    <div class="form-group">
                        <div class="col-md-2">
                            <!-- ラベル -->
                            <form:label class="control-label" path="startTime">開始日付 </form:label>
                        </div>
                        <div class="col-md-10">
                            <!-- コントロール -->
                            <p class="form-control-static">
                            <spring:bind path="startTime">${status.value}</spring:bind>
                            </p>
                        </div>
                    </div>

                    <!-- 終了日付 -->
                    <div class="form-group">
                        <div class="col-md-2">
                            <!-- ラベル -->
                            <form:label class="control-label" path="endTime">終了日付 </form:label>
                        </div>
                        <div class="col-md-10">
                            <!-- コントロール -->
                            <p class="form-control-static">
                            <spring:bind path="endTime">${status.value}</spring:bind>
                            </p>
                        </div>
                    </div>

                    <!-- 操作ボタン -->
                    <div class="row">
                        <div class="col-md-offset-10 col-md-2">
                            <button class="btn btn-primary" type="submit">登録</button>
                            <a class="btn btn-default" href="/showForm">戻る</a>
                        </div>
                    </div>
                </form:form>
            </div>
        </section>
        <footer>
            <c:import url="footer.jsp" charEncoding="UTF-8" />
        </footer>
    </div>
</body>
</html>
