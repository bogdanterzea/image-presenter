function NavigationService() as Object
if m._NavigationService = invalid then m._NavigationService = {
    FIRST_CHILD: 0
    OLD_SCREENS: {
        scheduleScreen: true
        settingsScreen: true
    }

    _lastNavigationTask: invalid

    navigate: NavigationService__navigate
    _navigateToScreen: NavigationService___navigateToScreen
end function

function NavigationService__navigate(parentScreen as Object, targetName as String, args={} as Object) as Object
    options = NavigationOptions()
    options.args = args

    return m._navigateToScreen(parentScreen, targetName, options)
end function

function NavigationService__navigateToScreen(parentScreen as Object, targetName as String)
    childScreen = m.createScreenNode(targetName, options.args)
    parentScreen.appendChild(childScreen)

    childScreen.setFocus(options.hasFocus)

    return childScreen
end function
