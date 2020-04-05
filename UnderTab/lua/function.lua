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

function fun.GetSizeTextX( ... )
    local Table_ = {...}
    surface.SetFont(Table_[1])
    local x , y = surface.GetTextSize(Table_[2])
    return x 
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


function fun.SaveSetting( ...  )
    local Table_ = {...}
    --Table_[1] - Название файла 
    local IsValidFile = file.Exists("data/"..Table_[1], "GAME") 
    if Table_[3] then  
        print( config[Table_[2]] )  
        config[Table_[2]] = Table_[3]
        print( config[Table_[2]] ) 
    end 
    if not IsValidFile then      
        local json_ = util.TableToJSON( config ) 
        file.Append( Table_[1] , json_ )
    else 
        local json_ = util.TableToJSON( config ) 
        file.Delete( Table_[1] )
        file.Append( Table_[1] , json_ )    
    end 
end 

function fun.ResetSetting( ...  )
    local Table_ = {...}
    local IsValidFile = file.Exists("data/"..Table_[1], "GAME") 
    config.Active = true        
    config.sizeFrame = {ScrW() * 0.75, ScrH() * 0.75}
    config.sizePanel = {35 , 75 }
    if not IsValidFile then      
        local json_ = util.TableToJSON( config ) 
        file.Append( Table_[1] , json_ )
    else 
        local json_ = util.TableToJSON( config ) 
        file.Delete( Table_[1] )
        file.Append( Table_[1] , json_ )    
    end 
end

function fun.OpenLastSetting( ... ) 
    local Table_ = {...}
    local IsValidFile = file.Exists("data/"..Table_[1], "GAME") 
    if IsValidFile then
        local Text_ = file.Read( Table_[1] , "DATA" )
        if string.len(Text_) > string.len("{\"sizeFrame\":[0.0,0.0],\"sizePanel\":[0.0,0.0],\"Active\":true}") then 
            local json_ = util.JSONToTable(Text_)        
            for _,k in pairs(json_) do               
                if type(k) == "table" then 
                    for __,k_ in pairs(k) do                      
                        config[_][__] = k_                                            
                    end 
                else 
                    config.Active = k 
                end     
            end 
        end 
    else 
        fun.SaveSetting( "scoreboardsetting.txt")
    end 
end 