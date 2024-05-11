local player = Var "Player" or GAMESTATE:GetMasterPlayerNumber()

local function Beat(self)
	local this = self:GetChildren()
	local playerstate = GAMESTATE:GetPlayerState( player )
	local songposition = playerstate:GetSongPosition() -- GAMESTATE:GetSongPosition()
	
	local beat = songposition:GetSongBeat() -- GAMESTATE:GetSongBeat()
	
	local part = beat%1
	part = clamp(part,0,0.5)
	local eff = scale(part,0,0.5,1,0)
	if (songposition:GetDelay() or false) and part == 0 then eff = 0 end
	if beat < 0 then
		eff = 0
	end
	this.Glow:diffusealpha(eff);
end

return Def.ActorFrame {
	-- COMMANDS --
	InitCommand=cmd(SetUpdateFunction,Beat);
	
	NOTESKIN:LoadActor(Var "Button", "Ready Receptor")..{
		Name="Base";
		Frames={
			{ Frame = 0 }
		};
	};
	NOTESKIN:LoadActor(Var "Button", "Ready Receptor")..{
		Name="Glow";
		Frames= {
			{ Frame = 1 }
		};
		InitCommand=cmd(blend,'BlendMode_Add');
	};
	NOTESKIN:LoadActor(Var "Button", "Ready Receptor")..{
		Name="Outline";
		Frames= {
			{ Frame = 2 }
		};
		InitCommand=cmd(zoom,1;diffusealpha,0;blend,'BlendMode_Add');
		PressCommand=cmd(stoptweening;zoom,1;linear,0.1;diffusealpha,1);
		LiftCommand=cmd(stoptweening;diffusealpha,1;zoom,1;linear,0.1;zoom,1.1;diffusealpha,0);
	};
}