
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

    self.rank = vgui.Create( "DLabel", self ) 
    self.rank:SetFont("Name") 
    self.rank.Paint = function(self,w,h)
        draw.RoundedBox(0,0,0,w,h, UnderPlayerPanelScoreboard.colorBackground ) 
    end  
    self.rank:SetTextColor( Color(0,0,0,255) ) 

end

function PANEL:SetPalayer( player_ , size )
    self.Avatar:SetPlayer( player_ , size )
    self.Avatar:SetSize( size , size )
    self.buttonUrl:SetSize( size , size )

    local Color_rank = fun.GetTeamColor( player_ , 100 )
    local x = fun.GetSizeTextX( "Name" , "  Name: "..player_:Name()  )
    self.name:SetSize(x + 10,font.size + 5)	
    self.name:SetText( "  Name: ".. player_:Name() )
    self.name:SetPos(10 + size,0 )
    self.name.Paint = function(self,w,h)
        draw.RoundedBox(0,0,0,w,h, Color_rank ) 
    end 

    local Name_rank = fun.GetPlayerRank( player_ )
    local x = fun.GetSizeTextX( "Name" , "  Rank: "..Name_rank )
    self.rank:SetSize(x + 10,font.size + 5)	
    self.rank:SetPos( (20+size) + self.name:GetWide() ,0 )
    self.rank.Paint = function(self,w,h) draw.RoundedBox(0,0,0,w,h,Color_rank) end
    self.rank:SetText( "  Rank: ".. Name_rank )
    
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

