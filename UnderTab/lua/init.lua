
TAB = TAB or {}


function TAB.scoreboardCreationFrame()
    fun.OpenLastSetting( "scoreboardsetting.txt" ) 
    if config.Active then 
        config.sizeFrame =  config.sizeFrame or {ScrW() * 0.75, ScrH() * 0.75}
        
        TAB.vguiFrame = vgui.Create("UnderFrameScoreboard")
        TAB.vguiFrame:SetSize(config.sizeFrame[1],config.sizeFrame[2] )
        TAB.vguiFrame:MakePopup()
        for _,k in pairs( player.GetAll() ) do 
           fun.AddPlayerPanel( TAB.vguiFrame.Scroll , "UnderPlayerPanelScoreboard" , _ , fun.GetSizeX( TAB.vguiFrame ) , k )
        end 
        return config.Active 
    end 
end

-- функция для правильного размещения панели ( уебищная )
function TAB.run()
    if IsValid( TAB.vguiFrame ) or config.Active  then 
        local Pos_ = 0
        local Time = 0
        for _,k in pairs( fun.table ) do
            if IsValid(k) then 
                if _ < 2 then 
                    local x , y = k:GetSize() 
                    Pos_ = 5 + config.sizePanel[1] + (Pos_ + y)
                else 
                    local x , y = k:GetSize() 
                    Pos_ = 5 + (Pos_ + y)
                end   
                if IsValid(fun.table[_ + 1]) then  
                    fun.table[_+1]:SetPos(0,Pos_ + 10 )   
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


concommand.Add("scoreboardug", function( ply, cmd, args )
    if ply == LocalPlayer() then 
        if args[1] == "1" then 
            config.Active = true
            fun.SaveSetting( "scoreboardsetting.txt" , "Active" , true  )  
        elseif( args[1] == "0" ) then 
            config.Active = false 
            fun.SaveSetting( "scoreboardsetting.txt" , "Active" , false   )
        else 
            Msg(" 1 / 0 ") 
        end        
    end
end)