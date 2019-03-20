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
local combobox = ui.new_combobox
local worldToScreen = renderer.world_to_screen
local callback = client.set_event_callback

local stylebox = combobox("Lua", "A", "Style", "Circle", "Circle outline", "Box", "Box outline", "Triangle", "Inverted triangle", "Pentagon", "Diamond")

local heGrenadeCheckbox = checkbox("Lua", "A", "Grenade")
local heGrenadeColor = colorpicker("Lua", "A", "Grenade", 255, 255, 255, 255)
local heGrenadeSize = slider("Lua", "A", "Size", 0, 81, 9)
local heTextCheckbox = checkbox("Lua", "A", "Grenade text")
local heTextColor = colorpicker("Lua", "A", "Grenade Text", 255, 255, 255, 255)

local flashGrenadeCheckbox = checkbox("Lua", "A", "Flash")
local flashGrenadeColor = colorpicker("Lua", "A", "Flash", 255, 255, 255, 255)
local flashGrenadeSize = slider("Lua", "A", "Size", 0, 81, 9)
local flashTextCheckbox = checkbox("Lua", "A", "Flash text")
local flashTextColor = colorpicker("Lua", "A", "Flash text", 255, 255, 255, 255)

local function on_paintGrenade(ctx)
	local grenade = getAll("CBaseCSGrenadeProjectile")[1]
	local index = getProp(grenade, "m_nModelIndex")

	if getUi(stylebox) == "Circle" then
		if getUi(heGrenadeCheckbox, true) then
			visibility(heGrenadeSize, true)
			visibility(heTextCheckbox, true)
			visibility(heTextColor, true)
		else
			visibility(heGrenadeSize, false)
			visibility(heTextCheckbox, false)
			visibility(heTextColor, false)
		end

		if getUi(flashGrenadeCheckbox, true) then
			visibility(flashGrenadeSize, true)
			visibility(flashTextCheckbox, true)
			visibility(flashTextColor, true)
		else
			visibility(flashGrenadeSize, false)
			visibility(flashTextCheckbox, false)
			visibility(flashTextColor, false)
		end

		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heGrenadeColor)
					local hesize = getUi(heGrenadeSize)

					renderCircle(hewx, hewy, her, heg, heb, hea, hesize, 0, 1)
				end
			end
		end

		if getUi(flashGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(flashGrenadeColor)
					local fsize = getUi(flashGrenadeSize)

					renderCircle(fwx, fwy, fr, fg, fb, fa, fsize, 0, 1)
				end
			end
		end

	elseif getUi(stylebox) == "Circle outline" then
		if getUi(heGrenadeCheckbox, true) then
			visibility(heGrenadeSize, true)
		else
			visibility(heGrenadeSize, false)
		end

		if getUi(flashGrenadeCheckbox, true) then
			visibility(flashGrenadeSize, true)
		else
			visibility(flashGrenadeSize, false)
		end

		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heGrenadeColor)
					local hesize = getUi(heGrenadeSize)

					renderCircleOutline(hewx, hewy, her, heg, heb, hea, hesize, 0, 1, 1)
				end
			end
		end

		if getUi(flashGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(flashGrenadeColor)
					local fsize = getUi(flashGrenadeSize)

					renderCircleOutline(fwx, fwy, fr, fg, fb, fa, fsize, 0, 1, 1)
				end
			end
		end

	elseif getUi(stylebox) == "Box" then
		if getUi(heGrenadeCheckbox, true) then
			visibility(heGrenadeSize, true)
		else
			visibility(heGrenadeSize, false)
		end

		if getUi(flashGrenadeCheckbox, true) then
			visibility(flashGrenadeSize, true)
		else
			visibility(flashGrenadeSize, false)
		end

		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heGrenadeColor)
					local hesize = getUi(heGrenadeSize)

					renderRectangle(hewx - hesize / 2, hewy - hesize / 2, hesize, hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(flashGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(flashGrenadeColor)
					local fsize = getUi(flashGrenadeSize)

					renderRectangle(fwx - fsize / 2, fwy - fsize / 2, fsize, fsize, fr, fg, fb, fa)
				end
			end
		end
	elseif getUi(stylebox) == "Box outline" then
		if getUi(heGrenadeCheckbox, true) then
			visibility(heGrenadeSize, true)
		else
			visibility(heGrenadeSize, false)
		end

		if getUi(flashGrenadeCheckbox, true) then
			visibility(flashGrenadeSize, true)
		else
			visibility(flashGrenadeSize, false)
		end

		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heGrenadeColor)
					local hesize = getUi(heGrenadeSize)

					renderLine(hewx - hesize, hewy - hesize, hewx + hesize, hewy - hesize, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy - hesize, hewx - hesize, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx + hesize, hewy - hesize, hewx + hesize, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy + hesize, hewx + hesize, hewy + hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(flashGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(flashGrenadeColor)
					local fsize = getUi(flashGrenadeSize)

					renderLine(fwx - fsize, fwy - fsize, fwx + fsize, fwy - fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy - fsize, fwx - fsize, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx + fsize, fwy - fsize, fwx + fsize, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy + fsize, fwx + fsize, fwy + fsize, fr, fg, fb, fa)
				end
			end
		end

	elseif getUi(stylebox) == "Triangle" then
		if getUi(heGrenadeCheckbox, true) then
			visibility(heGrenadeSize, true)
		else
			visibility(heGrenadeSize, false)
		end

		if getUi(flashGrenadeCheckbox, true) then
			visibility(flashGrenadeSize, true)
		else
			visibility(flashGrenadeSize, false)
		end

		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heGrenadeColor)
					local hesize = getUi(heGrenadeSize)

					renderLine(hewx, hewy - hesize, hewx - hesize, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx, hewy - hesize, hewx + hesize, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy + hesize, hewx + hesize, hewy + hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(flashGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(flashGrenadeColor)
					local fsize = getUi(flashGrenadeSize)

					renderLine(fwx, fwy - fsize, fwx - fsize, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx, fwy - fsize, fwx + fsize, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy + fsize, fwx + fsize, fwy + fsize, fr, fg, fb, fa)
				end
			end
		end
	elseif getUi(stylebox) == "Inverted triangle" then
		if getUi(heGrenadeCheckbox, true) then
			visibility(heGrenadeSize, true)
		else
			visibility(heGrenadeSize, false)
		end

		if getUi(flashGrenadeCheckbox, true) then
			visibility(flashGrenadeSize, true)
		else
			visibility(flashGrenadeSize, false)
		end

		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heGrenadeColor)
					local hesize = getUi(heGrenadeSize)

					renderLine(hewx, hewy + hesize, hewx - hesize, hewy - hesize, her, heg, heb, hea)
					renderLine(hewx, hewy + hesize, hewx + hesize, hewy - hesize, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy - hesize, hewx + hesize, hewy - hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(flashGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(flashGrenadeColor)
					local fsize = getUi(flashGrenadeSize)

					renderLine(fwx, fwy + fsize, fwx - fsize, fwy - fsize, fr, fg, fb, fa)
					renderLine(fwx, fwy + fsize, fwx + fsize, fwy - fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy - fsize, fwx + fsize, fwy - fsize, fr, fg, fb, fa)
				end
			end
		end
	elseif getUi(stylebox) == "Pentagon" then
		if getUi(heGrenadeCheckbox, true) then
			visibility(heGrenadeSize, true)
		else
			visibility(heGrenadeSize, false)
		end

		if getUi(flashGrenadeCheckbox, true) then
			visibility(flashGrenadeSize, true)
		else
			visibility(flashGrenadeSize, false)
		end

		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heGrenadeColor)
					local hesize = getUi(heGrenadeSize)

					renderLine(hewx, hewy - hesize, hewx - hesize, hewy - 5 + hesize / 10, her, heg, heb, hea)
					renderLine(hewx, hewy - hesize, hewx + hesize, hewy - 5 + hesize / 10, her, heg, heb, hea)
					renderLine(hewx - hesize, hewy - 5 + hesize / 10, hewx - hesize / 2, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx + hesize, hewy - 5 + hesize / 10, hewx + hesize / 2, hewy + hesize, her, heg, heb, hea)
					renderLine(hewx - hesize / 2, hewy + hesize, hewx + hesize / 2, hewy + hesize, her, heg, heb, hea)
				end
			end
		end

		if getUi(flashGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(flashGrenadeColor)
					local fsize = getUi(flashGrenadeSize)

					renderLine(fwx, fwy - fsize, fwx - fsize, fwy - 5 + fsize / 10, fr, fg, fb, fa)
					renderLine(fwx, fwy - fsize, fwx + fsize, fwy - 5 + fsize / 10, fr, fg, fb, fa)
					renderLine(fwx - fsize, fwy - 5 + fsize / 10, fwx - fsize / 2, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx + fsize, fwy - 5 + fsize / 10, fwx + fsize / 2, fwy + fsize, fr, fg, fb, fa)
					renderLine(fwx - fsize / 2, fwy + fsize, fwx + fsize / 2, fwy + fsize, fr, fg, fb, fa)
				end
			end
		end
	elseif getUi(stylebox) == "Diamond" then
		if getUi(heGrenadeCheckbox, true) then
			visibility(heGrenadeSize, true)
		else
			visibility(heGrenadeSize, false)
		end

		if getUi(flashGrenadeCheckbox, true) then
			visibility(flashGrenadeSize, true)
		else
			visibility(flashGrenadeSize, false)
		end

		if getUi(heGrenadeCheckbox, true) and index == 323 then
			if grenade ~= nil then
				local hex, hey, hez = getProp(grenade, "m_vecOrigin")
				local hewx, hewy = worldToScreen(hex, hey, hez)

				if hewx ~= nil then
					local her, heg, heb, hea = getUi(heGrenadeColor)
					local hesize = getUi(heGrenadeSize)

					renderLine(hewx, hewy - hesize, hewx - hesize, hewy, her, heg, heb, hea)
					renderLine(hewx, hewy - hesize, hewx + hesize, hewy, her, heg, heb, hea)
					renderLine(hewx, hewy + hesize, hewx - hesize, hewy, her, heg, heb, hea)
					renderLine(hewx, hewy + hesize, hewx + hesize, hewy, her, heg, heb, hea)
				end
			end
		end


		if getUi(flashGrenadeCheckbox, true) and index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)

				if fwx ~= nil then
					local fr, fg, fb, fa = getUi(flashGrenadeColor)
					local fsize = getUi(flashGrenadeSize)

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

local molotovGrenadeCheckbox = checkbox("Lua", "A", "Molotov")
local molotovGrenadeColor = colorpicker("Lua", "A", "Molotov", 255, 255, 255, 255)
local molotovGrenadeSize = slider("Lua", "A", "Size", 0, 81, 9)
local molotovTextCheckbox = checkbox("Lua", "A", "Molotov text")
local molotovTextColor = colorpicker("Lua", "A", "Molotov text", 255, 255, 255, 255)

local function on_paintMolotov(ctx)
	if getUi(molotovGrenadeCheckbox, true) then
		visibility(molotovGrenadeSize, true)
		visibility(molotovTextCheckbox, true)
		visibility(molotovTextColor, true)

		local molotovGrenade = getAll("CMolotovProjectile")[1]

		if getUi(stylebox) == "Circle" then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(molotovGrenadeColor)
					local msize = getUi(molotovGrenadeSize)

					renderCircle(mwx, mwy, mr, mg, mb, ma, msize, 0, 1)
				end
			end
		elseif getUi(stylebox) == "Circle outline" then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(molotovGrenadeColor)
					local msize = getUi(molotovGrenadeSize)

					renderCircleOutline(mwx, mwy, mr, mg, mb, ma, msize, 0, 1, 1)
				end
			end
		elseif getUi(stylebox) == "Box" then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(molotovGrenadeColor)
					local msize = getUi(molotovGrenadeSize)

					renderRectangle(mwx - msize / 2, mwy - msize / 2, msize, msize, mr, mg, mb, ma)
				end
			end
		elseif getUi(stylebox) == "Box outline" then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(molotovGrenadeColor)
					local msize = getUi(molotovGrenadeSize)

					renderLine(mwx - msize, mwy - msize, mwx + msize, mwy - msize, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy - msize, mwx - msize, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx + msize, mwy - msize, mwx + msize, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy + msize, mwx + msize, mwy + msize, mr, mg, mb, ma)
				end
			end
		elseif getUi(stylebox) == "Triangle" then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(molotovGrenadeColor)
					local msize = getUi(molotovGrenadeSize)

					renderLine(mwx, mwy - msize, mwx - msize, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx, mwy - msize, mwx + msize, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy + msize, mwx + msize, mwy + msize, mr, mg, mb, ma)
				end
			end
		elseif getUi(stylebox) == "Inverted triangle" then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(molotovGrenadeColor)
					local msize = getUi(molotovGrenadeSize)

					renderLine(mwx, mwy + msize, mwx - msize, mwy - msize, mr, mg, mb, ma)
					renderLine(mwx, mwy + msize, mwx + msize, mwy - msize, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy - msize, mwx + msize, mwy - msize, mr, mg, mb, ma)
				end
			end
		elseif getUi(stylebox) == "Pentagon" then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(molotovGrenadeColor)
					local msize = getUi(molotovGrenadeSize)

					renderLine(mwx, mwy - msize, mwx - msize, mwy - 5 + msize / 10, mr, mg, mb, ma)
					renderLine(mwx, mwy - msize, mwx + msize, mwy - 5 + msize / 10, mr, mg, mb, ma)
					renderLine(mwx - msize, mwy - 5 + msize / 10, mwx - msize / 2, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx + msize, mwy - 5 + msize / 10, mwx + msize / 2, mwy + msize, mr, mg, mb, ma)
					renderLine(mwx - msize / 2, mwy + msize, mwx + msize / 2, mwy + msize, mr, mg, mb, ma)
				end
			end
		elseif getUi(stylebox) == "Diamond" then
			if molotovGrenade ~= nil then
				local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
				local mwx, mwy = worldToScreen(mx, my, mz)

				if mwx ~= nile then
					local mr, mg, mb, ma = getUi(molotovGrenadeColor)
					local msize = getUi(molotovGrenadeSize)

					renderLine(mwx, mwy - msize, mwx - msize, mwy, mr, mg, mb, ma)
					renderLine(mwx, mwy - msize, mwx + msize, mwy, mr, mg, mb, ma)
					renderLine(mwx, mwy + msize, mwx - msize, mwy, mr, mg, mb, ma)
					renderLine(mwx, mwy + msize, mwx + msize, mwy, mr, mg, mb, ma)
				end
			end
		end
	else
		visibility(molotovGrenadeSize, false)
		visibility(molotovTextCheckbox, false)
		visibility(molotovTextColor, false)
	end
end

callback('paint', on_paintMolotov)

local smokeGrenadeCheckbox = checkbox("Lua", "A", "Smoke")
local smokeGrenadeColor = colorpicker("Lua", "A", "Smoke", 255, 255, 255, 255)
local smokeGrenadeSize = slider("Lua", "A", "Size", 0, 81, 9)
local smokeTextCheckbox = checkbox("Lua", "A", "Smoke text")
local smokeTextColor = colorpicker("Lua", "A", "Smoke text", 255, 255, 255, 255)

local function on_paintSmoke(ctx)
	if getUi(smokeGrenadeCheckbox, true) then
		visibility(smokeGrenadeSize, true)
		visibility(smokeTextCheckbox, true)
		visibility(smokeTextColor, true)

		local smokeGrenade = getAll("CSmokeGrenadeProjectile")[1]
		local ticks_created = getProp(grenade, "m_nSmokeEffectTickBegin")

		if getUi(stylebox) == "Circle" then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(smokeGrenadeColor)
					local ssize = getUi(smokeGrenadeSize)

					renderCircle(swx, swy, sr, sg, sb, sa, ssize, 0, 1)
				elseif ticks_created ~= nil then
				end
			end
		elseif getUi(stylebox) == "Circle outline" then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(smokeGrenadeColor)
					local ssize = getUi(smokeGrenadeSize)

					renderCircleOutline(swx, swy, sr, sg, sb, sa, ssize, 0, 1, 1)
				elseif ticks_created ~= nil then
				end
			end
		elseif getUi(stylebox) == "Box" then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(smokeGrenadeColor)
					local ssize = getUi(smokeGrenadeSize)

					renderRectangle(swx - ssize / 2, swy - ssize / 2, ssize, ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		elseif getUi(stylebox) == "Box outline" then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(smokeGrenadeColor)
					local ssize = getUi(smokeGrenadeSize)

					renderLine(swx - ssize, swy - ssize, swx + ssize, swy - ssize, sr, sg, sb, sa)
					renderLine(swx - ssize, swy - ssize, swx - ssize, swy + ssize, sr, sg, sb, sa)
					renderLine(swx + ssize, swy - ssize, swx + ssize, swy + ssize, sr, sg, sb, sa)
					renderLine(swx - ssize, swy + ssize, swx + ssize, swy + ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		elseif getUi(stylebox) == "Triangle" then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(smokeGrenadeColor)
					local ssize = getUi(smokeGrenadeSize)

					renderLine(swx, swy - ssize, swx - ssize, swy + ssize, sr, sg, sb, sa)
					renderLine(swx, swy - ssize, swx + ssize, swy + ssize, sr, sg, sb, sa)
					renderLine(swx - ssize, swy + ssize, swx + ssize, swy + ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		elseif getUi(stylebox) == "Inverted triangle" then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(smokeGrenadeColor)
					local ssize = getUi(smokeGrenadeSize)

					renderLine(swx, swy + ssize, swx - ssize, swy - ssize, sr, sg, sb, sa)
					renderLine(swx, swy + ssize, swx + ssize, swy - ssize, sr, sg, sb, sa)
					renderLine(swx - ssize, swy - ssize, swx + ssize, swy - ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		elseif getUi(stylebox) == "Pentagon" then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(smokeGrenadeColor)
					local ssize = getUi(smokeGrenadeSize)

					renderLine(swx, swy - ssize, swx - ssize, swy - 5 + ssize / 10, sr, sg, sb, sa)
					renderLine(swx, swy - ssize, swx + ssize, swy - 5 + ssize / 10, sr, sg, sb, sa)
					renderLine(swx - ssize, swy - 5 + ssize / 10, swx - ssize / 2, swy + ssize, sr, sg, sb, sa)
					renderLine(swx + ssize, swy - 5 + ssize / 10, swx + ssize / 2, swy + ssize, sr, sg, sb, sa)
					renderLine(swx - ssize / 2, swy + ssize, swx + ssize / 2, swy + ssize, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		elseif getUi(stylebox) == "Diamond" then
			if smokeGrenade ~= nil then
				local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
				local swx, swy = worldToScreen(sx, sy, sz)

				if swx ~= nil then
					local sr, sg, sb, sa = getUi(smokeGrenadeColor)
					local ssize = getUi(smokeGrenadeSize)

					renderLine(swx, swy - ssize, swx - ssize, swy, sr, sg, sb, sa)
					renderLine(swx, swy - ssize, swx + ssize, swy, sr, sg, sb, sa)
					renderLine(swx, swy + ssize, swx - ssize, swy, sr, sg, sb, sa)
					renderLine(swx, swy + ssize, swx + ssize, swy, sr, sg, sb, sa)
				elseif ticks_created ~= nil then
				end
			end
		end
	else
		visibility(smokeGrenadeSize, false)
		visibility(smokeTextCheckbox, false)
		visibility(smokeTextColor, false)
	end
end

callback('paint', on_paintSmoke)

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

	if getUi(flashTextCheckbox, true) then
		local grenade = getAll("CBaseCSGrenadeProjectile")[1]
		local index = getProp(grenade, "m_nModelIndex")
		if index == 324 then
			if grenade ~= nil then
				local fx, fy, fz = getProp(grenade, "m_vecOrigin")
				local fwx, fwy = worldToScreen(fx, fy, fz)
				local r, g, b, a = getUi(flashTextColor)

				if fwx ~= nil then
					renderText(fwx, fwy, r, g, b, a, flags, 0, "Flash")
				end
			end
		end
	end

	if getUi(molotovTextCheckbox, true) then
		local molotovGrenade = getAll("CMolotovProjectile")[1]

		if molotovGrenade ~= nil then
			local mx, my, mz = getProp(molotovGrenade, "m_vecOrigin")
			local mwx, mwy = worldToScreen(mx, my, mz)
			local r, g, b, a = getUi(molotovTextColor)

			if mwx ~= nil then
				renderText(mwx, mwy, r, g, b, a, flags, 0, "Molotov")
			end
		end
	end
		
	if getUi(smokeTextCheckbox) then
		local smokeGrenade = getAll("CSmokeGrenadeProjectile")[1]

		if smokeGrenade ~= nil then
			local sx, sy, sz = getProp(smokeGrenade, "m_vecOrigin")
			local swx, swy = worldToScreen(sx, sy, sz)
			local r, g, b, a = getUi(smokeTextColor)

			if swx ~= nil then
				renderText(swx, swy, r, g, b, a, flags, 0, "Smoke")
			end
		end
	end
end

callback('paint', on_paintText)