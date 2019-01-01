var operation4PersonTitleDiv
var tabList4PersonTitle = ["人员类型"];

$(function () {
    console.info("人员类型管理...");
    //静态设置
    operation4PersonTitleDiv = $("#operation4PersonTitleDiv");
    setupTabsWithDivAndPaginationAndTreeview(operation4PersonTitleDiv, tabList4PersonTitle);
    //数据加载
    var urlList = ['operation4PersonTitle/getTreeViewData']

});