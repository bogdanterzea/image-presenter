sub init()
    m.itemIndex = m.top.findNode("item_index")
    m.poster = m.top.findNode("poster")
    m.rectangle = m.top.findNode("rectangle")

    setTheme()
end sub

sub setTheme()
    m.itemIndex.color = getAppColors().main
    m.rectangle.color = getAppColors().third
end sub

sub itemContentChanged(event as Object)
    itemData = event.getData()
    m.itemIndex.text = itemData.index
    m.poster.uri = itemData.poster_url
end sub
