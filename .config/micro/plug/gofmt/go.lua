VERSION = "0.0.1"

local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")
local buffer = import("micro/buffer")

function onSave(bp)
    if bp.Buf:FileType() == "go" then
        bp:Save()
	    local _, err = shell.RunCommand("gofmt -s -w " .. bp.Buf.Path)
	    if err ~= nil then
	        micro.InfoBar():Error(err)
	        return true
	    end
    bp.Buf:ReOpen()
    end

    return true
end
