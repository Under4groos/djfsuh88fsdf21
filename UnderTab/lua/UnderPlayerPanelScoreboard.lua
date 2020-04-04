/////


local PANEL = {}
function PANEL:Init()
    self:SetSize(10 ,10 )
    self:SetPos(0,0)

    --self.icon = vgui.Create(string classname, Panel parent=nil, string name=nil)

    
end
function PANEL:Paint( w, h )
    draw.RoundedBox( 0, 0, 0, w, h, UnderPlayerPanelScoreboard.color or  Color(127,255,255,255) )
end
vgui.Register( "UnderPlayerPanelScoreboard", PANEL, "DButton" )

