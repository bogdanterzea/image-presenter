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
    registrySectionContent = CreateObject("roRegistrySection", "registrySectionContent")

    if registrySectionContent.Exists("registry")
        registryAssocArray = parseJson(registrySectionContent.Read("registry"))
    else
        registryAssocArray = CreateObject("roAssociativeArray")
    end if
    registryAssocArray[m.content.index.ToStr()]={"rank": rank.ToStr()}

    registrySectionContent.Write("registry", formatJSON(registryAssocArray))
    registrySectionContent.Flush()
    navigateBackTo("poster")
end sub

sub setTheme()
    colors = getAppColors()
    m.rectangle.color = colors.transparentBlack
    m.text.color = colors.main
end sub
