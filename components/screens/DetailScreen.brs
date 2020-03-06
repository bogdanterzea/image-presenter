sub init()
    m.title = m.top.findNode("title")
    m.description = m.top.findNode("description")
    m.detailsRectangle = m.top.findNode("details_rectangle")
    m.backgroundPoster = m.top.findNode("background_poster")
    m.rankingInstructionsText = m.top.findNode("instructions_text")

    setTheme()
end sub

sub onContentChanged(event as Object)
    m.content = event.getData()
    populateVisualElements()
end sub

sub populateVisualElements()
    m.backgroundPoster.uri = m.content.largeImageUrl
    m.title.text = m.content.title
    m.description.text = m.content.description
end sub

sub setTheme()
    colors = getAppColors()
    m.detailsRectangle.color = colors.transparentBlack
end sub

function onKeyOptions() as Boolean
    navigate("RankingScreen", m.content)
    return true
end function

function onKeyBack() as Boolean
    navigateBackTo("content_list")
    return true
end function

function onKeyOk() as Boolean
    m.detailsRectangle.visible = not m.detailsRectangle.visible
    if m.detailsRectangle.visible
        m.rankingInstructionsText.text = "Press * to add rating"
    else
        m.rankingInstructionsText.text = "Press OK for details"
    end if
end function
