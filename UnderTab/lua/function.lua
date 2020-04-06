///////////

fun = {}
fun.PanelsButton = {}
fun.ButtonActive = {}





-- ULX TIME 
function fun.GetUlXtime( ... )
	local Table_ = {...}
	if IsValid( Table_[1] ) then
        if GetConVar( "utime_enable" ) != nil  then 
		
			local tmp =  Table_[1]:GetUTime() + CurTime() - Table_[1]:GetUTimeStart() 
			if tmp == nil then 
				tmp = 0 
			end 
			local s = tmp % 60
			tmp = math.floor( tmp / 60 )
			local m = tmp % 60
			tmp = math.floor( tmp / 60 )
			local h = tmp % 24
			tmp = math.floor( tmp / 24 )
			local d = tmp % 7
			local w = math.floor( tmp / 7 )
			return string.format( "%02iw %id %02ih %02im %02is", w, d, h, m, s )
		else 
			return "-"
		end 
	else
		return "-"
	end   
end



function fun.font( ... )
    local Table_ = {...}
    surface.CreateFont( "Name", {
        font = "Arial",
        extended = false,
        size = Table_[1] or 15,
        weight = Table_[2] or 500
    })
end 


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
    if Table_[2] then
        local x , y = surface.GetTextSize(Table_[2])
        return x 
    else 
        return 0 
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


--# Добавление панелей в  DScrollPanel панель 
function fun.AddPlayerPanel( ... )
    local Table_ = {...}
    local Size_ = 0
    if IsValid( Table_[1] ) then 
        local panel = vgui.Create( Table_[2] , Table_[1] )
        local x = Table_[4] or 10 
        panel:SetSize(x, config.sizePanel[1] )
        panel:SetPos( 0 , 10 +  Table_[3] * config.sizePanel[1]  )
        panel:SetPalayer( Table_[5] , config.sizePanel[1] )  
        fun.ButtonActive[Table_[3]] = false  
        fun.PanelsButton[Table_[3]] = panel
        fun.PanelsButton[Table_[3]].DoClick  = function()
            fun.ButtonActive[Table_[3]] = not fun.ButtonActive[Table_[3]]
            if fun.ButtonActive[Table_[3]] then         
                Size_ = config.sizePanel[2]
                fun.PanelsButton[Table_[3]]:IMGSetSize( Size_ /2 + 8 )
            else 
                Size_ = config.sizePanel[1]
                fun.PanelsButton[Table_[3]]:IMGSetSize( Size_  )
            end     
            fun.PanelsButton[Table_[3]]:SetSize( x , Size_ ) 
        end  
    end    
end

-- Сохранение настроек ебучей уебищной панели 
function fun.isMyFileDir( name )
    local IsValidFile = file.Exists( name or "UnderScoreboard", "DATA")
    if not IsValidFile then 
        file.CreateDir( name or "UnderScoreboard" )
        MsgC( Color(33,255,255,255) , "Created a folder in DATA\n")
        return true 
    end  
end

function fun.SaveSetting( ... )
    local Table_ = {...}
    --Table_[1] файл 
    -- Table_[2] таблица 
    -- Table_[3] в какой раздел 
    -- Table_[4] что сохр 
    fun.isMyFileDir()
    local IsValidFile = file.Exists( Table_[1], "DATA") 
    if #Table_ > 2 then         
        Table_[2][Table_[3]] = Table_[4]     
    end 
 
    if not IsValidFile then      
        local json_ = util.TableToJSON( Table_[2] ) 
        file.Append( Table_[1] , json_ )
        MsgC( Color(33,255,255,255) , "Created a file in DATA ".. Table_[1] .."\n")
    else 
        local json_ = util.TableToJSON( Table_[2] ) 
        file.Delete( Table_[1] )
        file.Append( Table_[1] , json_ )    
    end 

end 

function fun.ResetSetting( ... )
    local Table_ = {...}
    fun.isMyFileDir()
    local IsValidFile = file.Exists(Table_[1], "DATA") 
    if not IsValidFile then      
        local json_ = util.TableToJSON( Table_[2] ) 
        file.Append( Table_[1] , json_ )
        MsgC( Color(33,255,255,255) , "Created a file in DATA ".. Table_[1] .."\n")
    else 
        local json_ = util.TableToJSON( Table_[2] ) 
        file.Delete( Table_[1] )
        file.Append( Table_[1] , json_ )    
    end 
end
-- config 
    function fun.OpenLastSettingConfig( ... ) 
        local Table_ = {...}
        fun.isMyFileDir()
        local IsValidFile = file.Exists(Table_[1], "DATA") 
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
            fun.SaveSetting( Table_[1] , config )
        end 
    end 
-- font 
function fun.OpenLastSettingFont( ... ) 
        local Table_ = {...}
        fun.isMyFileDir()
        local IsValidFile = file.Exists(Table_[1], "DATA") 
        if IsValidFile then
            local Text_ = file.Read( Table_[1] , "DATA" )
            if string.len(Text_) > string.len(" ") then 
                local json_ = util.JSONToTable(Text_)        
                for _,k in pairs(json_) do          
                    if type( k ) == "number" then 
                        font[_] = k
                    end 
                end 
                fun.font( font.size  , font.weight )
            end 
        else 
            fun.SaveSetting( Table_[1] , font )
        end 
    end 