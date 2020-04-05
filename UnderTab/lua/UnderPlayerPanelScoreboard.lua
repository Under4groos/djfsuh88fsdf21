
local PANEL = {}
function PANEL:Init()
    self:SetSize(10 ,10 )
    self:SetPos(0,0)
    self:SetText("")
    self.Avatar = vgui.Create( "AvatarImage", self )
    self.Avatar:SetSize( config.sizePanel[1] , config.sizePanel[1] )
    self.Avatar:SetAlpha(200)

    self.buttonUrl = vgui.Create( "DButton", self.Avatar )
    self.buttonUrl:SetText( " " )					
    self.buttonUrl:SetPos( 0, 0 )					
    self.buttonUrl:SetSize( self.Avatar:GetWide() , self.Avatar:GetTall() )				
    self.buttonUrl.Paint = function(self,w,h) end

    self.name = vgui.Create( "DLabel", self ) 
    self.name:SetFont("Name") 
    self.name.Paint = function(self,w,h)
        draw.RoundedBox(0,0,0,w,h, UnderPlayerPanelScoreboard.colorBackground ) 
    end  
    self.name:SetTextColor( Color(0,0,0,255) ) 



end

function PANEL:SetPalayer( player_ , size )
    self.Avatar:SetPlayer( player_ , size )
    self.Avatar:SetSize( size , size )
    self.buttonUrl:SetSize( size , size )
    self.name:SetPos(10 + size,0 )
    self.name.Paint = function(self,w,h)
        draw.RoundedBox(0,0,0,w,h, fun.GetTeamColor( player_ , 100 ) ) 
    end 

    
    surface.SetFont("Name")
    local x , y = surface.GetTextSize(player_:Name())
    self.name:SetSize(x + 25,font.size + 10)	
    self.name:SetText( "  ".. player_:Name() )
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

