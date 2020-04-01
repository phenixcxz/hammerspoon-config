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

    if (hs.battery.isCharging()) then 
        obj.kbin = obj.kbin .. '充'
        if(hs.battery.timeToFullCharge() >0) then
            obj.kbout = string.format("%2.0f:%02d",hs.battery.timeToFullCharge()/60-0.5,hs.battery.timeToFullCharge()%60) .. '电'
        elseif(hs.battery.timeToFullCharge() == 0) then
            obj.kbout = string.format("%2.0f:%02d",hs.battery.timeToFullCharge()/60-0.5,hs.battery.timeToFullCharge()%60) .. '满'
        else
            obj.kbout= ' ---- 电'  
        end
    elseif (hs.battery.timeRemaining() < 0) then
        obj.kbout = ' ---- '
    elseif(hs.battery.powerSource() == "Battery Power" ) then 
        obj.kbout = string.format("%2.0f:%02d",hs.battery.timeRemaining()/60-0.5,hs.battery.timeRemaining()%60)
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



populateMenu = function(key)
    --setTitle() -- Update the counter every time the menu is refreshed
    nowcap = string.format("%3.0f", hs.battery.capacity()/hs.battery.maxCapacity()*100) .. ' %'

    health = string.format("%2.0f", hs.battery.maxCapacity()/hs.battery.designCapacity()*100) .. ' %'
    menuData = {}
    table.insert(menuData, {
        title = "实际电量：" .. nowcap

    })
    table.insert(menuData, {
        title = "当前功率：" .. hs.battery.watts() .. 'W'

    })
    table.insert(menuData, {
        title = "当前电流：" .. hs.battery.amperage() .. 'mA'

    })
    table.insert(menuData, {
        title = "当前电压：" .. hs.battery.voltage() .. 'mV'
    })        

    table.insert(menuData, {
         title = "预设容量：" .. hs.battery.designCapacity() .. 'mAh'
     })
    table.insert(menuData, {
         title = "最大容量：" .. hs.battery.maxCapacity() .. 'mAh'
     })
    table.insert(menuData, {
         title = "当前电量：" .. hs.battery.capacity() .. 'mAh'
     })
    table.insert(menuData, {
         title = "电池健康：" .. health
     })
    return menuData
end

function obj:rescan()
    obj.menubar:setMenu(populateMenu)
    data_diff()
    timer = hs.timer.new(5, data_diff)
    timer:start()
end

return obj
