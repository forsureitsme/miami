local flash = Def.ActorFrame {}

local spriteSize = 64;
local quarterSprite = spriteSize/4;
local halfSprite = spriteSize/2;
local corners = {
	{
		["addx"] = quarterSprite,
		["addy"] = quarterSprite,
	},
	{
		["addx"] = -quarterSprite,
		["addy"] = quarterSprite,
	},
	{
		["addx"] = -quarterSprite,
		["addy"] = -quarterSprite,
	},
	{
		["addx"] = quarterSprite,
		["addy"] = -quarterSprite,
	}
}

for i, corner in ipairs(corners) do
	flash[#flash + 1] = Def.Quad {
		InitCommand=function(self)
			self:blend("BlendMode_Add");
			self:diffusecolor(color("255,255,255,1"));
			self:zoomto(halfSprite,halfSprite);
			self:diffuseupperright(color("0,0,0,1"));
			self:diffuselowerright(color("0,0,0,1"));
			self:diffuselowerleft(color("0,0,0,1"));
			self:diffusealpha(.5);

			self:rotationz((i-1) * 90);
			self:addx(corner["addx"]);
			self:addy(corner["addy"]);
		end;
	};
	
end

flash = Def.ActorFrame {
	flash..{};
	flash..{
		InitCommand=cmd(rotationz,math.random(0,360);zoom,.85);
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
		GlowCommand=cmd(finishtweening;zoom,1;diffusealpha,1;linear,.2;diffusealpha,0;zoom,1.1);
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
			zoom,1;
			diffusealpha,1;
			linear,.2;
			zoom,.75;
			diffusealpha,0;
		);
	};
}