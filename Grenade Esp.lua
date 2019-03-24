local getUi = ui.get
local getAll = entity.get_all
local getProp = entity.get_prop
local renderText = renderer.text
local renderCircle = renderer.circle
local renderCircleOutline = renderer.circle_outline
local renderLine = renderer.line
local renderRectangle = renderer.rectangle
local visibility = ui.set_visible
local checkbox = ui.new_checkbox
local colorpicker = ui.new_color_picker
local slider = ui.new_slider
local multibox = ui.new_multiselect
local worldToScreen = renderer.world_to_screen
local callback = client.set_event_callback

local styleMultibox = multibox("Lua", "A", "Style", "Circle", "Circle outline", "Box", "Box outline", "Triangle", "Inverted triangle", "Pentagon", "Diamond")

local function contains(table, val)
	for l=1,#table do
		if table[l] == val then 
			return true
		end
	end

	return false
end

local heGrenadeCheckbox = checkbox("Lua", "A", "Grenade")
local heCircleSize = slider("Lua", "A", "Circle size", 0, 81, 9)
local heCircleColor = colorpicker("Lua", "A", "Circle size", 255, 255, 255, 255)
local heCircleOutlineSize = slider("Lua", "A", "Circle outline size", 0, 81, 9)
local heCircleOutlineColor = colorpicker("Lua", "A", "Circle outline size", 0, 81, 9)
local heBoxSize = slider("Lua", "A", "Box size", 0, 81, 9)
local heBoxColor = colorpicker("Lua", "A", "Box size", 0, 81, 9)
local heBoxOutlineSize = slider("Lua", "A", "Box outline size", 0, 81, 9)
local heBoxOutlineColor = colorpicker("Lua", "A", "Box outline size", 0, 81, 9)
local heTriangleSize = slider("Lua", "A", "Triangle size", 0, 81, 9)
local heTriangleColor = colorpicker("Lua", "A", "Triangle size", 0, 81, 9)
local heInvertedTriangleSize = slider("Lua", "A", "Inverted triangle size", 0, 81, 9)
local heInvertedTriangleColor = colorpicker("Lua", "A", "Inverted triangle size", 0, 81, 9)
local hePentagonSize = slider("Lua", "A", "Pentagon size", 0, 81, 9)
local hePentagonColor = colorpicker("Lua", "A", "Pentagon size", 0, 81, 9)
local heDiamondSize = slider("Lua", "A", "Diamond size", 0, 81, 9)
local heDiamondColor = colorpicker("Lua", "A", "Diamond size", 0, 81, 9)
local heTextCheckbox = checkbox("Lua", "A", "Grenade text")
local heTextColor = colorpicker("Lua", "A", "Grenade Text", 255, 255, 255, 255)

local fGrenadeCheckbox = checkbox("Lua", "A", "Flash")
local fCircleSize = slider("Lua", "A", "Cirlce size", 0, 81, 9)
local fCircleColor = colorpicker("Lua", "A", "Circle size", 255, 255, 255, 255)
local fCircleOutlineSize = slider("Lua", "A", "Circle outline size", 0, 81, 9)
local fCircleOutlineColor = colorpicker("Lua", "A", "Circle outline size", 255, 255, 255, 255)
local fBoxSize = slider("Lua", "A", "Box size", 0, 81, 9)
local fBoxColor = colorpicker("Lua", "A", "Box size", 255, 255, 255, 255)
local fBoxOutlineSize = slider("Lua", "A", "Box outline size", 0, 81, 9)
local fBoxOutlineColor = colorpicker("Lua", "A", "Box outline size", 255, 255, 255, 255)
local fTriangleSize = slider("Lua", "A", "Triangle size", 0, 81, 9)
local fTriangleColor = colorpicker("Lua", "A", "Triangle size", 255, 255, 255, 255)
local fInvertedTriangleSize = slider("Lua", "A", "Inverted triangle size", 0, 81, 9)
local fInvertedTriangleColor = colorpicker("Lua", "A", "Inverted triangle size", 255, 255, 255, 255)
local fPentagonSize = slider("Lua", "A", "Pentagon Size", 0, 81, 9)
local fPentagonColor = colorpicker("Lua", "A", "Pentagon size", 255, 255, 255, 255)
local fDiamondSize = slider("Lua", "A", "Diamond size", 0, 81, 9)
local fDiamondColor = colorpicker("Lua", "A", "Diamond size", 255, 255, 255, 255)
local fTextCheckbox = checkbox("Lua", "A", "Flash text")
local fTextColor = colorpicker("Lua", "A", "Flash text", 255, 255, 255, 255)

local function on_paintGrenade(ctx)
	local stylebox = getUi(styleMultibox)
	local grenade = getAll("CBaseCSGrenadeProjectile")[1]
	local index = getProp(grenade, "m_nModelIndex")

	if getUi(heGrenadeCheckbox, true) then
		if contains(stylebox, "Circle") then
			visibility(heCircleSize, true)
			visibility(heCircleColor, true)
		else
			visibility(heCircleSize, false)
			visibility(heCircleColor, false)
		end

		if contains(stylebox, "Circle outline") then
			visibility(heCircleOutlineSize, true)
			visibility(heCircleOutlineColor, true)
		else
			visibility(heCircleOutlineSize, false)
			visibility(heCircleOutlineColor, false)
		end

		if contains(stylebox, "Box") then
			visibility(heBoxSize, true)
			visibility(heBoxColor, true)
		else
			visibility(heBoxSize, false)
			visibility(heBoxColor, false)
		end

		if contains(stylebox, "Box outline") then
			visibility(heBoxOutlineSize, true)
			visibility(heBoxOutlineColor, true)
		else
			visibility(heBoxOutlineSize, false)
			visibility(heBoxOutlineColor, false)
		end

		if contains(stylebox, "Triangle") then
			visibility(heTriangleSize, true)
			visibility(heTriangleColor, true)
		else
			visibility(heTriangleSize, false)
			visibility(heTriangleColor, false)
		end

		if contains(stylebox, "Inverted triangle") then
			visibility(heInvertedTriangleSize, true)
			visibility(heInvertedTriangleColor, true)
		else
			visibility(heInvertedTriangleSize, false)
			visibility(heInvertedTriangleColor, false)
		end

		if contains(stylebox, "Pentagon") then
			visibility(hePentagonSize, true)
			visibility(hePentagonColor, true)
		else
			visibility(hePentagonSize, false)
			visibility(hePentagonColor, false)
		end

		if contains(stylebox, "Diamond") then
			visibility(heDiamondSize, true)
			visibility(heDiamondColor, true)
		else
			visibility(heDiamondSize, false)
			visibility(heDiamondColor, false)
		end
	else
		visibility(heCircleSize, false)
		visibility(heCircleColor, false)
		visibility(heCircleOutlineSize, false)
		visibility(heCircleOutlineColor, false)
		visibility(heBoxSize, false)
		visibility(heBoxColor, false)
		visibility(heBoxOutlineSize, false)
		visibility(heBoxOutlineColor, false)
		visibility(heTriangleSize, false)
		visibility(heTriangleColor, false)
		visibility(heInvertedTriangleSize, false)
		visibility(heInvertedTriangleColor, false)
		visibility(hePentagonSize, false)
		visibility(hePentagonColor, false)
		visibility(heDiamondSize, false)
		visibility(heDiamondColor, false)
	end

	if getUi(fGrenadeCheckbox, true) then
		if contains(stylebox, "Circle") then
			visibility(fCircleSize, true)
			visibility(fCircleColor, true)
		else
			visibility(fCircleSize, false)
			visibility(fCircleColor, false)
		end

		if contains(stylebox, "Circle outline") then
			visibility(fCircleOutlineSize, true)
			visibility(fCircleOutlineColor, true)
		else
			visibility(fCircleOutlineSize, false)
			visibility(fCircleOutlineColor, false)
		end

		if contains(stylebox, "Box") then
			visibility(fBoxSize, true)
			visibility(fBoxColor, true)
		else
			visibility(fBoxSize, false)
			visibility(fBoxColor, false)
		end

		if contains(stylebox, "Box outline") then
			visibility(fBoxOutlineSize, true)
			visibility(fBoxOutlineColor, true)
		else
			visibility(fBoxOutlineSize, false)
			visibility(fBoxOutlineColor, false)
		end

		if contains(stylebox, "Triangle") then
			visibility(fTriangleSize, true)
			visibility(fTriangleColor, true)
		else
			visibility(fTriangleSize, false)
			visibility(fTriangleColor, false)
		end

		if contains(stylebox, "Inverted triangle") then
			visibility(fInvertedTriangleSize, true)
			visibility(fInvertedTriangleColor, true)
		else
			visibility(fInvertedTriangleSize, false)
			visibility(fInvertedTriangleColor, false)
		end

		if contains(stylebox, "Pentagon") then
			visibility(fPentagonSize, true)
			visibility(fPentagonColor, true)
		else
			visibility(fPentagonSize, false)
			visibility(fPentagonColor, false)
		end

		if contains(stylebox, "Diamond") then
			visibility(fDiamondSize, true)
			visibility(fDiamondColor, true)
		else
			visibility(fDiamondSize, false)
			visibility(fDiamondColor, false)
		end
	else
		visibility(fCircleSize, false)
		visibility(fCircleColor, false)
		visibility(fCircleOutlineSize, false)
		visibility(fCircleOutlineColor, false)
		visibility(fBoxSize, false)
		visibility(fBoxColor, false)
		visibility(fBoxOutlineSize, false)
		visibility(fBoxOutlineColor, false)
		visibility(fTriangleSize, false)
		visibility(fTriangleColor, false)
		visibility(fInvertedTriangleSize, false)
		visibility(fInvertedTriangleColor, false)
		visibility(fPentagonSize, false)
		visibility(fPentagonColor, false)
		visibility(fDiamondSize, false)
		visibility(fDiamondColor, false)
	end

	if contains(stylebox, "Circle") then
		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heCircleColor)
					local hesize = getUi(heCircleSize)

					renderCircle(hewx, hewy, her, heg, heb, hea, hesize, 0, 1)
				end
			end
		end

		if getUi(fGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(fCircleColor)
					local fsize = getUi(fCircleSize)

					renderCircle(fwx, fwy, fr, fg, fb, fa, fsize, 0, 1)
				end
			end
		end
	end

	if contains(stylebox, "Circle outline") then
		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heCircleOutlineColor)
					local hesize = getUi(heCircleOutlineSize)

					renderCircleOutline(hewx, hewy, her, heg, heb, hea, hesize, 0, 1, 1)
				end
			end
		end

		if getUi(fGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(fCircleOutlineColor)
					local fsize = getUi(fCircleOutlineSize)

					renderCircleOutline(fwx, fwy, fr, fg, fb, fa, fsize, 0, 1, 1)
				end
			end
		end
	end

	if contains(stylebox, "Box") then
		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heBoxColor)
					local hesize = getUi(heBoxSize)

					renderRectangle(hewx - hesize / 2, hewy - hesize / 2, hesize, hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(fGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(fBoxColor)
					local fsize = getUi(fBoxSize)

					renderRectangle(fwx - fsize / 2, fwy - fsize / 2, fsize, fsize, fr, fg, fb, fa)
				end
			end
		end
	end

	if contains(stylebox, "Box outline") then
		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heBoxOutlineColor)
					local hesize = getUi(heBoxOutlineSize)

					renderLine(hewx - hesize, hewy - hesize, hewx + hesize, hewy - hesize, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy - hesize, hewx - hesize, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx + hesize, hewy - hesize, hewx + hesize, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy + hesize, hewx + hesize, hewy + hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(fGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(fBoxOutlineColor)
					local fsize = getUi(fBoxOutlineSize)

					renderLine(fwx - fsize, fwy - fsize, fwx + fsize, fwy - fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy - fsize, fwx - fsize, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx + fsize, fwy - fsize, fwx + fsize, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy + fsize, fwx + fsize, fwy + fsize, fr, fg, fb, fa)
				end
			end
		end
	end

	if contains(stylebox, "Triangle") then
		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heTriangleColor)
					local hesize = getUi(heTriangleSize)

					renderLine(hewx, hewy - hesize, hewx - hesize, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx, hewy - hesize, hewx + hesize, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy + hesize, hewx + hesize, hewy + hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(fGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(fTriangleColor)
					local fsize = getUi(fTriangleSize)

					renderLine(fwx, fwy - fsize, fwx - fsize, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx, fwy - fsize, fwx + fsize, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy + fsize, fwx + fsize, fwy + fsize, fr, fg, fb, fa)
				end
			end
		end
	end

	if contains(stylebox, "Inverted triangle") then
		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heInvertedTriangleColor)
					local hesize = getUi(heInvertedTriangleSize)

					renderLine(hewx, hewy + hesize, hewx - hesize, hewy - hesize, her, heg, heb, hea)
					renderLine(hewx, hewy + hesize, hewx + hesize, hewy - hesize, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy - hesize, hewx + hesize, hewy - hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(fGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(fInvertedTriangleColor)
					local fsize = getUi(fInvertedTriangleSize)

					renderLine(fwx, fwy + fsize, fwx - fsize, fwy - fsize, fr, fg, fb, fa)
					renderLine(fwx, fwy + fsize, fwx + fsize, fwy - fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy - fsize, fwx + fsize, fwy - fsize, fr, fg, fb, fa)
				end
			end
		end
	end

	if contains(stylebox, "Pentagon") then
		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(hePentagonColor)
					local hesize = getUi(hePentagonSize)

					renderLine(hewx, hewy - hesize, hewx - hesize, hewy - 5 + hesize / 10, her, heg, heb, hea)
					renderLine(hewx, hewy - hesize, hewx + hesize, hewy - 5 + hesize / 10, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy - 5 + hesize / 10, hewx - hesize / 2, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx + hesize, hewy - 5 + hesize / 10, hewx + hesize / 2, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx - hesize / 2, hewy + hesize, hewx + hesize / 2, hewy + hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(fGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(fPentagonColor)
					local fsize = getUi(fPentagonSize)

					renderLine(fwx, fwy - fsize, fwx - fsize, fwy - 5 + fsize / 10, fr, fg, fb, fa)
					renderLine(fwx, fwy - fsize, fwx + fsize, fwy - 5 + fsize / 10, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy - 5 + fsize / 10, fwx - fsize / 2, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx + fsize, fwy - 5 + fsize / 10, fwx + fsize / 2, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize / 2, fwy + fsize, fwx + fsize / 2, fwy + fsize, fr, fg, fb, fa)
				end
			end
		end
	end

	if contains(stylebox, "Diamond") then
		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heDiamondColor)
					local hesize = getUi(heDiamondSize)

					renderLine(hewx, hewy - hesize, hewx - hesize, hewy, her, heg, heb, hea)
					renderLine(hewx, hewy - hesize, hewx + hesize, hewy, her, heg, heb, hea)
					renderLine(hewx, hewy + hesize, hewx - hesize, hewy, her, heg, heb, hea)
					renderLine(hewx, hewy + hesize, hewx + hesize, hewy, her, heg, heb, hea)
				end
			end
		end


		if getUi(fGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(fDiamondColor)
					local fsize = getUi(fDiamondSize)

					renderLine(fwx, fwy - fsize, fwx - fsize, fwy, fr, fg, fb, fa)
					renderLine(fwx, fwy - fsize, fwx + fsize, fwy, fr, fg, fb, fa)
					renderLine(fwx, fwy + fsize, fwx - fsize, fwy, fr, fg, fb, fa)
					renderLine(fwx, fwy + fsize, fwx + fsize, fwy, fr, fg, fb, fa)
				end
			end
		end
	end
end

callback('paint', on_paintGrenade)
-----------------------------------------------------------------------------------------------------------------------

local mGrenadeCheckbox = checkbox("Lua", "A", "Molotov")
local mCircleSize = slider("Lua", "A", "Cirlce size", 0, 81, 9)
local mCircleColor = colorpicker("Lua", "A", "Circle size", 255, 255, 255, 255)
local mCircleOutlineSize = slider("Lua", "A", "Circle outline size", 0, 81, 9)
local mCircleOutlineColor = colorpicker("Lua", "A", "Circle outline size", 255, 255, 255, 255)
local mBoxSize = slider("Lua", "A", "Box size", 0, 81, 9)
local mBoxColor = colorpicker("Lua", "A", "Box size", 255, 255, 255, 255)
local mBoxOutlineSize = slider("Lua", "A", "Box outline size", 0, 81, 9)
local mBoxOutlineColor = colorpicker("Lua", "A", "Box outline size", 255, 255, 255, 255)
local mTriangleSize = slider("Lua", "A", "Triangle size", 0, 81, 9)
local mTriangleColor = colorpicker("Lua", "A", "Triangle size", 255, 255, 255, 255)
local mInvertedTriangleSize = slider("Lua", "A", "Inverted triangle size", 0, 81, 9)
local mInvertedTriangleColor = colorpicker("Lua", "A", "Inverted triangle size", 255, 255, 255, 255)
local mPentagonSize = slider("Lua", "A", "Pentagon Size", 0, 81, 9)
local mPentagonColor = colorpicker("Lua", "A", "Pentagon size", 255, 255, 255, 255)
local mDiamondSize = slider("Lua", "A", "Diamond size", 0, 81, 9)
local mDiamondColor = colorpicker("Lua", "A", "Diamond size", 255, 255, 255, 255)
local mTextCheckbox = checkbox("Lua", "A", "Molotov text")
local mTextColor = colorpicker("Lua", "A", "Molotov text", 255, 255, 255, 255)

local function on_paintMolotov(ctx)
	local stylebox = getUi(styleMultibox)
	local molotovGrenade = getAll("CMolotovProjectile")[1]

	if getUi(mGrenadeCheckbox, true) then
		if contains(stylebox, "Circle") then
			visibility(mCircleSize, true)
			visibility(mCircleColor, true)
		else
			visibility(mCircleSize, false)
			visibility(mCircleColor, false)
		end

		if contains(stylebox, "Circle outline") then
			visibility(mCircleOutlineSize, true)
			visibility(mCircleOutlineColor, true)
		else
			visibility(mCircleOutlineSize, false)
			visibility(mCircleOutlineColor, false)
		end

		if contains(stylebox, "Box") then
			visibility(mBoxSize, true)
			visibility(mBoxColor, true)
		else
			visibility(mBoxSize, false)
			visibility(mBoxColor, false)
		end

		if contains(stylebox, "Box outline") then
			visibility(mBoxOutlineSize, true)
			visibility(mBoxOutlineColor, true)
		else
			visibility(mBoxOutlineSize, false)
			visibility(mBoxOutlineColor, false)
		end

		if contains(stylebox, "Triangle") then
			visibility(mTriangleSize, true)
			visibility(mTriangleColor, true)
		else
			visibility(mTriangleSize, false)
			visibility(mTriangleColor, false)
		end

		if contains(stylebox, "Inverted triangle") then
			visibility(mInvertedTriangleSize, true)
			visibility(mInvertedTriangleColor, true)
		else
			visibility(mInvertedTriangleSize, false)
			visibility(mInvertedTriangleColor, false)
		end

		if contains(stylebox, "Pentagon") then
			visibility(mPentagonSize, true)
			visibility(mPentagonColor, true)
		else
			visibility(mPentagonSize, false)
			visibility(mPentagonColor, false)
		end

		if contains(stylebox, "Diamond") then
			visibility(mDiamondSize, true)
			visibility(mDiamondColor, true)
		else
			visibility(mDiamondSize, false)
			visibility(mDiamondColor, false)
		end
	else
		visibility(mCircleSize, false)
		visibility(mCircleColor, false)
		visibility(mCircleOutlineSize, false)
		visibility(mCircleOutlineColor, false)
		visibility(mBoxSize, false)
		visibility(mBoxColor, false)
		visibility(mBoxOutlineSize, false)
		visibility(mBoxOutlineColor, false)
		visibility(mTriangleSize, false)
		visibility(mTriangleColor, false)
		visibility(mInvertedTriangleSize, false)
		visibility(mInvertedTriangleColor, false)
		visibility(mPentagonSize, false)
		visibility(mPentagonColor, false)
		visibility(mDiamondSize, false)
		visibility(mDiamondColor, false)
	end

	if getUi(mGrenadeCheckbox, true) then
		if contains(stylebox, "Circle") then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(mCircleColor)
					local msize = getUi(mCircleSize)

					renderCircle(mwx, mwy, mr, mg, mb, ma, msize, 0, 1)
				end
			end
		end


		if contains(stylebox, "Circle outline") then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(mCircleOutlineColor)
					local msize = getUi(mCircleOutlineSize)

					renderCircleOutline(mwx, mwy, mr, mg, mb, ma, msize, 0, 1, 1)
				end
			end
		end

		if contains(stylebox, "Box") then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(mBoxColor)
					local msize = getUi(mBoxSize)

					renderRectangle(mwx - msize / 2, mwy - msize / 2, msize, msize, mr, mg, mb, ma)
				end
			end
		end

		if contains(stylebox, "Box outline") then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(mBoxOutlineColor)
					local msize = getUi(mBoxOutlineSize)

					renderLine(mwx - msize, mwy - msize, mwx + msize, mwy - msize, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy - msize, mwx - msize, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx + msize, mwy - msize, mwx + msize, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy + msize, mwx + msize, mwy + msize, mr, mg, mb, ma)
				end
			end
		end

		if contains(stylebox, "Traingle") then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(mTriangleColor)
					local msize = getUi(mTriangleSize)

					renderLine(mwx, mwy - msize, mwx - msize, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx, mwy - msize, mwx + msize, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy + msize, mwx + msize, mwy + msize, mr, mg, mb, ma)
				end
			end
		end

		if contains(stylebox, "Inverted triangle") then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(mInvertedTriangleColor)
					local msize = getUi(mInvertedTriangleSize)

					renderLine(mwx, mwy + msize, mwx - msize, mwy - msize, mr, mg, mb, ma)
					renderLine(mwx, mwy + msize, mwx + msize, mwy - msize, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy - msize, mwx + msize, mwy - msize, mr, mg, mb, ma)
				end
			end
		end

		if contains(stylebox, "Pentagon") then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(mPentagonColor)
					local msize = getUi(mPentagonSize)

					renderLine(mwx, mwy - msize, mwx - msize, mwy - 5 + msize / 10, mr, mg, mb, ma)
					renderLine(mwx, mwy - msize, mwx + msize, mwy - 5 + msize / 10, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy - 5 + msize / 10, mwx - msize / 2, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx + msize, mwy - 5 + msize / 10, mwx + msize / 2, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx - msize / 2, mwy + msize, mwx + msize / 2, mwy + msize, mr, mg, mb, ma)
				end
			end
		end

		if contains(stylebox, "Diamond") then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(mDiamondColor)
					local msize = getUi(mDiamondSize)

					renderLine(mwx, mwy - msize, mwx - msize, mwy, mr, mg, mb, ma)
					renderLine(mwx, mwy - msize, mwx + msize, mwy, mr, mg, mb, ma)
					renderLine(mwx, mwy + msize, mwx - msize, mwy, mr, mg, mb, ma)
					renderLine(mwx, mwy + msize, mwx + msize, mwy, mr, mg, mb, ma)
				end
			end
		end
	end
end

callback('paint', on_paintMolotov)
-----------------------------------------------------------------------------------------------------------------------

local sGrenadeCheckbox = checkbox("Lua", "A", "Smoke")
local sCircleSize = slider("Lua", "A", "Cirlce size", 0, 81, 9)
local sCircleColor = colorpicker("Lua", "A", "Circle size", 255, 255, 255, 255)
local sCircleOutlineSize = slider("Lua", "A", "Circle outline size", 0, 81, 9)
local sCircleOutlineColor = colorpicker("Lua", "A", "Circle outline size", 255, 255, 255, 255)
local sBoxSize = slider("Lua", "A", "Box size", 0, 81, 9)
local sBoxColor = colorpicker("Lua", "A", "Box size", 255, 255, 255, 255)
local sBoxOutlineSize = slider("Lua", "A", "Box outline size", 0, 81, 9)
local sBoxOutlineColor = colorpicker("Lua", "A", "Box outline size", 255, 255, 255, 255)
local sTriangleSize = slider("Lua", "A", "Triangle size", 0, 81, 9)
local sTriangleColor = colorpicker("Lua", "A", "Triangle size", 255, 255, 255, 255)
local sInvertedTriangleSize = slider("Lua", "A", "Inverted triangle size", 0, 81, 9)
local sInvertedTriangleColor = colorpicker("Lua", "A", "Inverted triangle size", 255, 255, 255, 255)
local sPentagonSize = slider("Lua", "A", "Pentagon Size", 0, 81, 9)
local sPentagonColor = colorpicker("Lua", "A", "Pentagon size", 255, 255, 255, 255)
local sDiamondSize = slider("Lua", "A", "Diamond size", 0, 81, 9)
local sDiamondColor = colorpicker("Lua", "A", "Diamond size", 255, 255, 255, 255)
local sTextCheckbox = checkbox("Lua", "A", "Smoke text")
local sTextColor = colorpicker("Lua", "A", "Smoke text", 255, 255, 255, 255)

local function on_paintSmoke(ctx)
	local stylebox = getUi(styleMultibox)
	local smokeGrenade = getAll("CSmokeGrenadeProjectile")[1]
	local ticks_created = getProp(grenade, "m_nSmokeEffectTickBegin")

	if getUi(sGrenadeCheckbox, true) then
		if contains(stylebox, "Circle") then
			visibility(sCircleSize, true)
			visibility(sCircleColor, true)
		else
			visibility(sCircleSize, false)
			visibility(sCircleColor, false)
		end

		if contains(stylebox, "Circle outline") then
			visibility(sCircleOutlineSize, true)
			visibility(sCircleOutlineColor, true)
		else
			visibility(sCircleOutlineSize, false)
			visibility(sCircleOutlineColor, false)
		end

		if contains(stylebox, "Box") then
			visibility(sBoxSize, true)
			visibility(sBoxColor, true)
		else
			visibility(sBoxSize, false)
			visibility(sBoxColor, false)
		end

		if contains(stylebox, "Box outline") then
			visibility(sBoxOutlineSize, true)
			visibility(sBoxOutlineColor, true)
		else
			visibility(sBoxOutlineSize, false)
			visibility(sBoxOutlineColor, false)
		end

		if contains(stylebox, "Triangle") then
			visibility(sTriangleSize, true)
			visibility(sTriangleColor, true)
		else
			visibility(sTriangleSize, false)
			visibility(sTriangleColor, false)
		end

		if contains(stylebox, "Inverted triangle") then
			visibility(sInvertedTriangleSize, true)
			visibility(sInvertedTriangleColor, true)
		else
			visibility(sInvertedTriangleSize, false)
			visibility(sInvertedTriangleColor, false)
		end

		if contains(stylebox, "Pentagon") then
			visibility(sPentagonSize, true)
			visibility(sPentagonColor, true)
		else
			visibility(sPentagonSize, false)
			visibility(sPentagonColor, false)
		end

		if contains(stylebox, "Diamond") then
			visibility(sDiamondSize, true)
			visibility(sDiamondColor, true)
		else
			visibility(sDiamondSize, false)
			visibility(sDiamondColor, false)
		end
	else
		visibility(sCircleSize, false)
		visibility(sCircleColor, false)
		visibility(sCircleOutlineSize, false)
		visibility(sCircleOutlineColor, false)
		visibility(sBoxSize, false)
		visibility(sBoxColor, false)
		visibility(sBoxOutlineSize, false)
		visibility(sBoxOutlineColor, false)
		visibility(sTriangleSize, false)
		visibility(sTriangleColor, false)
		visibility(sInvertedTriangleSize, false)
		visibility(sInvertedTriangleColor, false)
		visibility(sPentagonSize, false)
		visibility(sPentagonColor, false)
		visibility(sDiamondSize, false)
		visibility(sDiamondColor, false)
	end

	if getUi(sGrenadeCheckbox, true) then
		if contains(stylebox, "Circle") then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(sCircleColor)
					local ssize = getUi(sCircleSize)

					renderCircle(swx, swy, sr, sg, sb, sa, ssize, 0, 1)
				elseif ticks_created ~= nil then
				end
			end
		end

		if contains(stylebox, "Circle outline") then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(sCircleOutlineColor)
					local ssize = getUi(sCircleOutlineSize)

					renderCircleOutline(swx, swy, sr, sg, sb, sa, ssize, 0, 1, 1)
				elseif ticks_created ~= nil then
				end
			end
		end

		if contains(stylebox, "Box") then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(sBoxColor)
					local ssize = getUi(sBoxSize)

					renderRectangle(swx - ssize / 2, swy - ssize / 2, ssize, ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		end

		if contains(stylebox, "Box outline") then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(sBoxOutlineColor)
					local ssize = getUi(sBoxOutlineSize)

					renderLine(swx - ssize, swy - ssize, swx + ssize, swy - ssize, sr, sg, sb, sa)
					renderLine(swx - ssize, swy - ssize, swx - ssize, swy + ssize, sr, sg, sb, sa)
					renderLine(swx + ssize, swy - ssize, swx + ssize, swy + ssize, sr, sg, sb, sa)
					renderLine(swx - ssize, swy + ssize, swx + ssize, swy + ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		end

		if contains(stylebox, "Triangle") then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(sTriangleColor)
					local ssize = getUi(sTriangleSize)

					renderLine(swx, swy - ssize, swx - ssize, swy + ssize, sr, sg, sb, sa)
					renderLine(swx, swy - ssize, swx + ssize, swy + ssize, sr, sg, sb, sa)
					renderLine(swx - ssize, swy + ssize, swx + ssize, swy + ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		end

		if contains(stylebox, "Inverted triangle") then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(sInvertedTriangleColor)
					local ssize = getUi(sInvertedTriangleSize)

					renderLine(swx, swy + ssize, swx - ssize, swy - ssize, sr, sg, sb, sa)
					renderLine(swx, swy + ssize, swx + ssize, swy - ssize, sr, sg, sb, sa)
					renderLine(swx - ssize, swy - ssize, swx + ssize, swy - ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		end

		if contains(stylebox, "Pentagon") then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(sPentagonColor)
					local ssize = getUi(sPentagonSize)

					renderLine(swx, swy - ssize, swx - ssize, swy - 5 + ssize / 10, sr, sg, sb, sa)
					renderLine(swx, swy - ssize, swx + ssize, swy - 5 + ssize / 10, sr, sg, sb, sa)
					renderLine(swx - ssize, swy - 5 + ssize / 10, swx - ssize / 2, swy + ssize, sr, sg, sb, sa)
					renderLine(swx + ssize, swy - 5 + ssize / 10, swx + ssize / 2, swy + ssize, sr, sg, sb, sa)
					renderLine(swx - ssize / 2, swy + ssize, swx + ssize / 2, swy + ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		end

		if contains(stylebox, "Diamond") then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(sDiamondColor)
					local ssize = getUi(sDiamondSize)

					renderLine(swx, swy - ssize, swx - ssize, swy, sr, sg, sb, sa)
					renderLine(swx, swy - ssize, swx + ssize, swy, sr, sg, sb, sa)
					renderLine(swx, swy + ssize, swx - ssize, swy, sr, sg, sb, sa)
					renderLine(swx, swy + ssize, swx + ssize, swy, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		end
	end
end

callback('paint', on_paintSmoke)
-----------------------------------------------------------------------------------------------------------------------

local largeTextCheckbox = checkbox("Lua", "A", "Large text")
local smallTextCheckbox = checkbox("Lua", "A", "Small text")
local boldTextCheckbox = checkbox("Lua", "A", "Bold text")

local function on_paintText(ctx)
	local flags = "c"

	if getUi(largeTextCheckbox, true) then
		flags = "c+"
	end

	if getUi(smallTextCheckbox, true) then
		flags = "c-"
	end

	if getUi(boldTextCheckbox, true) then
		flags = "cb"
	end

	if getUi(heTextCheckbox, true) then
		local grenade = getAll("CBaseCSGrenadeProjectile")[1]
		local index = getProp(grenade, "m_nModelIndex")
	
		if index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)
				local r, g, b, a = getUi(heTextColor)
				
				if hewx ~= nil then
					renderText(hewx, hewy, r, g, b, a, flags, 0, "Grenade")
				end
			end
		end
	end

	if getUi(fTextCheckbox, true) then
		local grenade = getAll("CBaseCSGrenadeProjectile")[1]
		local index = getProp(grenade, "m_nModelIndex")
		if index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)
				local r, g, b, a = getUi(fTextColor)

				if fwx ~= nil then
					renderText(fwx, fwy, r, g, b, a, flags, 0, "Flash")
				end
			end
		end
	end

	if getUi(mTextCheckbox, true) then
		local molotovGrenade = getAll("CMolotovProjectile")[1]

		if molotovGrenade ~= nil then
			local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
			local mwx, mwy = worldToScreen(mx, my, mz)
			local r, g, b, a = getUi(mTextColor)

			if mwx ~= nil then
				renderText(mwx, mwy, r, g, b, a, flags, 0, "Molotov")
			end
		end
	end
		
	if getUi(sTextCheckbox) then
		local smokeGrenade = getAll("CSmokeGrenadeProjectile")[1]

		if smokeGrenade ~= nil then
			local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
			local swx, swy = worldToScreen(sx, sy, sz)
			local r, g, b, a = getUi(sTextColor)

			if swx ~= nil then
				renderText(swx, swy, r, g, b, a, flags, 0, "Smoke")
			end
		end
	end
end

callback('paint', on_paintText)
