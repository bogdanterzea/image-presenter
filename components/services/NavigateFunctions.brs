sub navigate(currentScreen as Object, ComponentToFocus as String, content as Object)
    component = CreateObject("roSGNode", ComponentToFocus)
    component.content = content
    currentScreen.appendChild(component)
    component.setFocus(true)
end sub

sub navigateBack(elementToFocus as String)
    parent = m.top.getParent()
    m.top.visible = false
    childrenToFocus = parent.findNode(elementToFocus)
    childrenToFocus.setFocus(true)
end sub
