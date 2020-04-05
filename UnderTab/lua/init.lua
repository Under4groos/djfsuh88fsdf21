
TAB = TAB or {}

function TAB.scoreboardCreationFrame()
    fun.OpenLastSetting( file_.folderName_.."scoreboardsetting.txt" ) 
    if config.Active then  
        TAB.vguiFrame = vgui.Create("UnderFrameScoreboard")
        TAB.vguiFrame:SetSize(config.sizeFrame[1],config.sizeFrame[2] )
        TAB.vguiFrame:MakePopup()
        TAB.vguiFrame:ScrollSetSize()
        for _,k in pairs( player.GetAll() ) do 
           fun.AddPlayerPanel( TAB.vguiFrame.Scroll , "UnderPlayerPanelScoreboard" , _ , fun.GetSizeX( TAB.vguiFrame ) , k )
        end 
        return config.Active 
    end 
end

-- функция для правильного размещения панелей ( уебищная система )
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

concommand.Add("scoreboardug_size", function( ply, cmd, args )
    if ply == LocalPlayer() then 
        if args[1] and args[2] then
            fun.SaveSetting( 
                file_.folderName_.. "scoreboardsetting.txt" , 
                "sizeFrame" , 
                { tonumber(args[1]) , tonumber(args[2])} 
                )
        end 
    end
end)

concommand.Add("scoreboardug_reset", function( ply, cmd, args )
    if ply == LocalPlayer() then 
        fun.ResetSetting(  file_.folderName_.. "scoreboardsetting.txt"  )
    end
end)