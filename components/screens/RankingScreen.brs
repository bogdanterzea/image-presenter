sub init()
    m.rectangle = m.top.findNode("rectangle")
    m.text = m.top.findNode("text")
    m.top.ObserveField("rank_selected" , "onRankSelected")

    setTheme()
end sub

sub onContentChanged(event as Object)
    content = event.getData()
end sub

sub onRankSelected(obj)
    rank = obj.getData()
    bogdanContent = CreateObject("roRegistrySection", "bogdanContent")
    bogdanArray = [
        { id: 0, rank: "1" },
        { id: 1, rank: "2" },
        { id: 2, rank: "5" },
        { id: 3, rank: "4" }
    ]
    bogdanContent.Write("registry", formatJSON(bogdanArray))
    bogdanContent.Flush()
end sub

sub setTheme()
    colors = getAppColors()
    m.rectangle.color = colors.transparentBlack
    m.text.color = colors.main
end sub
