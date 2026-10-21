script_name('PVBEZ UI')
script_version('1.0')

local imgui = require("mimgui")

-- وضعیت باز یا بسته بودن پنجره
local windowOpen = imgui.new.bool(false)

-- ═══════════════════════════════════════════════════════
-- استایل و رنگ‌بندی اختصاصی صفحه
-- ═══════════════════════════════════════════════════════
imgui.OnInitialize(function()
    local style = imgui.GetStyle()
    style.WindowRounding   = 8
    style.WindowBorderSize = 1
    style.FrameRounding    = 5
    
    -- رنگ پس‌زمینه (تیره و شیک)
    style.Colors[imgui.Col.WindowBg] = imgui.ImVec4(0.05, 0.05, 0.08, 0.95)
    -- رنگ حاشیه
    style.Colors[imgui.Col.Border]   = imgui.ImVec4(0.20, 0.20, 0.30, 1.00)
    -- رنگ دکمه‌ها
    style.Colors[imgui.Col.Button]        = imgui.ImVec4(0.15, 0.15, 0.25, 1.00)
    style.Colors[imgui.Col.ButtonHovered] = imgui.ImVec4(0.25, 0.25, 0.40, 1.00)
    style.Colors[imgui.Col.ButtonActive]  = imgui.ImVec4(0.35, 0.15, 0.50, 1.00)
end)

-- ═══════════════════════════════════════════════════════
-- رسم صفحه گرافیکی
-- ═══════════════════════════════════════════════════════
imgui.OnFrame(function() return windowOpen[0] end, function()
    imgui.SetNextWindowSize(imgui.ImVec2(400, 320), imgui.Cond.FirstUseEver)
    
    -- عنوان پنجره با رنگ سبز نئونی
    imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.0, 1.0, 0.5, 1.0))
    imgui.Begin("PVBEZ CHEAT MENU", windowOpen)
    imgui.PopStyleColor(1)

    imgui.Spacing()

    -- متن‌های پیام (با رنگ‌های مختلف)
    imgui.TextColored(imgui.ImVec4(1.0, 0.3, 0.3, 1.0), "Salam Mohlat Test Tmam | Shode Ast")
    imgui.Spacing()
    
    imgui.TextColored(imgui.ImVec4(1.0, 1.0, 0.0, 1.0), "Baray Kharid Cheat Haye \\/")
    
    -- لیست چیت‌ها
    imgui.BulletText("Job Bargh")
    imgui.BulletText("Job mahigiri")
    imgui.BulletText("Unjail")
    imgui.BulletText("Telport")
    imgui.BulletText("Spect Finder...")
    
    imgui.Spacing()
    imgui.Separator()
    imgui.Spacing()
    
    -- بخش تلگرام
    imgui.TextColored(imgui.ImVec4(1.0, 0.5, 0.0, 1.0), "Dar Telegram be id @pvbez Peyam Dahid")

    imgui.Spacing()
    imgui.Spacing()

    -- دکمه بستن
    if imgui.Button("Close", imgui.ImVec2(100, 30)) then
        windowOpen[0] = false
    end

    imgui.End()
end)

-- ═══════════════════════════════════════════════════════
-- تابع اصلی
-- ═══════════════════════════════════════════════════════
function main()
    while not isSampAvailable() do wait(100) end

    sampAddChatMessage("{00BFFF}[PVBEZ] {FFFFFF}Menu Loaded! Type /pvbez to open.", -1)

    -- ثبت دستور برای باز کردن صفحه
    sampRegisterChatCommand("fish", function()
        windowOpen[0] = not windowOpen[0]
    end)

    while true do wait(0) end
end