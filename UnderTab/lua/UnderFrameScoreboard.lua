local PANEL = {}

function PANEL:Init()
    self:SetSize( ScrW() * 0.75, ScrH() * 0.75 )
    self:Center()

    self.Scroll = vgui.Create( "DScrollPanel", self ) 
    self.Scroll:Dock( FILL )

end

function PANEL:Add( panel )

    self.Scroll:Add( panel )
end


function PANEL:Paint( w, h )
    draw.RoundedBox( 0, 0, 0, w, h, UnderFrameScoreboard.color or Color(145,145,145,100) )
end
vgui.Register( "UnderFrameScoreboard", PANEL, "DPanel" )

