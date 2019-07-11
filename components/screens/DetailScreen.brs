sub init()
    m.backgroundPoster = m.top.findNode("background_poster")
    m.title = m.top.findNode("title")
    m.description = m.top.findNode("description")
    m.detailsRectangle = m.top.findNode("details_rectangle")
    m.rankingInstructionsRectangle = m.top.findNode("instructions_rectangle")
    m.rankingInstructionsText = m.top.findNode("instructions_text")
    m.rankDisplayText = m.top.findNode("rank_display_text")
    m.rankDisplayRectangle = m.top.findNode("rank_display_rectangle")

    setTheme()
end sub

sub onContentChanged(event as Object)
    m.content = event.getData()
    populateVisualElements(m.content)
    initializeRegistry(m.content)
end sub

sub initializeRegistry(content as Object)
    registrySectionContent = CreateObject("roRegistrySection", "registrySectionContent")

    registryAssocArray = parseJson(registrySectionContent.Read("registry"))
    for each item in registryAssocArray
        if item = content.index.ToStr() then
            m.rankDisplayText.text = "Current rank: "+ registryAssocArray[item].rank.ToStr()
        end if
    end for
end sub

sub populateVisualElements(content as Object)
    m.backgroundPoster.uri = content.poster_url
    m.title.text = content.title
    m.description.text = content.description
end sub

sub setTheme()
    colors = getAppColors()
    m.title.color = colors.main
    m.description.color = colors.main
    m.detailsRectangle.color = colors.transparentBlack
    m.rankingInstructionsRectangle.color = colors.transparentBlack
    m.rankingInstructionsText.color = colors.main
    m.rankDisplayText.color = colors.main
    m.rankDisplayRectangle.color = colors.transparentBlack
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
