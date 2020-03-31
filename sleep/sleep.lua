function wifiSwitch(state)
  -- state: 0(off), 1(on)
  cmd = "/usr/sbin/networksetup -setairportpower en0 "..(state)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end

function bluetoothSwitch(state)
  -- state: 0(off), 1(on)
  cmd = "/usr/local/bin/blueutil --power "..(state)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end

--hs.hotkey.bind({'alt'},'h', bluetoothSwitch(0) )


function caffeinateCallback(eventType)
    if (eventType == hs.caffeinate.watcher.systemWillSleep) then
      print("screensDidLock")
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