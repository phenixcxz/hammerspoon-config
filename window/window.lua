require "hs.application"
--local hotkey = require "hs.hotkey"
hyper = {'ctrl', 'cmd'}
local window = require "hs.window"



--当前窗口全屏
hs.hotkey.bind(hyper,"O", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

-- 当前窗口 2分屏 宽度1/2 左分屏
hs.hotkey.bind(hyper, "Left", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)



-- 当前窗口 2分屏 宽度1/2 右分屏
hs.hotkey.bind(hyper, "Right", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(hyper, "up", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w 
    f.h = max.h/2
    win:setFrame(f)
end)



-- 当前窗口 2分屏 宽度1/2 右分屏
hs.hotkey.bind(hyper, "down", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x 
    f.y = max.y+max.h/2
    f.w = max.w
    f.h = max.h/2
    win:setFrame(f)
end)

-- 当前窗口 4分屏 宽度1/2 高度1/2 左上分屏
hs.hotkey.bind(hyper,"h", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x 
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

-- 当前窗口 4分屏 宽度1/2 高度1/2 左下分屏
hs.hotkey.bind(hyper,"n", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + max.h/2
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


-- 当前窗口 4分屏 宽度1/2 高度1/2 右上分屏
hs.hotkey.bind(hyper,"j", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/2
    f.y = max.y 
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


hs.hotkey.bind(hyper,"m", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
-- 当前窗口 4分屏 宽度1/2 高度1/2 右下分屏
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/2
    f.y = max.y + max.h/2
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind(hyper,'b', function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
-- 当前窗口 4分屏 宽度1/2 高度1/2 右下分屏
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/8
    f.y = max.y + max.h/8
    f.w = max.w / 4*3
    f.h = max.h / 4*3
    win:setFrame(f)
end)


hs.hotkey.bind(hyper,'4', function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
-- 当前窗口 4分屏 宽度1/2 高度1/2 右下分屏
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/4*3
    f.y = max.y 
    f.w = max.w / 4
    f.h = max.h / 4
    win:setFrame(f)
end)

hs.hotkey.bind(hyper,'3', function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
-- 当前窗口 4分屏 宽度1/2 高度1/2 右下分屏
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/4*2
    f.y = max.y 
    f.w = max.w / 4
    f.h = max.h / 4
    win:setFrame(f)
end)

hs.hotkey.bind(hyper,'2', function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
-- 当前窗口 4分屏 宽度1/2 高度1/2 右下分屏
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/4*1
    f.y = max.y 
    f.w = max.w / 4
    f.h = max.h / 4
    win:setFrame(f)
end)

hs.hotkey.bind(hyper,'1', function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
-- 当前窗口 4分屏 宽度1/2 高度1/2 右下分屏
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y 
    f.w = max.w / 4
    f.h = max.h / 4
    win:setFrame(f)
end)