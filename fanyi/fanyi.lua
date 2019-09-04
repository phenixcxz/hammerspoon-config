clipboard = hs.chooser.new(function (choice)
  print(choice)
end)




hs.hotkey.bind({ "cmd" }, "1", function ()
  	clipboard:show()
end)