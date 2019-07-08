sub init()
    m.rectangle = m.top.findNode("rectangle")
    m.text = m.top.findNode("text")

    setTheme()
end sub

sub setTheme()
    colors = getAppColors()
    m.rectangle.color = colors.transparentBlack
    m.text.color = colors.main
end sub
