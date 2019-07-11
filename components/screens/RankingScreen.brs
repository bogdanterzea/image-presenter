sub init()
    m.rectangle = m.top.findNode("rectangle")
    m.rankList = m.top.findNode("rank_list")
    m.text = m.top.findNode("text")
    m.top.ObserveField("rank_selected" , "onRankSelected")

    m.rankList.content = createRanksNode()
    setTheme()
end sub

sub onContentChanged(event as Object)
    m.content = event.getData()
end sub

sub onRankSelected(obj)
    rank = obj.getData()
    rank += 1
    saveSelectedRank(rank.ToStr())
end sub


sub createRanksNode() as Object

    RanksContentNode = CreateObject("roSGNode", "contentNode")
    for rank = 1 to 5
        rankItem = CreateObject("roSGNode", "rank_item")
        rankItem.title = rank.ToStr()
        rankItem.rank = rank.ToStr()
        ranksContentNode.appendChild(rankItem)
    end for

return ranksContentNode
end sub

sub saveSelectedRank(rank as String)
    registrySectionContent = CreateObject("roRegistrySection", "registrySectionContent")

    if registrySectionContent.Exists("registry")
        registryAssocArray = parseJson(registrySectionContent.Read("registry"))
    else
        registryAssocArray = CreateObject("roAssociativeArray")
    end if
    registryAssocArray[m.content.index.ToStr()]={"rank": rank}

    registrySectionContent.Write("registry", formatJSON(registryAssocArray))
    registrySectionContent.Flush()
    navigateBackTo("background_poster")
end sub

sub setTheme()
    colors = getAppColors()
    m.rectangle.color = colors.transparentBlack
    m.text.color = colors.main
end sub
