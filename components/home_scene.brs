function init()
    m.top.backgroundURI = "pkg:/images/hexagones.jpg"
    m.content_list = m.top.findNode("content_list")
    m.title_label = m.top.findNode("title_label")
    m.description_label = m.top.findNode("description_label")
    m.content_list.SetFocus(true)
    m.content_list.observeField("rowItemFocused", "onItemFocused")

    runGetComponentDataTask()
end function

sub runGetComponentDataTask()
    getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    getComponentDataTask.observeField("component_data", "onContentDataChange")
    getComponentDataTask.control = "RUN"
end sub

sub onContentDataChange(event as Object)
    component_data = event.getData()
    m.content_list.content = component_data
end sub

sub onItemFocused(element)
    selected_item = element.getData()
    m.title_label.text = getTitleFromIndex(selected_item[0] , selected_item[1])
    m.description_label.text = getDescriptionFromIndex(selected_item[0] , selected_item[1])
end sub

function getTitleFromIndex(item1 as integer , item2 as integer) as Object
    return m.content_list.content.getChild(item1).getChild(item2).title
end function

function getDescriptionFromIndex(item1 as integer , item2 as integer) as Object
    return m.content_list.content.getChild(item1).getChild(item2).description
end function
