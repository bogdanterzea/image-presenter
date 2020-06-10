sub init()
    m.itemIndex = m.top.findNode("item_index")
    m.poster = m.top.findNode("poster")
    m.rectangle = m.top.findNode("rectangle")

    setTheme()
end sub

sub setTheme()
    colors = getAppColors()
    m.itemIndex.color = colors.main
    m.rectangle.color = colors.transparentBlack
end sub

sub itemContentChanged(event as Object)
    itemData = event.getData()
    m.itemIndex.text = itemData.index
    m.poster.uri = itemData.posterUrl
end sub
