
--[[ Usage
  cmd + alt + ctrl + T : 将剪切板内容翻译为中文
  cmd + alt + ctrl + E : 将剪切板内容翻译为英文
  cmd + alt + ctrl + R : 重新加载配置文件
  cmd + alt + ctrl + H : 显示 hammerspoon 窗口
--]]


-- translate sth to chinese
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
  hs.application.open("Hammerspoon")
  translate("zh-CHS");
end)

-- translate sth to english
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
  hs.application.open("Hammerspoon")
  translate("EN");
end)

-- reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)

-- open the hammerspoon
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  hs.application.open("Hammerspoon")
end)

--[[
  Utils
  some util func
--]]
-- decode url
-- return url that decoded
function decodeURI(s)
  s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
  return s
end

-- econde url
-- return url that encoded 
function encodeURI(s)
  s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
  return string.gsub(s, " ", "+")
end

-- translate
-- param: to the language code that you want translate to
-- return void, will show the result in the dialog
function translate(to)
  local s = hs.pasteboard.getContents()
  local appKey = "your_app_key"
  local salt = "your_salt"
  local appSecretkey = "your_secretkey"
  local sign = hs.hash.MD5(appKey..s..salt..appSecretkey);
  local url = "http://openapi.youdao.com/api?q="..encodeURI(s).."&from=auto&to="..to.."&appKey="..encodeURI(appKey).."&salt="..encodeURI(salt).."&sign="..encodeURI(sign)

  hs.http.asyncGet(url, nil, function(status, body, headers)
    local result = hs.json.decode(body)
    print(body) -- 打印结果  出错时便于排查
    if result.errorCode == "0" then
        local message = "~翻译成功~"
        local information = "query:\t"..result.query.."\n"
        information = information.."translation:\t"..table.concat( result.translation, ", ").."\n"

        if(result.basic) then
          if(result.basic.explains) then information = information.."explains:\t"..table.concat( result.basic.explains, ", ").."\n" end
          if(result.basic.phonetic) then information = information.."phonetic:\t"..result.basic.phonetic.."\n" end
          if(result.basic["us-phonetic"]) then information = information.."us-phonetic:\t"..result.basic["us-phonetic"].."\n" end
          if(result.basic["uk-phonetic"]) then information = information.."uk-phonetic:\t"..result.basic["uk-phonetic"].."\n" end
        end
        if(result.web) then
          information = information.."web:\n"
          for i, v in pairs(result.web) do
            information = information.."\t"..v.key..":\t"..table.concat( v.value, ", ").."\n"
          end
        end

        hs.dialog.blockAlert(message, information, "OK", "", "informational")
    else
      hs.dialog.blockAlert("!翻译失败!", "~~~失败啦~~~", "OK", "", "informational")
    end
  end)
end