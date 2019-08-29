local hyper = {'ctrl', 'cmd'}

hs.hotkey.bind({"cmd"}, "L", hs.caffeinate.systemSleep)
-- hs.hotkey.bind({"alt","ctrl"},"T",hs.application.launch.launchOrFocus("Terminal"))

-- show front activated app infos
hs.hotkey.bind(
    hyper, ".",
    function()
        hs.alert.show(string.format("App path:        %s\nApp name:      %s\nIM source id:  %s",
                                    hs.window.focusedWindow():application():path(),
                                    hs.window.focusedWindow():application():name(),
                                    hs.keycodes.currentSourceID()))
    end)


function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- 快速打开Finder，微信，Chrome等等
hs.hotkey.bind({"alt"}, "E", open("Finder"))
hs.hotkey.bind({"alt"}, "W", open("WeChat"))
hs.hotkey.bind({"alt"}, "C", open("Google Chrome"))
hs.hotkey.bind({"alt"}, "T", open("iTerm"))
hs.hotkey.bind({"alt"}, "X", open("Xcode"))
hs.hotkey.bind({"alt"}, "S", open("Sublime Text"))
hs.hotkey.bind({"alt"}, "V", open("Visual Studio Code"))
hs.hotkey.bind({"alt"}, "I", open("IntelliJ IDEA"))
hs.hotkey.bind({"alt"}, "M", open("NeteaseMusic"))
hs.hotkey.bind({"alt","ctrl"},"T",open("Terminal"))
hs.hotkey.bind({"alt"},'1',open("Terminal"))
hs.hotkey.bind({"alt"},'2',open("MarginNote 3"))
hs.hotkey.bind({"alt"},"`",open("VNote"))
