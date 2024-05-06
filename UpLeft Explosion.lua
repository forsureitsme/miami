return Def.ActorFrame {
	NOTESKIN:LoadActor(Var "Button", "Ready Receptor") .. {
		Frames= {
			{ Frame = 0 }
		};
		InitCommand=cmd(blend,"BlendMode_Add";playcommand,"Glow");
		W1Command=cmd(playcommand,"Glow");
		W2Command=cmd(playcommand,"Glow");
		W3Command=cmd(playcommand,"Glow");
		W4Command=cmd();
		W5Command=cmd();
		
		HitMineCommand=cmd(playcommand,"Glow");
		GlowCommand=cmd(finishtweening;zoom,1;diffusealpha,1;accelerate,0.4;diffusealpha,0;zoom,1.2);
		HeldCommand=cmd(playcommand,"Glow");
	};	

	LoadActor("_flash")..{
		InitCommand=cmd(blend,"BlendMode_Add";playcommand,"Glow");
		W1Command=cmd(playcommand,"Glow");
		W2Command=cmd(playcommand,"Glow");
		W3Command=cmd(playcommand,"Glow");
		W4Command=cmd();
		W5Command=cmd();

		HitMineCommand=cmd(playcommand,"Glow");
		HeldCommand=cmd(playcommand,"Glow");
		-- GlowCommand=cmd(finishtweening;setstate,0;diffusealpha,1;zoom,1;accelerate,0.2;diffusealpha,0;zoom,1.2);
		GlowCommand=cmd(
			finishtweening;
			rotationz,math.random(0,360);
			zoom,.9;
			diffusealpha,1;
			decelerate,.3;
			diffusealpha,0;
			zoom,.75;
		);
	};
}