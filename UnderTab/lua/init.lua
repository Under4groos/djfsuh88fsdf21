
TAB = TAB or {}

function TAB.scoreboardCreationFrame()
    fun.OpenLastSettingConfig( file_.folderName_.."scoreboardsetting.txt" ) 
    fun.OpenLastSettingFont(file_.folderName_.."scoreboardfont.txt")
    if config.Active then  
        TAB.vguiFrame = vgui.Create("UnderFrameScoreboard")
        TAB.vguiFrame:ScrollSetSize()
        TAB.vguiFrame:SetSize( ScrW() * 0.75, ScrH() * 0.75 )
        TAB.vguiFrame:Center()
        TAB.vguiFrame:MakePopup()
        for _,k in pairs( player.GetAll() ) do 
           fun.AddPlayerPanel( TAB.vguiFrame.Scroll , "UnderPlayerPanelScoreboard" , _ , fun.GetSizeX( TAB.vguiFrame ) , k )
        end 
        return config.Active 
    end 
end

-- функция для размещения панелей ( уебищная система )
function TAB.run()
    if IsValid( TAB.vguiFrame ) or config.Active  then  
        local Pos_ = 0
        local Time = 0
        for _,k in pairs( fun.PanelsButton ) do
            if IsValid(k) then 
                if _ < 2 then 
                    local x , y = k:GetSize() 
                    Pos_ = 5 + config.sizePanel[1] + (Pos_ + y)
                else 
                    local x , y = k:GetSize() 
                    Pos_ = 5 + (Pos_ + y)
                end   
                if IsValid(fun.PanelsButton[_ + 1]) then  
                    fun.PanelsButton[_+1]:SetPos(0,Pos_ + 10 )   
                end
            end 
        end      
        Pos_ = 0
    end 
end

function TAB.scoreboardCloseFrame()
    if not ( IsValid(TAB.vguiFrame) ) then return end 
    TAB.vguiFrame:Remove()
end

-- Добавляем хуки 
for _ , k in pairs({
    {"ScoreboardShow","ShowScoreboard",TAB.scoreboardCreationFrame},
    {"ScoreboardHide","HideScoreboard",TAB.scoreboardCloseFrame},
    {"Think" , "TAB.run" , TAB.run }
    }) do 
    hook.Add( k[1] , k[2] , k[3] ) 
end 

-- Консольные комманды 
concommand.Add("scoreboardug", function( ply, cmd, args )
    if ply == LocalPlayer() then 
        if args[1] == "1" then 
            config.Active = true
            fun.SaveSetting( file_.folderName_.."scoreboardsetting.txt" , "Active" , true  )  
        elseif( args[1] == "0" ) then 
            config.Active = false 
            fun.SaveSetting( file_.folderName_.. "scoreboardsetting.txt" , "Active" , false   )
        else 
            Msg(" 1 / 0 ") 
        end        
    end
end)

concommand.Add("scoreboardug_sizePanel", function( ply, cmd, args )
    if ply == LocalPlayer() then 
        if args[1] and args[2] then
            if (string.len(args[1]) >= 2) and (string.len(args[2]) >= 2) then  
                if type( tonumber(args[1]) ) == "number" and type( tonumber(args[2]) ) == "number" then   
                    fun.SaveSetting( file_.folderName_.. "scoreboardsetting.txt" , config, "sizePanel" , { tonumber(args[1]) , tonumber(args[2])} )
                end 
            end 
        end 
    end
end)

concommand.Add("scoreboardug_reset", function( ply, cmd, args )
    if ply == LocalPlayer() then 
        config.Active = true        
        config.sizeFrame = {ScrW() * 0.75, ScrH() * 0.75}
        config.sizePanel = {20 , 75 }
        config.posFrame = { ScrW() /2 , ScrH()/2}
        fun.ResetSetting(  file_.folderName_.. "scoreboardsetting.txt" , config )
        
        font.size = 15
        font.weight = 900
        fun.ResetSetting(  file_.folderName_.. "scoreboardfont.txt" , font )
    end
end)
concommand.Add("scoreboardug_settextsize", function( ply, cmd, args )
    if ply == LocalPlayer() then 
        if args[1] then 
            if string.len(args[1]) >= 2 then             
                if type( tonumber(args[1]) ) == "number" then 
                    if tonumber(args[1]) >= 10 then 
                        print( tonumber(args[1]) )
                        fun.SaveSetting( file_.folderName_.."scoreboardfont.txt", font , "size", tonumber(args[1]) )
                    else 
                        fun.SaveSetting( file_.folderName_.."scoreboardfont.txt", font , "size", 10 )
                    end 
                end 
            end 
        end 
    end 
end)
concommand.Add("scoreboardug_settextweight", function( ply, cmd, args )
    if ply == LocalPlayer() then 
        if args[1] then 
            if string.len(args[1]) >= 2 then             
                if type( tonumber(args[1]) ) == "number" then 
                    if tonumber(args[1]) >= 100 then 
                        print( tonumber(args[1]) )
                        fun.SaveSetting( file_.folderName_.."scoreboardfont.txt", font , "weight", tonumber(args[1]) )
                    else 
                        fun.SaveSetting( file_.folderName_.."scoreboardfont.txt", font , "weight", 100 )
                    end 
                end 
            end 
        end 
    end 
end)