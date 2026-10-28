script_name('PV Spam')
script_version('1.0')

-- ═══════════════════════════════════════════════════════
-- تابع اسپم کردن متن در چت
-- ═══════════════════════════════════════════════════════
local function spamMessage()
    local msg = "{00BFFF}[PVBEZ] {FFFFFF}Mohlat Test Tmam Shod | Baray Kharid be @pvbez dar Telegram Payam Dahid."
    
    lua_thread.create(function()
        for i = 1, 20 do
            sampAddChatMessage(msg, -1)
            wait(100) -- ۱۰۰ میلی‌ثانیه تاخیر بین هر پیام (برای جلوگیری از کرش یا کیک شدن)
        end
    end)
end

-- ═══════════════════════════════════════════════════════
-- تابع اصلی
-- ═══════════════════════════════════════════════════════
function main()
    while not isSampAvailable() do wait(100) end

    -- ثبت دستور /pv
    sampRegisterChatCommand("pv", spamMessage)

    while true do wait(0) end
end