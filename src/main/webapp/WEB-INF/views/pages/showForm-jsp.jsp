<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="row">
    <spring:url value="/showConfirm" var="url" htmlEscape="true" />
    <form:form cssClass="form-horizontal" action="${url}" method="POST" modelAttribute="presentation">
        <!-- ID -->
        <div class="form-group">
            <div class="col-md-2">
                <!-- ラベル -->
                <form:label class="control-label" path="id"> ID </form:label>
            </div>
            <div class="col-md-10">
                <!-- コントロール -->
                <form:input type="text" cssClass="form-control" id="id" path="id" readonly="true" />
            </div>
        </div>

        <!-- タイトル -->
        <div class="form-group ${errors.getFieldErrorCount('title') > 0 ? 'has-error' : ''}">
            <div class="col-md-2">
                <!-- ラベル -->
                <form:label class="control-label" path="title">タイトル </form:label>
            </div>
            <div class="col-md-10">
                <!-- コントロール -->
                <form:input type="text" cssClass="form-control" cssErrorClass="has-error" id="title" path="title" />
                <!-- エラーメッセージ -->
                <form:errors path="title" element="span" cssClass="help-block" />
            </div>
        </div>

        <!-- スピーカー -->
        <div class="form-group ${errors.getFieldErrorCount('speakerName') > 0 ? 'has-error' : ''}">
            <div class="col-md-2">
                <!-- ラベル -->
                <form:label class="control-label" path="speakerName">スピーカー </form:label>
            </div>
            <div class="col-md-10">
                <!-- コントロール -->
                <form:input type="text" cssClass="form-control" style="ime-mode: active;" id="speakerName" path="speakerName" />
                <!-- エラーメッセージ -->
                <form:errors path="speakerName" element="span" cssClass="help-block" />
            </div>
        </div>

        <!-- サマリー -->
        <div class="form-group ${errors.getFieldErrorCount('summary') > 0 ? 'has-error' : ''}">
            <div class="col-md-2">
                <!-- ラベル -->
                <form:label class="control-label" path="summary"> サマリー </form:label>
            </div>
            <div class="col-md-10">
                <!-- コントロール -->
                <form:input type="text" cssClass="form-control" style="ime-mode: active;" id="summary" path="summary" />
                <!-- エラーメッセージ -->
                <form:errors path="summary" element="span" cssClass="help-block" />
            </div>
        </div>

        <!-- ルーム -->
        <div class="form-group ${errors.getFieldErrorCount('room') > 0 ? 'has-error' : ''}">
            <div class="col-md-2">
                <!-- ラベル -->
                <form:label class="control-label" path="room"> ルーム </form:label>
            </div>
            <div class="col-md-10">
                <!-- コントロール -->
                <form:input type="text" cssClass="form-control" style="ime-mode: active;" id="room" path="room" />
                <!-- エラーメッセージ -->
                <form:errors path="room" element="span" cssClass="help-block" />
            </div>
        </div>

        <!-- 開始日付 -->
        <div class="form-group ${errors.getFieldErrorCount('startTime') > 0 ? 'has-error' : ''}">
            <div class="col-md-2">
                <!-- ラベル -->
                <form:label class="control-label" path="startTime">開始日付 </form:label>
            </div>
            <div class="col-md-10">
                <!-- コントロール -->
                <form:input type="date" cssClass="form-control" id="startTime" path="startTime" />
                <!-- エラーメッセージ -->
                <form:errors path="startTime" element="span" cssClass="help-block" />
            </div>
        </div>

        <!-- 終了日付 -->
        <div class="form-group ${errors.getFieldErrorCount('endTime') > 0 ? 'has-error' : ''}">
            <div class="col-md-2">
                <!-- ラベル -->
                <form:label class="control-label" path="endTime">終了日付 </form:label>
            </div>
            <div class="col-md-10">
                <!-- コントロール -->
                <form:input type="date" cssClass="form-control" id="endTime" path="endTime" />
                <!-- エラーメッセージ -->
                <form:errors path="endTime" element="span" cssClass="help-block" />
            </div>
        </div>

        <!-- 操作ボタン -->
        <div class="row">
            <div class="col-md-offset-10 col-md-2">
                <button class="btn btn-primary" type="submit">登録</button>
                <a class="btn btn-default" href="/showList">戻る</a>
            </div>
        </div>
    </form:form>
</div>
