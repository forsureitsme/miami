local flash = Def.ActorFrame {}

local spriteSize = 64;
local corners = {
	{
		["addx"] = spriteSize/4,
		["addy"] = spriteSize/4,
		["rotationz"] = 0,
	},
	{
		["addx"] = -spriteSize/4,
		["addy"] = spriteSize/4,
		["rotationz"] = 90,
	},
	{
		["addx"] = -spriteSize/4,
		["addy"] = -spriteSize/4,
		["rotationz"] = 180,
	},
	{
		["addx"] = spriteSize/4,
		["addy"] = -spriteSize/4,
		["rotationz"] = 270,
	}
}

for _, corner in ipairs(corners) do
	flash[#flash + 1] = Def.Quad {
		InitCommand=function(self)
			self:blend("BlendMode_Add");
			self:diffusecolor(color("255,255,255,1"));
			self:zoomto(spriteSize/2,spriteSize/2);
			self:diffuseupperright(color("0,0,0,1"));
			self:diffuselowerright(color("0,0,0,1"));
			self:diffuselowerleft(color("0,0,0,1"));

			self:rotationz(corner["rotationz"]);
			self:addx(corner["addx"]);
			self:addy(corner["addy"]);
		end;
	};
	
end

flash = Def.ActorFrame {
	flash..{};
	flash..{
		InitCommand=cmd(rotationz,45);
	};
};

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

	flash..{
		InitCommand=cmd(
			playcommand,"Glow";
		);
		W1Command=cmd(playcommand,"Glow");
		W2Command=cmd(playcommand,"Glow");
		W3Command=cmd(playcommand,"Glow");
		W4Command=cmd();
		W5Command=cmd();

		HitMineCommand=cmd(playcommand,"Glow");
		HeldCommand=cmd(playcommand,"Glow");
		GlowCommand=cmd(
			finishtweening;
			rotationz,math.random(0,360);
			zoom,1.25;
			diffusealpha,1;
			decelerate,.3;
			zoom,1;
			diffusealpha,.5;
			linear,.2;
			diffusealpha,0;
		);
	};
}