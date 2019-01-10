<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'thingType.label', default: 'ThingType')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div id="show-thingType" class="content scaffold-show" role="main">
    ${this.thingType.relatedThingTypeList()}
    <!--f:display bean="thingType"/-->
    <g:form resource="${this.thingType}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.thingType}">
                <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
