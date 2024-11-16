fEnablePrimaryMouseButtonEvents(true) -- 启用鼠标事件
local all_button = 4  -- 定义开关按钮
local is_open_up = false -- 启开关，默认关闭

function OnEvent(event, arg)
    OutputLogMessage('Event: '..event..', Arg: '..arg..'\n')

    -- 切换开关
    if (event == "MOUSE_BUTTON_PRESSED" and arg == all_button) then
        is_open_up = not is_open_up
        if is_open_up then
            OutputLogMessage("开 on \n")
        else
            OutputLogMessage("关 off \n")
        end
    end

    -- 侧键5被按下且开关开启时，进入节奏循环，模拟按下 F8
    if (is_open_up and (event == "MOUSE_BUTTON_RELEASED" and arg==1)) then
		PressKey("f") -- 模拟按下 F8 键
            Sleep(math.random(15, 20)) -- 按下的延迟
            ReleaseKey("f") -- 模拟松开 F8 键
    end

   
end
