local PANEL = {}
function PANEL:Init()
    self:SetSize( ScrW() * 0.75, ScrH() * 0.75 )
    self:SetPos( ScrW()/2 , ScrH()/2 )
    self.Scroll = vgui.Create( "DScrollPanel", self ) 
    self.Scroll:SetSize(self:GetWide() + 20,self:GetTall())   
end
function PANEL:Add( panel )
    self.Scroll:Add( panel )  
end
function PANEL:ScrollSetSize()
    self:SetSize( config.sizeFrame[1] , config.sizeFrame[2] )
    self.Scroll:SetSize(self:GetWide() + 20,self:GetTall())  
    
end 
function PANEL:Paint( w, h )   
    draw.RoundedBox( 0, 0, 0, w, h, UnderFrameScoreboard.color )    
end
vgui.Register( "UnderFrameScoreboard", PANEL, "DPanel" )

