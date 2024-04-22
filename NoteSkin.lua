local Noteskin = {}

Noteskin.Blanks = {
	["Hold Tail Active"] = true;
	["Roll Tail Inactive"] = true;
	["Outline Receptor"] = true;
}
Noteskin.PartsToRotate = {
	["Roll Head Active"] = false;
	["Roll Head Inactive"] = false;
}
Noteskin.ElementRedirs = {
	["Hold Head Active"] = "Tap Note";
	["Hold Head Inactive"] = "Tap Note";
	["Roll Head Active"] = "Roll Head Active";
	["Roll Head Inactive"] = "Roll Head Active";
	["Tap Fake"] = "Tap Note";
	["Tap Lift"] = "Tap Note";
	--
	["Hold Topcap Inactive"] = "Hold Topcap Active";
	["Hold Body Inactive"] = "Hold Body Active";
	["Hold Bottomcap Inactive"] = "Hold Bottomcap Active";
	["Hold Tail Inactive"] = "Hold Tail Active";
	--
	["Roll Topcap Active"] = "Hold Topcap Active";
	["Roll Body Active"] = "Hold Body Active";
	["Roll Bottomcap Active"] = "Hold Bottomcap Active";
	["Roll Tail Active"] = "Hold Tail Active";
	--
	["Roll Topcap Inactive"] = "Hold Topcap Active";
	["Roll Body Inactive"] = "Hold Body Active";
	["Roll Bottomcap Inactive"] = "Hold Bottomcap Active";
	["Roll Tail Inactive"] = "Hold Tail Active";
}

Noteskin.BaseRotX = {
	Center = 0;
	UpLeft = 0;
	UpRight = 0;
	DownLeft = 0;
	DownRight = 0;
}
Noteskin.BaseRotY = {
	Center = 0;
	UpLeft = 0;
	UpRight = 180;
	DownLeft = 0;
	DownRight = 180;
}
Noteskin.BaseRotZ = {
	Center = 0;
	UpLeft = 0;
	UpRight = 0;
	DownLeft = 0;
	DownRight = 0;
}

local function func()
	local sButton = Var "Button"
	local sElement = Var "Element"
	
	if Noteskin.Blanks[sElement] then
		local t = Def.Actor {};
		if Var "SpriteOnly" then
			t = LoadActor( "_blank" );
		end
		return t
	end
	
	local ElementToLoad = Noteskin.ElementRedirs[sElement]
	if not ElementToLoad then
		ElementToLoad = sElement
	end
	
	if ElementToLoad == "Explosion"
	or ElementToLoad == "Tap Mine"
	or ElementToLoad == "Receptor"
	then
		sButton = "UpLeft"
	end
	local path = NOTESKIN:GetPath(sButton,ElementToLoad)
	
	local t = LoadActor(path)
	
	local bRotate = Noteskin.PartsToRotate[ElementToLoad]
	--rotate by default
	if bRotate == nil then bRotate = true end
	if bRotate then
		t.BaseRotationX=Noteskin.BaseRotX[sButton]
		t.BaseRotationY=Noteskin.BaseRotY[sButton]
		t.BaseRotationZ=Noteskin.BaseRotZ[sButton]
	end
	
	return t
end

Noteskin.Load = func
Noteskin.CommonLoad = func

return Noteskin
