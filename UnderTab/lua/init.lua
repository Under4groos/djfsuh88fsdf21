///////


TAB = TAB or {}







function TAB.scoreboardCreationFrame()
    if config.Active then 
        TAB.vguiFrame = vgui.Create("UnderFrameScoreboard")
        TAB.vguiFrame:SetSize(config.sizeFrame[1],config.sizeFrame[2] )
       
        TAB.vguiFrame:MakePopup()
        

        for _,k in pairs( player.GetAll() ) do 

           fun.AddPlayerPanel( TAB.vguiFrame.Scroll , "UnderPlayerPanelScoreboard" , _ , fun.GetSizeX( TAB.vguiFrame ))

        end 

        return config.Active 
    end 
end





function TAB.run()
    if IsValid( TAB.vguiFrame ) then 
        local Pos_ = 0
        local Time = 0
        for _,k in pairs( fun.table ) do
            if IsValid(k) then 

                if _ < 2 then 
                    local x , y = k:GetSize() 
                    Pos_ = 30 + (Pos_ + y)
                else 
                    local x , y = k:GetSize() 
                    Pos_ = 5 + (Pos_ + y)
                end   
                if IsValid(fun.table[_ + 1]) then  
                    fun.table[_+1]:SetPos(0,Pos_ + 10 )   
                end
            end 
        end 
        
        local SysTime_ = SysTime()
        if SysTime_ > Time then 
            local len_ = vgui.Create("DPanel" )
            len_:SetSize(25,25)
            len_:SetPos(0,Pos_ + 100)
            timer.Simple(0.1, function()
                len_:Remove()     
            end)
            Time = SysTime_ + 1
        end 

        Pos_ = 0
    end 
end


function TAB.scoreboardCloseFrame()
    if not ( IsValid(TAB.vguiFrame) ) then return end 
    TAB.vguiFrame:Remove()
end

--ScoreboardShow  ScoreboardHide
for _ , k in pairs({
    {"ScoreboardShow","ShowScoreboard",TAB.scoreboardCreationFrame},
    {"ScoreboardHide","HideScoreboard",TAB.scoreboardCloseFrame},
    {"Think" , "TAB.run" , TAB.run }

    }) do 
    hook.Add( k[1] , k[2] , k[3] ) 
end 


