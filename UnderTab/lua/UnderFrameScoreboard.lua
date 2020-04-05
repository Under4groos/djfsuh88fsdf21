local PANEL = {}
function PANEL:Init()
    self:SetSize( ScrW() * 0.75, ScrH() * 0.75 )
    self:Center()
    self.Scroll = vgui.Create( "DScrollPanel", self ) 
    self.Scroll:SetSize(self:GetWide() + 20,self:GetTall())   
end
function PANEL:Add( panel )
    self.Scroll:Add( panel )
end
local I = 0
local I_ = 1
local Dis = 9 
local TableSize = {}
function PANEL:Paint( w, h )
    draw.RoundedBox( 0, 0, 0, w, h, UnderFrameScoreboard.color or Color(145,145,145,0) )    
end
vgui.Register( "UnderFrameScoreboard", PANEL, "DPanel" )

