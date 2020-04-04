if CLIENT then 
    local TableLuaCL = {"config.lua", "function.lua" , "UnderPlayerPanelScoreboard.lua" , "UnderFrameScoreboard.lua" , "init.lua" }
    for _,k in pairs(TableLuaCL) do
        timer.Simple(_, function()
            include( k )
        end)
    end
end
