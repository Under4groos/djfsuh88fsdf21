///////////

fun = {}
fun.table = {}
fun.ButtonActive = {}

function fun.font( ... )
    local Table_ = {...}
    surface.CreateFont( "Name", {
        font = "Arial",
        extended = false,
        size = Table_[1] or 15,
        weight = Table_[2] or 500
    })
end 
fun.font( font.size  , font.weight )


function fun.GetPlayerRank( player )
    if( IsValid( player ) ) then 
        local rank_ = team.GetName(player:Team())
        if( rank_ == "Unassigned") then 
            return "No rank"
        else
            return rank_
        end
    end
end

function fun.GetTeamColor( ... )
    local Table_ = {...}
    if( IsValid( Table_[1] ) ) then
        alpha = Table_[2] or 150
        return Color(team.GetColor(Table_[1]:Team()).r,team.GetColor(Table_[1]:Team()).g,team.GetColor(Table_[1]:Team()).b,Table_[2])       
    else    
        return Color(255,255,255,255) 
    end 
end

function fun.GetSizeX( panel )
    local x , y
    if IsValid( panel ) then 
        x , y = panel:GetSize()   
    end 
    return x or 15
end 

--# 1 table 2 player 3 pos 
function fun.AddPlayerPanel( ... )
    local Table_ = {...}
    local Size_ = 0
   -- PrintTable(Table_)
    if IsValid( Table_[1] ) then 
        local panel = vgui.Create( Table_[2] , Table_[1] )
        local x = Table_[4] or 10 
        panel:SetSize(x, config.sizePanel[1] )
        panel:SetPos( 0 , 10 +  Table_[3] * config.sizePanel[1]  )
        panel:SetPalayer( Table_[5] , config.sizePanel[1] )  
        fun.ButtonActive[Table_[3]] = false  
        fun.table[Table_[3]] = panel
        fun.table[Table_[3]].DoClick  = function()
            fun.ButtonActive[Table_[3]] = not fun.ButtonActive[Table_[3]]
            if fun.ButtonActive[Table_[3]] then         
                Size_ = config.sizePanel[2]
                 fun.table[Table_[3]]:IMGSetSize( Size_ /2 )
            else 
                Size_ = config.sizePanel[1]
                 fun.table[Table_[3]]:IMGSetSize( Size_  )
            end     
            fun.table[Table_[3]]:SetSize( x , Size_ ) 
        end      
    end    
end