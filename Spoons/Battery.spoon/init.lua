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
    local amperage = hs.battery.amperage()  --当前电流
    if(amperage>0) then
        timeReamin = hs.battery.timeToFullCharge()
    else
        timeReamin = hs.battery.timeRemaining()
    end
    if(timeReamin>0) then 
        local timeRm = timeReamin%60
        local timeRh = (timeReamin- timeRm)/60
        obj.kbout = string.format("%2d:%02d",timeRh,timeRm)
    else 
        obj.kbout = '------'                
    end   

    --充电状态指示
    local disp_str
    if amperage>0 then
        if(timeReamin>0) then 
            disp_str = '充Cap:' .. obj.kbin  .. '\n电Tim:' .. obj.kbout   
        else 
            disp_str = '充Cap:' .. obj.kbin  .. '\n满Tim:' .. obj.kbout
        end
    else 
        disp_str = 'Cap:' .. obj.kbin  .. '\nTim:' .. obj.kbout 
    end

    --显示
    if obj.darkmode then
        obj.disp_str = hs.styledtext.new(disp_str, {font={size=9.0, color={hex="#FFFFFF"}}})
    else
        obj.disp_str = hs.styledtext.new(disp_str, {font={size=9.0, color={hex="#000000"}}})
    end
    obj.menubar:setTitle(obj.disp_str)
end


populateMenu = function(key)
    local designCapacity = hs.battery.designCapacity()
    local capacity = hs.battery.capacity()
    local maxCapacity = hs.battery.maxCapacity()
    local nowcap = string.format("%3.0f", capacity/maxCapacity*100) .. ' %'
    local health = string.format("%2.0f", maxCapacity/designCapacity*100) .. ' %'

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
         title = "预设容量：" .. designCapacity .. 'mAh'
     })
    table.insert(menuData, {
         title = "最大容量：" .. maxCapacity .. 'mAh'
     })
    table.insert(menuData, {
         title = "当前电量：" .. capacity .. 'mAh'
     })
    table.insert(menuData, {
         title = "电池健康：" .. health
     })
    return menuData
end

function obj:rescan()
    obj.menubar:setMenu(populateMenu)
    data_diff()
    if obj.timer then
        obj.timer:stop()
        obj.timer = nil
    end
    obj.timer = hs.timer.doEvery(1, data_diff)
end

return obj
