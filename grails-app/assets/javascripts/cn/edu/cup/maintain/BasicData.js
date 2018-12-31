

function createItem() {
    var title = $("#currentTitle").html()
}

function getCurrentKey() {
    var tab = operation4BasicDataDiv.tabs('getSelected');
    var index = operation4BasicDataDiv.tabs('getTabIndex', tab);
    var currentKey = tabList4BasicData[index]
    return currentKey;
}


function showCurrent(title) {
    $("#currentTitle").html(title);
    switch (title) {
        case "教师":
            $("#currentTemplate").attr('href','operation4BasicData/downloadTemplate/?key=teacher');
            $("#importKey").attr('value', 'teacher')
            break
        case "学生":
            $("#currentTemplate").attr('href','operation4BasicData/downloadTemplate/?key=student');
            $("#importKey").attr('value', 'student')
            break
        case "项目":
            $("#currentTemplate").attr('href','operation4BasicData/downloadTemplate/?key=project');
            $("#importKey").attr('value', 'project')
            break
        case "教师职称":
            $("#currentTemplate").attr('href','operation4BasicData/downloadTemplate/?key=teacherTitle');
            $("#importKey").attr('value', 'teacherTitle')
            break
        case "学生类别":
            $("#currentTemplate").attr('href','operation4BasicData/downloadTemplate/?key=studentType');
            $("#importKey").attr('value', 'studentType')
            break
        case "项目类型":
            $("#currentTemplate").attr('href','operation4BasicData/downloadTemplate/?key=projectType');
            $("#importKey").attr('value', 'projectType')
            break
    }
}


