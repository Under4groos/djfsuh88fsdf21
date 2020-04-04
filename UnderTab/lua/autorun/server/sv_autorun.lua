/////////



if SERVER then 
    local TableLuaCL = {"config.lua", "function.lua" , "UnderPlayerPanelScoreboard.lua" , "UnderFrameScoreboard.lua" , "init.lua" }
    for _,k in pairs(TableLuaCL) do 
        AddCSLuaFile( k )
    end
end 

