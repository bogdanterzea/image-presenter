sub main()
    m.port = CreateObject("roMessagePort")
    m.screen = CreateObject("roSGScreen")
    m.screen.setMessagePort(m.port)
    scene = m.screen.CreateScene("appScene")
    m.screen.Show()
    keepAppAlive()
end sub

sub keepAppAlive()
    while true
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub
