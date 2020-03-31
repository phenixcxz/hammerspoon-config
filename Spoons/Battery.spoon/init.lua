--- === SpeedMenu ===
---
--- Menubar netspeed meter
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpeedMenu.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpeedMenu.spoon.zip)

local obj={}
obj.__index = obj

function obj:init()
    self.menubar = hs.menubar.new()
    obj:rescan()
end

local function data_diff()
    --电量百分比计算
    obj.kbin = string.format("%3.0f",hs.battery.percentage()) .. '%'
    --剩余时间计算
    if (hs.battery.timeRemaining() < 0) then
        obj.kbout = '计算中'
    else 
        if (hs.battery.powerSource() == "Battery Power" ) then 
            obj.kbout = string.format("%2.0f:%02d",hs.battery.timeRemaining()/60-0.5,hs.battery.timeRemaining()%60)

        else   
            obj.kbout = string.format("%2.0f:%02d",hs.battery.timeToFullCharge()/60-0.5,hs.battery.timeToFullCharge()%60) 
        end
    end

 --   local powe = string.format("%2.2f",hs.battery.watts()) .. 'W'
 --   local vol = string.format("%2.2f",hs.battery.voltage()/1000) .. 'V'

   -- local disp_str = 'Cap:' .. obj.kbin .. '  Pow:' .. powe .. '\nTim:' .. obj.kbout .. '   Vol:' .. vol 
    local disp_str = 'Cap:' .. obj.kbin  .. '\nTim:' .. obj.kbout  
    if obj.darkmode then
        obj.disp_str = hs.styledtext.new(disp_str, {font={size=9.0, color={hex="#FFFFFF"}}})
    else
        obj.disp_str = hs.styledtext.new(disp_str, {font={size=9.0, color={hex="#000000"}}})
    end
    obj.menubar:setTitle(obj.disp_str)
end


function obj:rescan()
    obj.interface = hs.network.primaryInterfaces()
  --  obj.darkmode = hs.osascript.applescript('tell application "System Events"\nreturn dark mode of appearance preferences\nend tell')
    local menuitems_table = {}
    if obj.interface then
        -- obj.nowcap = string.format("%3.0f", hs.battery.capacity()/hs.battery.maxCapacity()*100) .. ' %'

        -- obj.health = string.format("%2.0f", hs.battery.maxCapacity()/hs.battery.designCapacity()*100) .. ' %'
        -- table.insert(menuitems_table, {
        --     title = "实际电量 " .. obj.nowcap

        -- })
        -- table.insert(menuitems_table, {
        --     title = "当前功率 " .. hs.battery.watts() .. 'W'

        -- })
        -- table.insert(menuitems_table, {
        --     title = "当前电流 " .. hs.battery.amperage() .. 'mA'

        -- })
        -- table.insert(menuitems_table, {
        --     title = "当前电压" .. hs.battery.voltage() .. 'mV'
        -- })        

        -- table.insert(menuitems_table, {
        --      title = "预设容量:" .. hs.battery.designCapacity() .. 'mAh'
        --  })
        -- table.insert(menuitems_table, {
        --      title = "当前最大容量:" .. hs.battery.maxCapacity() .. 'mAh'
        --  })
        -- table.insert(menuitems_table, {
        --      title = "电池健康:" .. obj.health
        --  })

        if obj.timer then
            obj.timer:stop()
            obj.timer = nil
        end
        obj.timer = hs.timer.doEvery(1, data_diff)

    end
    -- table.insert(menuitems_table, {
    --     title = "Rescan Interfaces",
    --     fn = function() obj:rescan() end
    -- })
    obj.menubar:setTitle("⚠︎")
    obj.menubar:setMenu(menuitems_table)
end

return obj
