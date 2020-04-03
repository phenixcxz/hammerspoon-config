audio = hs.audiodevice.defaultOutputDevice()
print(audio:outputVolume())
print(audio:jackConnected())
headphoneUID = 'AppleHDAEngineOutput:1F,3,0,1,3:1'
headphone = hs.audiodevice.findDeviceByUID(headphoneUID)
print(headphone)
print(headphone:jackConnected())