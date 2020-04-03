local function Chinese()
    hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
end

Chinese()
-- --local function Chinese()
-- --    hs.keycodes.currentSourceID("com.baidu.inputmethod.BaiduIM.pinyin")
-- --end

-- local function English()
--     hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
-- end

-- -- app to expected ime config
-- local app2Ime = {
--     {'/Applications/iTerm.app', 'Chinese'},
--     {'/Applications/Xcode.app', 'Chinese'},
--     {'/Applications/Google Chrome.app', 'Chinese'},
--     {'/System/Library/CoreServices/Finder.app', 'Chinese'},
--     {'/Applications/DingTalk.app', 'Chinese'},
--     {'/Applications/Kindle.app', 'Chinese'},
--     {'/Applications/NeteaseMusic.app', 'Chinese'},
--     {'/Applications/WeChat.app', 'Chinese'},
-- 	{'/Applications/QQ.app', "Chinese"},
-- 	{'/Applications/Safari.app',"Chinese"},
-- 	{'/Applications/VNote.app','Chinese'},
--     {'/Applications/System Preferences.app', 'Chinese'},
--     {'/Applications/Dash.app', 'Chinese'},
--     {'/Applications/MindNode.app', 'Chinese'},
--     {'/Applications/Preview.app', 'Chinese'},
--     {'/Applications/wechatwebdevtools.app', 'Chinese'},
--     {'/Applications/Sketch.app', 'Chinese'},
--     {'/Applications/Sublime Text.app', 'Chinese'},
--     {'/Applications/MarginNote 3.app', 'Chinese'},
--     {'/Applications/PyCharm.app', 'Chinese'},
-- 	{'/Applications/Microsoft OneNote.app', 'Chinese'},
--     {'/Applications/SSH Sheel.app', 'Chinese'},
--     {'/Applications/Mate Translate.app', 'Chinese'},
--     {'Applications/Notion.app','Chinese'}
-- }

-- function updateFocusAppInputMethod()
--     local ime = 'English'
--     local focusAppPath = hs.window.frontmostWindow():application():path()
--     for index, app in pairs(app2Ime) do
--         local appPath = app[1]
--         local expectedIme = app[2]

--         if focusAppPath == appPath then
--             ime = expectedIme
--             break
--         end
--     end

--     -- if ime == 'English' then
--     --    English()
--     -- else
--         Chinese()
--     -- end
-- end

-- -- helper hotkey to figure out the app path and name of current focused window
-- hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
--     hs.alert.show("App path:        "
--     ..hs.window.focusedWindow():application():path()
--     .."\n"
--     .."App name:      "
--     ..hs.window.focusedWindow():application():name()
--     .."\n"
--     .."IM source id:  "
--     ..hs.keycodes.currentSourceID())
-- end)

-- -- Handle cursor focus and application's screen manage.
-- function applicationWatcher(appName, eventType, appObject)
--     if (eventType == hs.application.watcher.activated) then
--         updateFocusAppInputMethod()
--     end
-- end

-- appWatcher = hs.application.watcher.new(applicationWatcher)
-- appWatcher:start()
