local obj={}
obj.__index = obj

-- #define lua_number2int(i,d) \
--   { volatile union luai_Cast u; u.l_d = (d) + 6755399441055744.0; (i) = u.l_l; }

local h1 = hs.timer.hours(1)
local d1 = hs.timer.days(1)
local m1 = hs.timer.minutes(1)

local batTime1 = hs.timer.secondsSinceEpoch()
local batTime2 = batTime1
local batTime = 0


function obj:init()
    self.menubar = hs.menubar.new()
    hs.battery.getAll()
    obj:rescan()
end


local function data_diff()
    --电量百分比计算
    obj.kbin = string.format("%3.0f",hs.battery.percentage()) .. '%'
    --剩余时间计算

    if (hs.battery.amperage()>0) then   --充电中
        batTime1 = 0;       --使用电池时间归零
        local timeToFull = hs.battery.timeToFullCharge()
        local timeM = timeToFull%60
        local timeH = (timeToFull-timeM)/60
        obj.kbout = string.format("%02d:%02d",timeH,timeM)
    elseif (hs.battery.timeRemaining() < 0) then    --没有充电，计算中 

        if(batTime1 == 0) then 
            batTime1 = hs.timer.secondsSinceEpoch()     --记录开始使用电池时间
        end

        obj.kbout = ' ----- '

    elseif(hs.battery.powerSource() == "Battery Power" ) then   --剩余电量
        -- if(batTime1 == 0) then 
        --     batTime1 = hs.timer.secondsSinceEpoch()
        -- end
        local timeReamin = hs.battery.timeRemaining()
        local timeRm = timeReamin%60
        local timeRh = (timeReamin- timeRm)/60
        obj.kbout = string.format("%2d:%02d",timeRh,timeRm)
    end

    --充电状态指示
    local disp_str
    if (hs.battery.amperage()>0) then
        if(hs.battery.timeToFullCharge() > 0) then 
            disp_str = '充Cap:' .. obj.kbin  .. '\n电Tim:' .. obj.kbout  
        else
            disp_str = '充Cap:' .. obj.kbin  .. '\n满Tim:' .. obj.kbout   
        end
    else 
        disp_str = 'Cap:' .. obj.kbin  .. '\nTim:' .. obj.kbout 

    end
    if obj.darkmode then
        obj.disp_str = hs.styledtext.new(disp_str, {font={size=9.0, color={hex="#FFFFFF"}}})
    else
        obj.disp_str = hs.styledtext.new(disp_str, {font={size=9.0, color={hex="#000000"}}})
    end
    obj.menubar:setTitle(obj.disp_str)
end

hs.timer.absoluteTime()



populateMenu = function(key)
    --setTitle() -- Update the counter every time the menu is refreshed
    startTime = hs.timer.absoluteTime()
    startS = startTime/1000000000

    startM = (startS%h1)/m1
    startH = (startS%d1-startM*60)/h1
    startD = (startS-startH*h1)/d1

    STIME = string.format("%2.0fday%2.0fh%2.0fmin",startD,startH,startM)    --开机时间


    if(batTime1 >0) then 
        batTime2 = hs.timer.secondsSinceEpoch()
        batTime = batTime2-batTime1
        batM = (batTime%h1)/m1
        batH = (batTime%d1 - batM*m1)/h1
        batD = (batTime-batH*h1)/d1
    else
        batTime = 0
        batM = 0
        batH = 0
        batD = 0
    end



    BTIME = string.format("%2.0fday%2.0fh%2.0fmin",batD,batH,batM)      --使用电池时间

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

    table.insert(menuData,{
        title = "系统启动时间：" .. STIME 
    })
    table.insert(menuData,{
        title = "使用电池时间：" .. BTIME 
    })
    -- menuData = hs.battery.getAll()
    -- menuData.voltage
    return menuData
end



function obj:rescan()
    obj.menubar:setMenu(populateMenu)
    data_diff()
--    hs.battery.watcher.new(data_diff):start()
    timer = hs.timer.new(1, data_diff)
    timer:start()
end

return obj
