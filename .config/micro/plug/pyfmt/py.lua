VERSION = "0.0.1"

local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")
local buffer = import("micro/buffer")

function onSave(bp)
    if bp.Buf:FileType() == "python" then
        bp:Save()
	    local _, err = shell.RunCommand("black " .. bp.Buf.Path)
	    if err ~= nil then
	        micro.InfoBar():Error(err)
	        return true
	    end
	    _, err = shell.RunCommand("isort " .. bp.Buf.Path)
	    if err ~= nil then
	        micro.InfoBar():Error(err)
	        return true
	    end
    bp.Buf:ReOpen()
    end

    return true
end
