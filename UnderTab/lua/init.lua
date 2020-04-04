///////


TAB = TAB or {}

function TAB.scoreboardCreationFrame()
    TAB.vguiFrame = vgui.Create("UnderFrameScoreboard")
end

function TAB.scoreboardCloseFrame()
    if not ( IsValid(TAB.vguiFrame) ) then return end 
    TAB.vguiFrame:Remove()
end

--ScoreboardShow  ScoreboardHide
for _ , k in pairs({{"ScoreboardShow","ShowScoreboard",TAB.scoreboardCreationFrame},{"ScoreboardHide","HideScoreboard",TAB.scoreboardCloseFrame}}) do 
    hook.Add( k[1] , k[2] , k[3] ) 
end 


