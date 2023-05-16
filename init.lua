_G.LVIM_NVIM_VERSION = vim.version()
if _G.LVIM_NVIM_VERSION.major == 0 and _G.LVIM_NVIM_VERSION.minor < 8 then
    print("LVIM IDE required Neovim >= 0.8.0")
else
    require("core")
end

local should_profile = os.getenv("NVIM_PROFILE")
if should_profile then
    require("profile").instrument_autocmds()
    if should_profile:lower():match("^start") then
        require("profile").start("*")
    else
        require("profile").instrument("*")
    end
end

local function toggle_profile()
    local prof = require("profile")
    if prof.is_recording() then
        prof.stop()
        vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" }, function(filename)
            if filename then
                prof.export(filename)
                vim.notify(string.format("Wrote %s", filename))
            end
        end)
    else
        prof.start("*")
    end
end
vim.keymap.set("", "<f1>", toggle_profile)
