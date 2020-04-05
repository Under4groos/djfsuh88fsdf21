
local PANEL = {}
function PANEL:Init()
    self:SetSize(10 ,10 )
    self:SetPos(0,0)
    self:SetText("")
    self.Avatar = vgui.Create( "AvatarImage", self )
    self.Avatar:SetSize( config.sizePanel[1] , config.sizePanel[1]  )
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
    self.name:SetPos( 5 + size,0 )
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
    
    -- count prop 
    local text_ = stringName_[1][1] .. tostring(player_:GetCount( stringName_[1][2] ))
    local x = fun.GetSizeTextX( "Name" , text_  )
    self.count_prop = vgui.Create( "DButton", self ) 
    self.count_prop:SetText( text_ )
    self.count_prop:SetFont("Name")
    self.count_prop:SetPos( 0 , config.sizePanel[2] - 25 )					
    self.count_prop:SetSize(  x + 20 , 30 )					
    self.count_prop.DoClick = function()				
        MsgC( Color( 255,255,255,255) , "Name: \""..player_:Name() .. "\" "..text_.."\n" )		
    end
    self.count_prop.Paint = function(self,w,h)
        draw.RoundedBox(0,0,0,w,h, Color(200,200,200,255) ) 
    end  
    self.count_prop:SetTextColor( Color(0,0,0,255) ) 

    -- count npc 
    local text_ = stringName_[2][1] .. tostring(player_:GetCount( stringName_[2][2] ))
    x = x + fun.GetSizeTextX( "Name" , text_  )
    self.count_npc = vgui.Create( "DButton", self ) 
    self.count_npc:SetText( text_ )
    self.count_npc:SetFont("Name")
    self.count_npc:SetPos( x - 10 , config.sizePanel[2] - 25 )					
    self.count_npc:SetSize(  x  , 30 )					
    self.count_npc.DoClick = function()				
        MsgC( Color( 255,255,255,255) , "Name: \""..player_:Name() .. "\" "..text_.."\n" )		
    end
    self.count_npc.Paint = function(self,w,h)
        draw.RoundedBox(0,0,0,w,h, Color(200,200,200,255) ) 
    end  
    self.count_npc:SetTextColor( Color(0,0,0,255) ) 


    local text_ = stringName_[3][1] .. tostring(player_:GetCount( stringName_[3][2] ))
    
    self.count_ragdolls = vgui.Create( "DButton", self ) 
    self.count_ragdolls:SetFont("Name") 
    self.count_ragdolls:SetText( text_ )
       
    x = 8 + x + fun.GetSizeTextX( "Name" , text_  )
    self.count_ragdolls:SetSize(  x  , 30 )	
    self.count_ragdolls:SetPos( x , config.sizePanel[2] - 25 )					
    self.count_ragdolls:SetSize(  x/2 + 20  , 30 )					
    self.count_ragdolls.DoClick = function()				
        MsgC( Color( 255,255,255,255) , "Name: \""..player_:Name() .. "\" "..text_.."\n" )		
    end
    self.count_ragdolls.Paint = function(self,w,h)
        draw.RoundedBox(0,0,0,w,h, Color(200,200,200,255) ) 
    end  
    self.count_ragdolls:SetTextColor( Color(0,0,0,255) ) 

end 
function PANEL:IMGSetSize( size )
    self.name:SetPos( 5 + size,0 )
    self.rank:SetPos( (20+size) + self.name:GetWide() ,0 )
    self.Avatar:SetSize( size , size )
    self.buttonUrl:SetSize( size , size )
end 




function PANEL:Paint( w, h )
    draw.RoundedBox( 0, 0, 0, w, h, UnderPlayerPanelScoreboard.color or  Color(127,255,255,255) )
end
vgui.Register( "UnderPlayerPanelScoreboard", PANEL, "DButton" )

