-- Suicide version 1.0  |  by Misterff1


function SuicideStart(pos)
   ClientEffect.Play(AssetLocation.Game, { effect_id = 75, position = pos, angle = Angle() })
end

Network:Subscribe("SuicideStart", SuicideStart)