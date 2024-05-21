local flash = Def.ActorFrame {}

local spriteSize = 64
local quarterSprite = spriteSize / 4
local halfSprite = spriteSize / 2
local quadrants = {
	{ ["x"] = 1,  ["y"] = 1 },
	{ ["x"] = -1, ["y"] = 1 },
	{ ["x"] = -1, ["y"] = -1 },
	{ ["x"] = 1,  ["y"] = -1 }
}
for i, quadrant in ipairs(quadrants) do
	flash[#flash + 1] = Def.Quad {
		InitCommand = function(self)
			self:blend("BlendMode_Add")
					:diffusecolor(color("255,255,255,1"))
					:zoomto(halfSprite, halfSprite)
					:diffuseupperright(color("0,0,0,1"))
					:diffuselowerright(color("0,0,0,1"))
					:diffuselowerleft(color("0,0,0,1"))
					:rotationz((i - 1) * 90)
					:addx(quadrant["x"] * quarterSprite)
					:addy(quadrant["y"] * quarterSprite)
		end
	}
end

local function glow(self)
	return self:finishtweening()
			:zoom(1)
			:diffusealpha(1)
			:linear(.2)
			:diffusealpha(0)
			:zoom(1.2)
end

return Def.ActorFrame {
	NOTESKIN:LoadActor(Var "Button", "Ready Receptor") .. {
		Frames = { { Frame = 0 } },
		InitCommand = function(self)
			self:blend("BlendMode_Add");
			glow(self)
		end,

		W1Command = glow,
		W2Command = glow,
		W3Command = glow,

		HitMineCommand = glow,
		HeldCommand = glow,
	},
	flash .. {
		InitCommand = glow,

		W1Command = glow,
		W2Command = glow,
		W3Command = glow,

		HitMineCommand = glow,
		HeldCommand = glow
	}
}
