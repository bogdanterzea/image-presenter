sub init()
    m.ROW_INDEX = 0
    m.ROW_ITEM_INDEX = 1
    m.titleLabel = m.top.findNode("title_label")
    m.descriptionLabel = m.top.findNode("description_label")
    m.contentList = m.top.findNode("content_list")
    m.contentList.observeField("rowItemFocused", "onRowItemFocused")
    m.contentList.observeField("rowItemSelected", "onRowItemSelected")
''    m.detailScreen = m.top.findNode("DetailScreen")

    runGetComponentDataTask()
    setTheme()
end sub

sub runGetComponentDataTask()
    getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    getComponentDataTask.observeField("component_data", "onContentDataChanged")
    getComponentDataTask.control = "RUN"
end sub

sub onRowItemSelected(event as Object)
    rowItemData = getFocusedRowItemData(event.getData())
    m.NavigationService.navigate(m.top, "DetailScreen", {content: rowItemData})
    'm.detailScreen.content = rowItemData
    'm.detailScreen.visible = true
    'm.detailScreen.setFocus(true)
end sub

sub onRowItemFocused(event as Object)
    rowItemData = getFocusedRowItemData(event.getData())
    m.titleLabel.text = rowItemData.title
    m.descriptionLabel.text = rowItemData.description
end sub

sub onContentDataChanged(event as Object)
    m.contentList.content = event.getData()
end sub

function getFocusedRowItemData(rowItemFocused as Object) as Object
    focusedRow = rowItemFocused[m.ROW_INDEX]
    focusedRowItem = rowItemFocused[m.ROW_ITEM_INDEX]

    return m.contentList.content.getChild(focusedRow).getChild(focusedRowItem)
end function

'function onKeyEvent(key, press) as Boolean
''    if press then
''        if key = "back"
''            if m.detailScreen.visible
''                focusDetailScreen()
''                return true
''            end if
''        end if
''    end if
''    return false
'end function

'sub focusDetailScreen()
''    m.detailScreen.visible = false
''    m.contentList.setFocus(true)
'end sub

sub setTheme()
    colors = getAppColors()
    m.titleLabel.color = colors.main
    m.descriptionLabel.color = colors.main
end sub
