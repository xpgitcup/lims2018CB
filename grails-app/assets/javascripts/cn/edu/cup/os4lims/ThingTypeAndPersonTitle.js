var operation4ThingTypeAndPersonTitleDiv
var tabList4ThingTypeAndPersonTitle = ["任务圈"];
var thingTypeTree;
var personTitleTree;

$(function () {
    console.info("任务圈管理...");
    //静态设置
    thingTypeTree = $("#thingTypeTree");
    personTitleTree = $("#personTitleTree");

    thingTypeTree.tree({
        url: "operation4ThingType//getTreeViewData",
        onSelect: function (node) {
            $("#thingType").attr("value", node.attributes[0])
        }
    })

    personTitleTree.tree({
        url: "operation4PersonTitle/getTreeViewData",
        onSelect: function (node) {
            $("#personTitle").attr("value", node.attributes[0])
        }
    })
});

function changeUpNode(node) {
    console.info("修改根节点的id...")
    $("#createItem").attr('href', 'javascript: createItem(' + node.attributes[0] + ')');
    $("#createItem").html("创建" + node.attributes[0] + '的子节点');
    $("#editItem").attr('href', 'javascript: editItem(' + node.attributes[0] + ')');
    $("#editItem").html("编辑" + node.attributes[0] + '节点');
    $("#deleteItem").attr('href', 'operation4ThingTypeAndPersonTitle/delete/' + node.attributes[0]);
    $("#deleteItem").html("删除" + node.attributes[0] + '节点');
    $("#currentTitle").html(node.text);
    ajaxRun("operation4ThingTypeAndPersonTitle/show", node.attributes[0], "showInformationDiv");
}

function countBasicType(title) {
    console.info("统计基础数据..." + title);
    showCurrent(title);
    var total = 0;
    switch (title) {
        case "项目类型":
            total = ajaxCalculate("operation4ThingTypeAndPersonTitle/count");
            break
    }
    return total;
}

function showCurrent(title) {
    $("#currentTitle").html("请选择...");
}

function editItem(id) {
    var title = getCurrentTabTitle(operation4ThingTypeAndPersonTitleDiv);
    ajaxRun("operation4ThingTypeAndPersonTitle/edit", id, "list" + title + "Div");
}

function createItem(id) {
    var title = getCurrentTabTitle(operation4ThingTypeAndPersonTitleDiv);
    //ajaxRun("operation4ThingTypeAndPersonTitle/create/?upTitle=" + id, 0, "list" + title + "Div");
    ajaxRun("operation4ThingTypeAndPersonTitle/create", id, "list" + title + "Div");
}