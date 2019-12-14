function init()
    m._handled = not m.top.propagateFocus
end function

function onPropagateFocusChanged(event as Object) as Void
    propagateFocus = event.getData()

    m._handled = not propagateFocus
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = m._handled

    if press then
        if key="back" then handled = onKeyBack()
        if key="up" then handled = onKeyUp()
        if key="down" then handled = onKeyDown()
        if key="left" then handled = onKeyLeft()
        if key="right" then handled = onKeyRight()
        if key="OK" then handled = onKeyOk()
        if key="options" then handled = onKeyOptions()
    end if

    return handled
end function

function onKeyBack() as Boolean
    return m._handled
end function

function onKeyUp() as Boolean
    return m._handled
end function

function onKeyDown() as Boolean
    return m._handled
end function

function onKeyLeft() as Boolean
    return m._handled
end function

function onKeyRight() as Boolean
    return m._handled
end function

function onKeyOk() as Boolean
    return m._handled
end function

function onKeyOptions() as Boolean
    return m._handled
end function
