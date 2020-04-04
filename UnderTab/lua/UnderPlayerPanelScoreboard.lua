
local PANEL = {}
function PANEL:Init()
    self:SetSize(10 ,10 )
    self:SetPos(0,0)
    --self.icon = vgui.Create(string classname, Panel parent=nil, string name=nil)   

    self.Avatar = vgui.Create( "AvatarImage", self )
    self.Avatar:SetSize( config.sizePanel[1] , config.sizePanel[1] )
    self.Avatar:SetAlpha(200)
    self.buttonUrl = vgui.Create( "DButton", self.Avatar )
    self.buttonUrl:SetText( " " )					
    self.buttonUrl:SetPos( 0, 0 )					
    self.buttonUrl:SetSize( self.Avatar:GetWide() , self.Avatar:GetTall() )				
    self.buttonUrl.Paint = function(self,w,h) end

end

function PANEL:SetPalayer( player_ , size )
    self.Avatar:SetPlayer( player_ , size )
    self.Avatar:SetSize( size , size )
    self.buttonUrl:SetSize( size , size )	
    self.buttonUrl.DoClick = function()
        if not ( player_:IsBot() ) then           
            gui.OpenURL("https://steamcommunity.com/linkfilter/?url=steamcommunity.com/profiles/"..player_:SteamID64().."/") 	
        end 
    end

end 

function PANEL:IMGSetSize( size )
    self.Avatar:SetSize( size , size )
    self.buttonUrl:SetSize( size , size )
end 

function PANEL:Paint( w, h )
    draw.RoundedBox( 0, 0, 0, w, h, UnderPlayerPanelScoreboard.color or  Color(127,255,255,255) )
end
vgui.Register( "UnderPlayerPanelScoreboard", PANEL, "DButton" )

