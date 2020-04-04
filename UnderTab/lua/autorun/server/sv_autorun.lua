/////////



if SERVER then 
    local TableLuaCL = { "config.lua","frame.lua" , "init.lua"}
    for _,k in pairs(TableLuaCL) do 
        AddCSLuaFile( k )
    end
    AddCSLuaFile()
end 

