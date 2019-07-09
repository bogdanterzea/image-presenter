sub init()
    m.rectangle = m.top.findNode("rectangle")
    m.text = m.top.findNode("text")
    m.top.ObserveField("rank_selected" , "onRankSelected")

    setTheme()
end sub

sub onContentChanged(event as Object)
    m.content = event.getData()
end sub

sub onRankSelected(obj)
    rank = obj.getData()
    rank += 1
    itExist = 0
    registrySectionContent = CreateObject("roRegistrySection", "registrySectionContent")
    registryArray = parseJson(registrySectionContent.Read("registry"))

    for each item in registryArray
        if m.content.index.ToStr() = item.id.ToStr()
            item.rank = rank.ToStr()
            itExist = 1
        end if
    end for

    if itExist = 0
        registryArray.Push({"id" : m.content.index.ToStr(), "rank": rank.ToStr()})
    end if

    registrySectionContent.Write("registry", formatJSON(registryArray))
    registrySectionContent.Flush()
    navigateBackTo("poster")
end sub

sub setTheme()
    colors = getAppColors()
    m.rectangle.color = colors.transparentBlack
    m.text.color = colors.main
end sub
