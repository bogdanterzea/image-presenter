sub navigate(currentScreen as Object, nextScreen as String, content as Object)
    component = CreateObject("roSGNode", nextScreen)
    component.content = content
    currentScreen.appendChild(component)
    
    component.setFocus(true)
end sub
