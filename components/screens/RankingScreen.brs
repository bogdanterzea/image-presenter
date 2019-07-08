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
    rank++
    bogdanContent.Write("rank" , rank.ToStr())
    bogdanContent.Flush()
    ? bogdanContent.Read("rank")
end sub

sub setTheme()
    colors = getAppColors()
    m.rectangle.color = colors.transparentBlack
    m.text.color = colors.main
end sub
