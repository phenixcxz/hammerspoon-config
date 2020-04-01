print('==================================================')
--require "headphone.headphone"
require "hotkey.hotkey"
require "ime.ime"
require "reload.reload"
--require "usb.usb"
require "window.window"
--require "wifi.wifi"
require "clipboard.clipboard"
require "sleep.sleep"
--require "statuslets.statuslets"
--require "volume.volume"
--require "battery.battery"
--require "speaker.speaker"

hs.loadSpoon('Calendar')
--hs.loadSpoon('DeepLTranslate')
hs.loadSpoon('SpeedMenu')
hs.loadSpoon('Battery')

-- Private use
--if (hs.host.localizedName() == 'kaboom的MacBook Pro') then
--	require("autoscript.autoscript")
--end

