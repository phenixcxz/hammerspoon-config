caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
    caffeine:setTitle(hs.battery.capacity() )
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end