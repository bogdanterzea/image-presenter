sub navigate(componentName as String, content as Object)
    component = CreateObject("roSGNode", componentName)
    component.content = content
    m.top.appendChild(component)
    component.setFocus(true)
end sub

sub navigateBackTo(nodeId as String)
    parent = m.top.getParent()
    content = m.top.content
    parent.removeChild(m.top)
    parent.findNode(nodeId).setFocus(true)
end sub
