config = {}
    config.Active = true        
    config.sizeFrame = {ScrW() * 0.75, ScrH() * 0.75}
    config.sizePanel = {35 , 75 }
  
file_ = {}
    file_.folderName = "data/UnderScoreboard/"
    file_.folderName_ = "UnderScoreboard/"
PAnels = {}

stringName_ = { {"Prop " ,"props" } , {"Npc "  , "npcs" }  }

    
UnderFrameScoreboard = {}
    UnderFrameScoreboard.color = Color(145,145,145,200)

UnderPlayerPanelScoreboard = {}
    UnderPlayerPanelScoreboard.color = Color(22,22,22,200)
    UnderPlayerPanelScoreboard.colorIsDead = Color(127,255,255,100)
    UnderPlayerPanelScoreboard.colorBackground = Color(33,33,33,100)
    
font = {}
    font.size = 15
    font.weight = 900
