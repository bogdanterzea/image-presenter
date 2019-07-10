sub init()
    m.poster = m.top.findNode("poster")
    m.title = m.top.findNode("title")
    m.description = m.top.findNode("description")
    m.rectangle = m.top.findNode("rectangle")
    m.ratingRectangle = m.top.findNode("rating_rectangle")
    m.ratingText = m.top.findNode("rating_text")
    m.currentRankText = m.top.findNode("current_rank_text")
    m.currentRankRectangle = m.top.findNode("current_rank_rectangle")

    setTheme()
end sub

sub onContentChanged(event as Object)
    m.content = event.getData()
    m.poster.uri = m.content.poster_url
    m.title.text = m.content.title
    m.description.text = m.content.description
    registrySectionContent = CreateObject("roRegistrySection", "registrySectionContent")

    registryAssocArray = parseJson(registrySectionContent.Read("registry"))
    for each item in registryAssocArray
        if item = m.content.index.ToStr() then
            m.currentRankText.text = "Current rank: "+ registryAssocArray[item].rank.ToStr()
        end if
    end for

end sub

sub setTheme()
    colors = getAppColors()
    m.title.color = colors.main
    m.description.color = colors.main
    m.rectangle.color = colors.transparentBlack
    m.ratingRectangle.color = colors.transparentBlack
    m.ratingText.color = colors.main
    m.currentRankText.color = colors.main
    m.currentRankRectangle.color = colors.transparentBlack
end sub

function onKeyEvent(key, press) as Boolean
    if press then
        if key = "back" then
            navigateBackTo("content_list")
            return true
        end if
        if key = "options" then
            navigate("RankingScreen", m.content)
            return true
        end if
    end if

    return false
end function
