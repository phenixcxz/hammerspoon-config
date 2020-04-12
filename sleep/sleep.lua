local bleDeviceID = '00-16-94-3c-8e-f7'

--开关wifi
function wifiSwitch(state)
  -- state: off, on
  cmd = "/usr/sbin/networksetup -setairportpower en0 "..(state)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end

--开关蓝牙
function bluetoothSwitch(state)
  -- state: 0(off), 1(on)
  cmd = "/usr/local/bin/blueutil --power "..(state)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end

--断开蓝牙连接
function disconnectBluetooth()
  cmd = "/usr/local/bin/blueutil --disconnect "..(bleDeviceID)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end

--连接蓝牙设备
function connectBluetooth()
  cmd = "/usr/local/bin/blueutil --connect "..(bleDeviceID)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end

--解锁屏幕自动设定输入法为搜狗输入法
-- local function Chinese()
--     hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
-- end

--解锁屏幕自动设定输入法为百度输入法
local function Chinese()
   hs.keycodes.currentSourceID("com.baidu.inputmethod.BaiduIM.pinyin")
end


function caffeinateCallback(eventType)
    if (eventType == hs.caffeinate.watcher.screensDidLock) then
      print("screensDidLock")
      disconnectBluetooth()
    elseif (eventType == hs.caffeinate.watcher.screensDidUnlock) then
      print("screensDidUnlock")
      connectBluetooth()
      Chinese()     --解锁屏幕自动设定输入法为搜狗输入法
    end

    if (eventType == hs.caffeinate.watcher.systemWillSleep) then
    --  print("screensDidLock")
    --  disconnectBluetooth()
      bluetoothSwitch(0)
      wifiSwitch(off)
    elseif (eventType == hs.caffeinate.watcher.systemDidWake) then
      print("screensDidUnlock")
      bluetoothSwitch(1)
      wifiSwitch(on)
    end
end


caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
caffeinateWatcher:start()