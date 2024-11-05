EnablePrimaryMouseButtonEvents(true) -- 启用鼠标事件
local all_button = 3  -- 定义开关按钮
local is_open_up = false -- 启开关，默认关闭

function OnEvent(event, arg)
    OutputLogMessage('Event: '..event..', Arg: '..arg..'\n')

    -- 切换开关
    if (event == "G_PRESSED" and arg == all_button) then
        is_open_up = not is_open_up
        if is_open_up then
            OutputLogMessage("开 on \n")
        else
            OutputLogMessage("关 off \n")
        end
    end

    -- 侧键5被按下且开关开启时，进入节奏循环，模拟按下 F8
    if (is_open_up and event == "G_PRESSED" and arg ==1) then
        OutputLogMessage("进入节奏 (F8)\n")

        repeat
            PressKey("f8") -- 模拟按下 F8 键
            Sleep(math.random(15, 20)) -- 按下的延迟
            ReleaseKey("f8") -- 模拟松开 F8 键
            Sleep(math.random(40, 60)) -- 间隔时间
        until IsModifierPressed("alt")-- 侧键5松开时结束循环

        OutputLogMessage("进入节奏终止 (F8)\n")
    end

    -- 侧键4被按下且开关开启时，进入节奏循环，模拟按下 F9
    if (is_open_up and event == "G_PRESSED" and arg ==2) then	
        OutputLogMessage("进入节奏 (F9)\n")

        repeat
            PressKey("f9") -- 模拟按下 F9 键
            Sleep(math.random(15, 20)) -- 按下的延迟
            ReleaseKey("f9") -- 模拟松开 F9 键
            Sleep(math.random(40, 60)) -- 间隔时间
        until IsModifierPressed("alt") -- 侧键4松开时结束循环

        OutputLogMessage("进入节奏终止 (F9)\n")
    end
end