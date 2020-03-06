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

sub onRankSelected(rankSelected)
    rank = rankSelected.getData()
    rank += 1
    saveSelectedRank(rank.ToStr())
end sub


sub createRanksNode() as Object
    RanksContentNode = CreateObject("roSGNode", "contentNode")
    for rank = 1 to 5
        rankItem = createRankItem(rank)
        ranksContentNode.appendChild(rankItem)
    end for

return ranksContentNode
end sub

function createRankItem(rank as Integer)
    rankItem = CreateObject("roSGNode", "rank_item")
    rankItem.title = rank.ToStr()
    rankItem.rank = rank.ToStr()

    return rankItem
end function

sub saveSelectedRank(rank as String)
    m.registrySectionContent = CreateObject("roRegistrySection", "registrySectionContent")
    m.registrySectionContent.Write("registry", formatJSON(createRegistryArray(rank)))
    m.registrySectionContent.Flush()

    navigateBackTo("details_rectangle")
end sub

function createRegistryArray(rankAcorded as String) as Object
    if m.registrySectionContent.Exists("registry")
        registryAssocArray = parseJson(m.registrySectionContent.Read("registry"))
    else
        registryAssocArray = {}
    end if
    registryAssocArray[m.content.index.ToStr()]={"rank": rankAcorded}

    return registryAssocArray
end function

sub setTheme()
    colors = getAppColors()
    m.rectangle.color = colors.transparentBlack
end sub

function onKeyBack() as Boolean
    navigateBackTo("background_poster")
    return true
end function

function onKeyOptions() as boolean
    return true
end function
