audio = hs.audiodevice.defaultOutputDevice()
print(audio:outputVolume())
print(audio:jackConnected())
headphoneUID = 'AppleHDAEngineOutput:1F,3,0,1,3:1'
headphone = hs.audiodevice.findDeviceByUID(headphoneUID)
print(headphone)
--audio.setDefaultInputDevice()
--hs.audiodevice:setDefaultInputDevice()

print(hs.audiodevice.allInputDevices())

print(audio)

audioOut = hs.audiodevice.defaultOutputDevice()
print(audioIn)
-- audioIn:setDefaultInputDevice()
-- audio:setDefaultOutputDevice()