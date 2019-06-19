function init()
    m.content_list = m.top.findNode("content_list")
    runGetComponentDataTask()
    m.content_list.SetFocus(true)
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
