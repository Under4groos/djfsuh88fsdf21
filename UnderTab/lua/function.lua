///////////

fun = {}
fun.table = {}
fun.ButtonActive = {}


function fun.GetSizeX( panel )
    local x , y = panel:GetSize()
    return x or 0
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
            else 
                Size_ = config.sizePanel[1]
            end 
            fun.table[Table_[3]]:IMGSetSize( Size_ /2 )
            fun.table[Table_[3]]:SetSize( x , Size_ ) 
        end
        
    end    
end