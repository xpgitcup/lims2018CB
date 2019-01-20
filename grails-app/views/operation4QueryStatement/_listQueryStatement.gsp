<!DOCTYPE html>
<html>
    <head>
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
        <!--meta name="layout" content="main" /-->
        <g:set var="entityName" value="${message(code: 'queryStatement.label', default: 'QueryStatement')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="list-queryStatement" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${objectList}" />
        </div>
    </body>
</html>