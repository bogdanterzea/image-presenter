sub navigate(componentName as String, content as Object)
    component = CreateObject("roSGNode", componentName)
    component.content = content
    m.top.appendChild(component)
    component.setFocus(true)
end sub

sub navigateBackTo(locationToFocus as String)
    parent = m.top.getParent()
    parent.removeChild(m.top)
    node = parent.findNode(locationToFocus)
    node.setFocus(true)
end sub
