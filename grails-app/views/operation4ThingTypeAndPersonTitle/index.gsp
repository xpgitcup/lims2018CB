<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<!--meta name="layout" content="main"/-->
<!-- 实现可定制的布局 -->
    <g:if test="${layout}">
        <meta name="layout" content="${layout}"/>
    </g:if>
    <g:else>
        <g:if test="${session.layout}">
            <meta name="layout" content="${session.layout}"/>
        </g:if>
        <g:else>
            <meta name="layout" content="main"/>
        </g:else>
    </g:else>
<!-- end 实现可定制的布局 -->
    <g:set var="entityName" value="ThingTypeAndPersonTitle"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/os4lims/${entityName}.js"/>
</head>

<body>

<div class="nav">
    <ul id="operation4ThingTypeAndPersonTitleUl">
        <li>
            <g:form controller="operation4ThingTypeAndPersonTitle" action="save">
                <label>名称</label>
                <g:textField name="name" value="" id="circleName"/>
                <label>任务</label>
                <g:textField name="thingType" value="" id="thingType"/>
                <label>人员</label>
                <g:textField name="personTitle" value="" id="personTitle"/>
                <g:submitButton name="create"/>
            </g:form>
        </li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div id="operation4ThingTypeAndPersonTitleDiv" class="easyui-panel">
    <f:table collection="${thingTypeCircleList}" />

    <div class="paginationGrails">
        <g:paginate total="${thingTypeCircleCount ?: 0}" />
    </div>
</div>

<div id="edit4ThingTypeAndPersonTitleDiv">
    <div class="container-fluid">
        <div class="col-md-6">
            <ul class="easyui-tree" id="thingTypeTree"></ul>
        </div>

        <div class="col-md-6">
            <ul class="easyui-tree" id="personTitleTree"></ul>
        </div>
    </div>
</div>
</body>
</html>
