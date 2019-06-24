function init()
    m.top.backgroundURI = "pkg:/images/hexagones.jpg"
    m.content_list = m.top.findNode("content_list")
    m.title_label = m.top.findNode("title_label")
    m.description_label = m.top.findNode("description_label")
    m.content_list.setFocus(true)
    m.content_list.observeField("rowItemFocused", "onItemFocused")

    runGetComponentDataTask()
end function

sub runGetComponentDataTask()
    getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    getComponentDataTask.observeField("component_data", "onContentDataChange")
    getComponentDataTask.control = "RUN"
end sub

sub onContentDataChange(event as Object)
    m.content_list.content = event.getData()
end sub

sub onItemFocused(element as Object)
    selected_item = element.getData()
    m.title_label.text = getDataFromIndex(selected_item).title
    m.description_label.text = getDataFromIndex(selected_item).description
end sub

function getDataFromIndex(data as Object) as Object
    row = data[0]
    line = data[1]

    return m.content_list.content.getChild(row).getChild(line)
end function
