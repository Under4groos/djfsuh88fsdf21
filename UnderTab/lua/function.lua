///////////

fun = {}

--# 1 table 2 player 3 pos 
function fun.AddPlayerPanel( ... )
    local Table_ = {...}
    if not IsValid( Table_[1] ) then return end 

    local panel = vgui.Create("UnderPlayerPanelScoreboard")
    local x , y = Table_[1]:GetSize()


    panel:SetSize(x, config.sizePanel )

    PAnels[#PAnels] = PAnels

    Table_[1]:Add(panel)
end