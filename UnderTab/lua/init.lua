///////


TAB = TAB or {}







function TAB.scoreboardCreationFrame()
    if config.Active then 
        TAB.vguiFrame = vgui.Create("UnderFrameScoreboard")
        TAB.vguiFrame:SetSize(config.sizeFrame[1],config.sizeFrame[2] )
       
        


        return config.Active 
    end 
end





function TAB.run()
    

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


