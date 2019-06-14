function init()
    runGetComponentDataTask()
end function

sub runGetComponentDataTask()
    getComponentDataTask = CreateObject("roSGNode", "get_component_data_task")
    getComponentDataTask.observeField("component_data", "onContentDataChange")
    getComponentDataTask.control = "RUN"
end sub

sub onContentDataChange(event as Object)
    ? event.getData()
end sub
