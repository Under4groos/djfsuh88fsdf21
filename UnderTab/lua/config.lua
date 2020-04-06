config = {}
    config.Active = true        
    config.sizeFrame = {ScrW() * 0.75, ScrH() * 0.75}
    config.sizePanel = {20 , 75 }
    config.posFrame = { ScrW() /2 , ScrH()/2}

file_ = {}
    file_.folderName = "data/UnderScoreboard/"
    file_.folderName_ = "UnderScoreboard/"
PAnels = {}

stringName_ = { {"Prop: " ,"props" } , {"Npc: "  , "npcs" } , { "Ragdolls: " , "ragdolls"} , {"Vehicles: " , "vehicles"}}

    
UnderFrameScoreboard = {}
    UnderFrameScoreboard.color = Color(145,145,145,0)

UnderPlayerPanelScoreboard = {}
    UnderPlayerPanelScoreboard.color = Color(100,100,100,200)
    UnderPlayerPanelScoreboard.colorIsDead = Color(127,255,255,100)
    UnderPlayerPanelScoreboard.colorBackground = Color(33,33,33,100)
    UnderPlayerPanelScoreboard.colorBackgroundTime = Color(255,255,255,100)    
font = {}
    font.size = 15
    font.weight = 900
