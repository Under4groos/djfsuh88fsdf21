/////////

TableLuaCL = { "frame.lua" , "init.lua"}

if SERVER then 
    for _,k in pairs(TableLuaCL) do 
        AddCSLuaFile( k )
    end
    AddCSLuaFile()
end 

if CLIENT then 
    for _,k in pairs(TableLuaCL) do 
        include( k )
    end
end
