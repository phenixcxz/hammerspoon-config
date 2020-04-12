
安装与使用
---
请先阅读hammerspoon的[简介](https://sspai.com/post/53992)

使用方法：

1. 安装hammerspoon
2. 使用我的hammerspoon仓库  

```bash
rm -r ~/.hammerspoon
git clone https://github.com/phenixcxz/hammerspoon-config.git ~/.hammerspoon
```
3. 打开hammerspoon

注意事项：
---

1. hammerspoon的配置文件位于`~/.hammerspoon`文件夹

2. 文件`~/.hammerspoon/init.lua`管理使用的插件

3. 我的仓库已经启用的插件

```lua
require "hotkey.hotkey"		--应用启动快捷键设置
--require "ime.ime"			--自动切换输入法
require "reload.reload"
--require "usb.usb"
require "window.window"		--快捷键调节窗口大小
--require "wifi.wifi"
require "clipboard.clipboard"	--剪切板记录
require "sleep.sleep"		--睡眠wifi蓝牙管理
--require "statuslets.statuslets"
--require "volume.volume"
--require "battery.battery"
--require "speaker.speaker"
--require "audio.audio"
--hs.loadSpoon('Calendar')
--hs.loadSpoon('DeepLTranslate')
hs.loadSpoon('SpeedMenu')	--网速显示
hs.loadSpoon('Battery')		--电池信息显示
```
`require`前面加`--`表示屏蔽该插件  

4.  `~/.hammerspoon/sleep/sleep.lua`添加了睡眠自动断开wifi蓝牙，睡眠唤醒自动打开wifi蓝牙，解除锁屏自动连接蓝牙设备,解锁屏幕后自动切换输入法为`搜狗输入法`

**自动连接蓝牙设备**需要修改蓝牙设备地址为自己的设备地址
`local bleDeviceID = '00-16-94-3c-8e-f7'`这里的`00-16-94-3c-8e-f7`是我的设备地址，需要修改为你自己的蓝牙设备地址，多个设备需要定义多个地址，然后在解锁屏幕侦测里多次调用。

**输入法切换**
默认的输入法切换为切换为搜狗输入法，可以设定为其他输入法例如切换为百度输入法，需要修改

```lua
local function Chinese()
    hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
end
```

```lua
local function Chinese()
	hs.keycodes.currentSourceID("com.baidu.inputmethod.BaiduIM.pinyin")
end
```

也可以设定根据应用自动切换在多个输入法之间切换，具体请参考`~/.hammerspoon/ime/ime.lua`

