local PANEL = {}

function PANEL:Init()
    self:SetSize( ScrW() * 0.75, ScrH() * 0.75 )
    self:Center()
end
function PANEL:Paint( w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color(145,145,145,100) )
end
vgui.Register( "UnderFrameScoreboard", PANEL, "DPanel" )

