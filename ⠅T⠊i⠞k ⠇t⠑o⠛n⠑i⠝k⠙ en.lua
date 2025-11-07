function mainMenu()
gg.setVisible(false)
  local choice = gg.choice({
    "「 Teleport 」",
    "「 Transport 」",
    "「 Personage 」",
    "「 Weapon 」",
    "「 Overshoes 」",
    "「 Exit 」"
  }, nil, "Select a function:")

  if choice == 1 then
    teleport()
  elseif choice == 2 then
    transportMenu()
  elseif choice == 3 then
    PersMenu()
  elseif choice == 4 then
    Gun()
  elseif choice == 5 then
    Bots() 
  elseif choice == 6 then
    os.exit()
  end
end

function teleport()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔍 Find and save coordinates",
        "🚀 Teleport",
        "📍 Select Teleport Point",
        "💾 Saved Points",
        "✅ Teleport by mark",
        "🧾 Teleport by checkpoint",
        "🔙 Back"
    }, nil, "Choose an action")

    if choice == 1 then
        findAndSaveCoords()
    elseif choice == 2 then
        teleportManual()
    elseif choice == 3 then
        selectTeleportCategory()
    elseif choice == 4 then
        userSavedPointsMenu()
    elseif choice == 5 then
        searchAndReplaceCoords()
    elseif choice == 6 then
        TeleportPoMet()
    elseif choice == 7 then
        mainMenu()
    else
        gg.toast("Nothing selected")
        mainMenu()
    end
end

function transportMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        "🚗 Gm Car",
        "💥 Blow up the car",
        "🚀 Teleport with Vehicles",
        "🤸 Upheaval of transport(New)", 
        "🏎️ Increased speed(New)",
        "🔙 Back"
    }, nil, "Vehicle")

    if choice == 1 then
        toggleFreezeCarHP()
    elseif choice == 2 then
        toggleBax()
    elseif choice == 3 then
        teleportCar()
    elseif choice == 4 then
        flip()
    elseif choice == 5 then
        speedcars()
    elseif choice == 6 or choice == nil then
        mainMenu()
    end
end

function PersMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔬 Increasing hitboxes",
        "🏃 Quick Sprint",
        "👟 Infinite Sprint(New)",
        "📷 FOV",
        "🌧️ Rain",
        "〽️ Change nickname",
        "♥️ Gamemode",
        "🪖 Armour",
        "🚄 SpeedHack(New)",
        "🔙 Back"
    }, nil, "Personage")

    if choice == 1 then
        HitboxMenu()
    elseif choice == 2 then
        toggleSprint()
    elseif choice == 3 then
        Sprint()
    elseif choice == 4 then
        toggleFov()
    elseif choice == 5 then
        toggleRain()
    elseif choice == 6 then
        changeNik()
    elseif choice == 7 then
        Gm_pers()
    elseif choice == 8 then
        Gm_armor()
    elseif choice == 9 then
        SpeedHack()
    elseif choice == 9 or choice == nil then
        mainMenu()
    end
end

function Bots()
        local subMenu = gg.choice({
            "🚖 Taxi Bot",
            "🏎️ Win Racing", 
            "✈️ Bot Avia",
            "🛢️ Bot Oil Refinery", 
            "🔙 Back"
        }, nil, "Overshoes")

        if subMenu == 1 then
            botTaxi()
        elseif subMenu == 2 then
            cycleCheckpoints()
        elseif subMenu == 3 then
            botAir()
        elseif subMenu == 4 then
            bot_Neftezavod()
        elseif subMenu == 5 then
            mainMenu()
        end
    end

local recoilActive = false

function Gun()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔫 Give Up Weapons",
        "💥 Anti Spread",
        "🎯 Crosshair offset",
        "🔙 Back"
    }, nil, "Choose an action")

    if choice == 1 then
        Gun1()
    elseif choice == 2 then
        toggleRecoil()
    elseif choice == 3 then
        Smeh()
    elseif choice == 4 or choice == nil then
        mainMenu()
    else
        gg.toast("Nothing selected")
        mainMenu()
    end
end

local active = false
local savedAddr = nil
local savedValue = nil

function SpeedHack()
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)

    if not active then
        gg.searchNumber("9187343240761165228", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
        local results = gg.getResults(1)

        if #results == 0 then
            gg.alert("❌ No value found.")
            return
        end

        savedAddr = results[1].address

        savedValue = gg.getValues({{address = savedAddr, flags = gg.TYPE_QWORD}})[1].value

        local t = {}
        t[1] = {address = savedAddr, flags = gg.TYPE_FLOAT, value = 3}
        gg.setValues(t)

        active = true
        gg.toast("✅ Activated.")

    else
        if savedAddr ~= nil and savedValue ~= nil then
            local restore = {}
            restore[1] = {address = savedAddr, flags = gg.TYPE_QWORD, value = savedValue}
            gg.setValues(restore)
            gg.toast("❌ Disabled")
        end
        active = false
    end
end

function Sprint()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)

    gg.searchNumber("281474993487972", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local r = gg.getResults(30)
    local t = {}

    if #r == 0 then
        gg.alert("❌ No value found.")
    else
        for i, v in ipairs(r) do
            t[i] = {
                address = v.address - 0x160,
                flags = gg.TYPE_FLOAT,
                value = 450,
                freeze = true
            }
        end
        gg.setValues(t)
        gg.addListItems(t)
        gg.toast("✅ Activated")
    end
end

function speedcars()
    gg.clearResults()

    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4812096201845506048", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)

    local r = gg.getResults(100)
    if #r == 0 then
        gg.alert("❌ No value found")
        return
    end

    local t = {}
    for i, v in ipairs(r) do
        t[#t + 1] = {
            address = v.address + 0x64,
            flags = gg.TYPE_FLOAT,
            value = -0.00179999997,
            freeze = true
        }
    end

    gg.setValues(t)
    gg.addListItems(t)
    gg.toast("✅ Activated!")
end

function flip()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4812096201845506048", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(100)

    if #results == 0 then
        gg.alert("❌ No value found")
        return
    end

    local edits = {}
    for i, v in ipairs(results) do
        for j = 0, 2 do
            table.insert(edits, {
                address = v.address + 0x20 + j * 0x4,
                flags = gg.TYPE_FLOAT,
                value = -0.1
            })
        end
    end

    gg.setValues(edits)
    gg.toast("✅ Activated")
end

local modifiedValues = {}

function searchAndReplaceFloat(target, newValue)
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber(target, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(100)
    
    if #results == 0 then
        gg.toast("❌ No value found")
        return
    end

    for i, v in ipairs(results) do
        modifiedValues[v.address] = {
            address = v.address,
            flags = v.flags,
            value = target
        }
        v.value = newValue
    end

    gg.setValues(results)
    gg.toast("Successfully")
    gg.clearResults()
end

function restoreOriginalValues()
    if next(modifiedValues) == nil then
        return
    end

    local restoreList = {}
    for _, v in pairs(modifiedValues) do
        table.insert(restoreList, v)
    end

    gg.setValues(restoreList)
    gg.toast("Successfully")
    modifiedValues = {}
end

function Smeh()
    local choice = gg.choice({
        "⬅️ Shift to the left",
        "➡️ Offset to the right",
        "🧮 His displacement",
        "↩️ Rollback",
        "🔙 Back"
    }, nil, "Offset Menu")

    if choice == 1 then
        searchAndReplaceFloat("0.20000000298", -1)
    elseif choice == 2 then
        searchAndReplaceFloat("0.20000000298", 1)
    elseif choice == 3 then
        local input = gg.prompt({"Enter your offset value:"}, nil, {"number"})
        if input and input[1] then
            local num = tonumber(input[1])
            if num then
                searchAndReplaceFloat("0.20000000298", num)
            else
                gg.toast("❌ Not a number entered")
            end
        else
            gg.toast("❌ Entry Canceled")
        end
    elseif choice == 4 then
        restoreOriginalValues()
        gg.clearResults()
    end
end

function toggleRecoil()
    if not recoilActive then
        gunn()
        recoilActive = true
    else
        gunn2()
        recoilActive = false
    end
end

function gunn() 
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("100;900", gg.TYPE_FLOAT)
    gg.refineNumber("100", gg.TYPE_FLOAT)
    revert = gg.getResults(400)
    gg.editAll("95", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("🌀 Anti-Scatter Activated 🌀")
end 

function gunn2() 
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("95;900", gg.TYPE_FLOAT)
    gg.refineNumber("95", gg.TYPE_FLOAT)
    revert = gg.getResults(555)
    gg.editAll("100", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("🌀 Anti-Spread Deactivated 🌀")
end

function Gun1()
    gg.setVisible(false)
    local menu = gg.choice({
       "▶ Select: brass knuckles", 
       "▶ Select: club", 
       "▶ Select: baton", 
       "▶ Select: knife", 
       "▶ Select: bat", 
       "▶ Select: shovel", 
       "▶ Select: stick", 
       "▶ Select: katana", 
       "▶ Select: saw", 
       "▶ Select: dildo", 
       "▶ Select: dildo2", 
       "▶ Select: vibrator", 
       "▶ Select: vibrator2", 
       "▶ Select: flowers", 
       "▶ Select: cane", 
       "▶ Select: grenade", 
       "▶ Select: gas", 
       "▶ Select: molotov", 
       "▶ Select: Colt .45", 
       "▶ Select: taser", 
       "▶ Select: Deagle", 
       "▶ Select: shotgun", 
       "▶ Select: sawn-off", 
       "▶ Select: SPAS", 
       "▶ Select: Uzi", 
       "▶ Select: MP5", 
       "▶ Select: ACR 47", 
       "▶ Select: M4", 
       "▶ Select: Tec-9", 
       "▶ Select: rifle", 
       "▶ Select: sniper rifle", 
       "▶ Select: grenade launcher", 
       "▶ Select: rocket launcher", 
       "▶ Select: flamethrower", 
       "▶ Select: minigun", 
       "▶ Select: sticky bomb", 
       "▶ Select: detonator", 
       "▶ Select: spray", 
       "▶ Select: fire extinguisher", 
       "▶ Select: camera", 
       "▶ Select: thermal vision", 
       "▶ Select: thermal vision2", 
       "▶ Select: parachute", 
        "🔙 Back"
    }, nil, "Choose a weapon:")

    if menu == 1 then
        applyWeapon("WEAPON_BRASSKNUCKLE")
    elseif menu == 2 then
        applyWeapon("WEAPON_GOLFCLUB")
    elseif menu == 3 then
        applyWeapon("WEAPON_NITESTICK")
    elseif menu == 4 then
        applyWeapon("WEAPON_KNIFE")
    elseif menu == 5 then
        applyWeapon("WEAPON_BAT")
    elseif menu == 6 then
        applyWeapon("WEAPON_SHOVEL")
    elseif menu == 7 then
        applyWeapon("WEAPON_POOLSTICK")
    elseif menu == 8 then
        applyWeapon("WEAPON_KATANA")
    elseif menu == 9 then
        applyWeapon("WEAPON_CHAINSAW")
    elseif menu == 10 then
        applyWeapon("WEAPON_DILDO")
    elseif menu == 11 then
        applyWeapon("WEAPON_DILDO2")
    elseif menu == 12 then
        applyWeapon("WEAPON_VIBRATOR")
    elseif menu == 13 then
        applyWeapon("WEAPON_VIBRATOR2")
    elseif menu == 14 then
        applyWeapon("WEAPON_FLOWER")
    elseif menu == 15 then
        applyWeapon("WEAPON_CANE")
    elseif menu == 16 then
        applyWeapon("WEAPON_GRENADE")
    elseif menu == 17 then
        applyWeapon("WEAPON_TEARGAS")
    elseif menu == 18 then
        applyWeapon("WEAPON_MOLOTOV")
    elseif menu == 19 then
        applyWeapon("WEAPON_COLT45")
    elseif menu == 20 then
        applyWeapon("WEAPON_SILENCED")
    elseif menu == 21 then
        applyWeapon("WEAPON_DEAGLE")
    elseif menu == 22 then
        applyWeapon("WEAPON_SHOTGUN")
    elseif menu == 23 then
        applyWeapon("WEAPON_SAWEDOFF")
    elseif menu == 24 then
        applyWeapon("WEAPON_SHOTGSPA")
    elseif menu == 25 then
        applyWeapon("WEAPON_UZI")
    elseif menu == 26 then
        applyWeapon("WEAPON_MP5")
    elseif menu == 27 then
        applyWeapon("WEAPON_AK47")
    elseif menu == 28 then
        applyWeapon("WEAPON_M4")
    elseif menu == 29 then
        applyWeapon("WEAPON_TEC9")
    elseif menu == 30 then
        applyWeapon("WEAPON_RIFLE")
    elseif menu == 31 then
        applyWeapon("WEAPON_SNIPER")
    elseif menu == 32 then
        applyWeapon("WEAPON_ROCKETLAUNCHER")
    elseif menu == 33 then
        applyWeapon("WEAPON_HEATSEEKER")
    elseif menu == 34 then
        applyWeapon("WEAPON_FLAMETHROWER")
    elseif menu == 35 then
        applyWeapon("WEAPON_MINIGUN")
    elseif menu == 36 then
        applyWeapon("WEAPON_SATCHEL")
    elseif menu == 37 then
        applyWeapon("WEAPON_BOMB")
    elseif menu == 38 then
        applyWeapon("WEAPON_SPRAYCAN")
    elseif menu == 39 then
        applyWeapon("WEAPON_FIREEXTINGUISHER")
    elseif menu == 40 then
        applyWeapon("WEAPON_CAMERA")
    elseif menu == 41 then
        applyWeapon("TEPLOWIZER")
    elseif menu == 42 then
        applyWeapon("TEPLOWIZER2")
    elseif menu == 43 then
        applyWeapon("WEAPON_PARACHUTE")
    elseif menu == 44 then
        mainMenu()
    end
end

function applyWeapon(type)
    gg.setVisible(false)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("99999.99", gg.TYPE_FLOAT)
    local results = gg.getResults(1)

    if #results == 0 then
    end

    local baseAddr = results[1].address
    local offsets = {}

    if type == "WEAPON_BRASSKNUCKLE" then
        offsets = {
            {address = baseAddr + (7.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (6 * 8), flags = gg.TYPE_DWORD, value = 1}
        }
    elseif type == "WEAPON_GOLFCLUB" then
        offsets = {
            {address = baseAddr + (7.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (6 * 8), flags = gg.TYPE_DWORD, value = 2}
        }
    elseif type == "WEAPON_NITESTICK" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 3}
        }
    elseif type == "WEAPON_KNIFE" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 4}
        }
    elseif type == "WEAPON_BAT" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 5}
        }
    elseif type == "WEAPON_SHOVEL" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 6}
        }
    elseif type == "WEAPON_POOLSTICK" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 7}
        }
    elseif type == "WEAPON_KATANA" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 8}
        }
    elseif type == "WEAPON_CHAINSAW" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 9}
        }
    elseif type == "WEAPON_DILDO" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 10}
        }
    elseif type == "WEAPON_DILDO2" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 11}
        }
    elseif type == "WEAPON_VIBRATOR" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 12}
        }
    elseif type == "WEAPON_VIBRATOR2" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 13}
        }
    elseif type == "WEAPON_FLOWER" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 14}
        }
    elseif type == "WEAPON_CANE" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 15}
        }
    elseif type == "WEAPON_GRENADE" then
        offsets = {
            {address = baseAddr + (39.5 * 8), flags = gg.TYPE_DWORD, value = 5},
            {address = baseAddr + (38 * 8), flags = gg.TYPE_DWORD, value = 16}
        }
    elseif type == "WEAPON_TEARGAS" then
        offsets = {
            {address = baseAddr + (39.5 * 8), flags = gg.TYPE_DWORD, value = 5},
            {address = baseAddr + (38 * 8), flags = gg.TYPE_DWORD, value = 17}
        }
    elseif type == "WEAPON_MOLOTOV" then
        offsets = {
            {address = baseAddr + (39.5 * 8), flags = gg.TYPE_DWORD, value = 5},
            {address = baseAddr + (38 * 8), flags = gg.TYPE_DWORD, value = 18}
        }
    elseif type == "WEAPON_COLT45" then
        offsets = {
            {address = baseAddr + (15.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (14 * 8), flags = gg.TYPE_DWORD, value = 22}
        }
    elseif type == "WEAPON_SILENCED" then
        offsets = {
            {address = baseAddr + (15.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (14 * 8), flags = gg.TYPE_DWORD, value = 23}
        }
    elseif type == "WEAPON_DEAGLE" then
        offsets = {
            {address = baseAddr + (15.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (14 * 8), flags = gg.TYPE_DWORD, value = 24}
        }
    elseif type == "WEAPON_SHOTGUN" then
        offsets = {
            {address = baseAddr + (19.5 * 8), flags = gg.TYPE_DWORD, value = 26},
            {address = baseAddr + (18 * 8), flags = gg.TYPE_DWORD, value = 25}
        }
    elseif type == "WEAPON_SAWEDOFF" then
        offsets = {
            {address = baseAddr + (19.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (18 * 8), flags = gg.TYPE_DWORD, value = 26}
        }
    elseif type == "WEAPON_SHOTGSPA" then
        offsets = {
            {address = baseAddr + (19.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (18 * 8), flags = gg.TYPE_DWORD, value = 27}
        }
    elseif type == "WEAPON_UZI" then
        offsets = {
            {address = baseAddr + (23.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (22 * 8), flags = gg.TYPE_DWORD, value = 28}
        }
    elseif type == "WEAPON_MP5" then
        offsets = {
            {address = baseAddr + (23.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (22 * 8), flags = gg.TYPE_DWORD, value = 29}
        }
    elseif type == "WEAPON_AK47" then
        offsets = {
            {address = baseAddr + (27.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (26 * 8), flags = gg.TYPE_DWORD, value = 30}
        }
    elseif type == "WEAPON_M4" then
        offsets = {
            {address = baseAddr + (27.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (26 * 8), flags = gg.TYPE_DWORD, value = 31}
        }
    elseif type == "WEAPON_TEC9" then
        offsets = {
            {address = baseAddr + (23.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (22 * 8), flags = gg.TYPE_DWORD, value = 32}
        }
    elseif type == "WEAPON_RIFLE" then
        offsets = {
            {address = baseAddr + (31.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (30 * 8), flags = gg.TYPE_DWORD, value = 33}
        }
    elseif type == "WEAPON_SNIPER" then
        offsets = {
            {address = baseAddr + (31.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (30 * 8), flags = gg.TYPE_DWORD, value = 34}
        }
    elseif type == "WEAPON_ROCKETLAUNCHER" then
        offsets = {
            {address = baseAddr + (35.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (34 * 8), flags = gg.TYPE_DWORD, value = 35}
        }
    elseif type == "WEAPON_HEATSEEKER" then
        offsets = {
            {address = baseAddr + (35.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (34 * 8), flags = gg.TYPE_DWORD, value = 36}
        }
    elseif type == "WEAPON_FLAMETHROWER" then
        offsets = {
            {address = baseAddr + (35.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (34 * 8), flags = gg.TYPE_DWORD, value = 37}
        }
    elseif type == "WEAPON_MINIGUN" then
        offsets = {
            {address = baseAddr + (35.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (34 * 8), flags = gg.TYPE_DWORD, value = 38}
        }
    elseif type == "WEAPON_SATCHEL" then
        offsets = {
            {address = baseAddr + (39.5 * 8), flags = gg.TYPE_DWORD, value = 5},
            {address = baseAddr + (38 * 8), flags = gg.TYPE_DWORD, value = 39}
        }
    elseif type == "WEAPON_BOMB" then
        offsets = {
            {address = baseAddr + (54.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (53 * 8), flags = gg.TYPE_DWORD, value = 40}
        }
    elseif type == "WEAPON_SPRAYCAN" then
        offsets = {
            {address = baseAddr + (43.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (42 * 8), flags = gg.TYPE_DWORD, value = 41}
        }
    elseif type == "WEAPON_FIREEXTINGUISHER" then
        offsets = {
            {address = baseAddr + (54.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (53 * 8), flags = gg.TYPE_DWORD, value = 42}
        }
    elseif type == "WEAPON_CAMERA" then
        offsets = {
            {address = baseAddr + (43.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (42 * 8), flags = gg.TYPE_DWORD, value = 43}
        }
    elseif type == "TEPLOWIZER" then
        offsets = {
            {address = baseAddr + (51.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (50 * 8), flags = gg.TYPE_DWORD, value = 44}
        }
    elseif type == "TEPLOWIZER2" then
        offsets = {
            {address = baseAddr + (51.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (50 * 8), flags = gg.TYPE_DWORD, value = 45}
        }
    elseif type == "WEAPON_PARACHUTE" then
        offsets = {
            {address = baseAddr + (51.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (50 * 8), flags = gg.TYPE_DWORD, value = 46}
        }
    end
local weaponNames = {
    WEAPON_BRASSKNUCKLE = "Brass knuckles",
    WEAPON_GOLFCLUB = "Golf club",
    WEAPON_NITESTICK = "Police baton",
    WEAPON_KNIFE = "Knife",
    WEAPON_BAT = "Baseball bat",
    WEAPON_SHOVEL = "Spade",
    WEAPON_POOLSTICK = "Billiard cue",
    WEAPON_KATANA = "Katana",
    WEAPON_CHAINSAW = "Chainsaw",
    WEAPON_DILDO1 = "Purple",
    WEAPON_DILDO2 = "Grey",
    WEAPON_VIBE1 = "Pink Vibrator",
    WEAPON_VIBE2 = "White Vibrator",
    WEAPON_FLOWER = "Posy",
    WEAPON_CANE = "Cane",
    WEAPON_GRENADE = "Grenade",
    WEAPON_TEARGAS = "Tear gas",
    WEAPON_MOLOTOV = "Molotov cocktail",
    WEAPON_COLT45 = "Colt .45 pistol",
    WEAPON_SILENCED = "Pistol with silencer",
    WEAPON_DESERT_EAGLE = "Desert Eagle",
    WEAPON_SHOTGUN = "Edge",
    WEAPON_SAWEDOFF = "Double-barreled shotgun",
    WEAPON_SPAS12 = "SPAS-12",
    WEAPON_UZI = "Ultrasound",
    WEAPON_MP5 = "MP5",
    WEAPON_AK47 = "АК-47",
    WEAPON_M4 = "M4",
    WEAPON_TEC9 = "TEC-9",
    WEAPON_RIFLE = "Hunting rifle",
    WEAPON_SNIPER = "Sniper rifle",
    WEAPON_ROCKET_LAUNCHER = "RPG",
    WEAPON_HEATSEEKER = "Homing RPG",
    WEAPON_FLAMETHROWER = "Flamethrower",
    WEAPON_MINIGUN = "Minigun",
    WEAPON_SATCHEL = "Explosives",
    WEAPON_BOMB = "Bomb",
    WEAPON_SPRAYCAN = "Spray paint",
    WEAPON_FIREEXTINGUISHER = "Fire extinguisher",
    WEAPON_CAMERA = "Camera",
    WEAPON_PARACHUTE = "Parachute",
}
    if #offsets > 0 then
        gg.setValues(offsets)
        local name = weaponNames[type] or type
        gg.toast("Weapons issued: " .. name)
    else
    gg.setVisible(false)
        gg.toast("Failed to issue weapons.")
    end
end

function TeleportPoMet()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9,44502007e13", gg.TYPE_FLOAT)
    local results = gg.getResults(1000000)

    local filtered = {}
    for _, v in ipairs(results) do
        if string.sub(string.format("%X", v.address), -3) == "278" then
            table.insert(filtered, v)
            break  
        end
    end

    if #filtered == 0 then
        teleport()
        return
    end

    local firstFound = filtered[1]
    local baseAddr = firstFound.address

    local offset3 = baseAddr + (1 * 8)   -- X
    local offset1 = baseAddr + (1.5 * 8)  -- Z
    local offset2 = baseAddr + (2 * 8)  -- Y

    local coords = {
        {address = offset1, flags = gg.TYPE_FLOAT},  -- X
        {address = offset2, flags = gg.TYPE_FLOAT},  -- Y
        {address = offset3, flags = gg.TYPE_FLOAT},  -- Z
    }

    local values = gg.getValues(coords)
    for i, value in ipairs(values) do
        coords[i].value = value.value
    end

    gg.clearResults()

    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(1)

    if #results > 0 then
        local baseAddr = results[1].address
        local offsets = {
            {address = baseAddr + (15 * 8), flags = gg.TYPE_FLOAT},  -- X
            {address = baseAddr + (15.5 * 8), flags = gg.TYPE_FLOAT},  -- Y
            {address = baseAddr + (14.5 * 8), flags = gg.TYPE_FLOAT}   -- Z
        }

        for i = 1, #coords do
            offsets[i].value = coords[i].value
        end

        gg.setValues(offsets)
        gg.toast("Coordinates successfully replaced!")
        mainMenu()
    else
        gg.toast("No value found")
        mainMenu()
    end

    gg.clearResults()
end

function searchAndReplaceCoords()
    gg.toast("Waiting for 5 seconds... Put a mark and do not touch the map")
    gg.sleep(5000)
    gg.clearResults()

    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9.21942286e-41", gg.TYPE_FLOAT)
    local first = gg.getResults(10000)
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9.21956299e-41", gg.TYPE_FLOAT)
    local second = gg.getResults(10000)

    for _, v in ipairs(second) do
        table.insert(first, v)
    end

    local filtered = {}
    for _, v in ipairs(first) do
        if string.sub(string.format("%X", v.address), -3) == "80C" then
            table.insert(filtered, v)
        end
    end

    if #filtered == 0 then
        gg.toast("No coordinates found")
        teleport()
        return
    end

    local baseAddr = filtered[1].address

    local savedCoords = {
        {address = baseAddr - (1 * 8), flags = gg.TYPE_FLOAT},
        {address = baseAddr - (0.5 * 8), flags = gg.TYPE_FLOAT}
    }

    local values = gg.getValues(savedCoords)
    for i, v in ipairs(values) do
        savedCoords[i].value = v.value
    end

    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(1)

    if #results == 0 then
        gg.toast("Tag not found")
        mainMenu()
        return
    end

        local newBase = results[1].address
    local targetOffsets = {
        {address = newBase + (14.5 * 8), flags = gg.TYPE_FLOAT}, -- X
        {address = newBase + (15 * 8), flags = gg.TYPE_FLOAT}     -- Z
    }

    for i = 1, #targetOffsets do
        targetOffsets[i].value = savedCoords[i].value
    end

    table.insert(targetOffsets, {
        address = newBase + (15.5 * 8), -- Y
        flags = gg.TYPE_FLOAT,
        value = 25
    })

    gg.setValues(targetOffsets)
    gg.clearResults()
    gg.toast("Coordinates have been successfully transferred!")
    mainMenu()
end

local sprintActive = false
local fovActive = false
local rainActive = false

function stringToAscii(str)
    local ascii = {}
    for i = 1, #str do
        table.insert(ascii, string.byte(str, i))
    end
    return ascii
end

function searchAsciiSequence(asciiTable)
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    local searchStr = table.concat(asciiTable, ";") .. "::" .. #asciiTable
    gg.searchNumber(searchStr, gg.TYPE_BYTE)
    return gg.getResults(9999)
end

function replaceAscii(results, newAscii)
    local setList = {}
    for i = 1, #newAscii do
        table.insert(setList, {
            address = results[i].address,
            flags = gg.TYPE_BYTE,
            value = newAscii[i]
        })
    end
    gg.setValues(setList)
end

function changeTwinNick()
    local oldNick = gg.prompt({"Enter your current nickname:"}, nil, {"text"})
    if not oldNick or not oldNick[1] then
        gg.toast("❌ Nickname not entered")
        return
    end

    local oldAscii = stringToAscii(oldNick[1])
    local results = searchAsciiSequence(oldAscii)

    if #results == 0 then
        gg.toast("❌ Nickname not found")
        return
    end

    local newNick = gg.prompt({"Enter a new nickname (same length):"}, nil, {"text"})
    if not newNick or not newNick[1] then
        gg.toast("❌ A new nickname has not been introduced")
        return
    end

    if #newNick[1] ~= #oldNick[1] then
        gg.toast("❌ The new nickname must be the same length!")
        return
    end

    local newAscii = stringToAscii(newNick[1])
    replaceAscii(results, newAscii)

    gg.toast("✅ Nickname changed to: " .. newNick[1])
end

--------------------------------------------------------------

function changeChatNickSafe()
    local oldNick = gg.prompt({"Enter your current nickname (as in the chat):"}, nil, {"text"})
    if not oldNick or not oldNick[1] then
        gg.toast("❌ Nickname not entered")
        return
    end
    
    local newNick = gg.prompt({"Enter a new nickname:"}, nil, {"text"})
    if not newNick or not newNick[1] then
        gg.toast("❌ A new nickname has not been introduced")
        return
    end

    if #oldNick[1] ~= #newNick[1] then
        gg.toast("❌ The length of the nickname must match")
        return
    end

    gg.setRanges(gg.REGION_JAVA_HEAP)
    local byteArray = {}
    for i = 1, #oldNick[1] do
        byteArray[#byteArray + 1] = string.byte(oldNick[1], i) .. "B"
    end
    local searchString = table.concat(byteArray, ";") .. "::" .. #byteArray

    gg.clearResults()
    gg.searchNumber(searchString, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(500)

    if #results == 0 then
        gg.toast("❌ Nickname not found")
        return
    end

    local setList = {}
    for _, v in ipairs(results) do
        local currentBytes = {}
        for j = 1, #oldNick[1] do
            currentBytes[j] = gg.getValues({{address = v.address + (j - 1), flags = gg.TYPE_BYTE}})[1].value
        end

        local isOldNick = true
        for j = 1, #oldNick[1] do
            if currentBytes[j] ~= string.byte(oldNick[1], j) then
                isOldNick = false
                break
            end
        end

        local isAlreadyNew = true
        for j = 1, #newNick[1] do
            if currentBytes[j] ~= string.byte(newNick[1], j) then
                isAlreadyNew = false
                break
            end
        end

        if isOldNick and not isAlreadyNew then
            for j = 1, #newNick[1] do
                table.insert(setList, {
                    address = v.address + (j - 1),
                    flags = gg.TYPE_BYTE,
                    value = string.byte(newNick[1], j)
                })
            end
        end
    end

    if #setList / #newNick[1] > 50 then
        gg.toast("⚠️ Too many matches found, only the first 50 were replaced")
        setList = {table.unpack(setList, 1, 50 * #newNick[1])}
    end

    if #setList > 0 then
        gg.setValues(setList)
        gg.toast("✅ Nickname changed")
    else
        gg.toast("ℹ️ All found values have already been changed or do not match")
    end
end

function changeNik()
    gg.setVisible(false)
    local choice = gg.choice({
        "✏ Change another person's nickname",
        "📜 Change nickname from chat",
        "🔙 Back"
    }, nil, "Choose an action:")

    if choice == 1 then
        changeTwinNick()
    elseif choice == 2 then
        changeChatNickSafe()
    elseif choice == 3 then
        mainMemu()
    end
end

function toggleSprint()
    if not sprintActive then
        dv1()
        sprintActive = true
    else
        dv2()
        sprintActive = false
    end
end

function toggleFov()
    if not fovActive then
        fov1()
        fovActive = true
    else
        fov2()
        fovActive = false
    end
end

function toggleRain()
    if not rainActive then
        dojd1()
        rainActive = true
    else
        dojd2()
        rainActive = false
    end
end

function dv1()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4.0;0.69999998808;0.20000000298;5.0;10.0;1.0;0.5;0.30000001192:29", gg.TYPE_FLOAT)
    gg.refineNumber("0.7", gg.TYPE_FLOAT)
    revert = gg.getResults(100000)
    gg.editAll("-0.565651", gg.TYPE_FLOAT)
    gg.toast("❗Sprint activated❗")
    gg.clearResults()
end

function dv2()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4.0;-0.565651;0.20000000298;5.0;10.0;1.0;0.5;0.30000001192:29", gg.TYPE_FLOAT)
    gg.refineNumber("-0.565651", gg.TYPE_FLOAT)
    revert = gg.getResults(100000)
    gg.editAll("0.7", gg.TYPE_FLOAT)
    gg.toast("❗Sprint deactivated❗")
    gg.clearResults()
end

function fov1() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1116471296", gg.TYPE_DWORD)
    revert = gg.getResults(300)
    gg.editAll("1122469536", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("❗FOV Activated❗")
end 

function fov2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1122469536", gg.TYPE_DWORD)
    revert = gg.getResults(300)
    gg.editAll("1116471296", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("❗FOV Deactivated❗")
end 

function dojd1() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("0.00499999989", gg.TYPE_FLOAT)
    revert = gg.getResults(300)
    gg.editAll("-25.84625", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗Rain activated❗")
end 

function dojd2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("-25.84625", gg.TYPE_FLOAT)
    revert = gg.getResults(300)
    gg.editAll("0.00499999989", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗Rain deactivated❗")
end

function HitboxMenu()
    gg.clearResults()
    local targetValue = 1042536202
    local region = gg.REGION_C_ALLOC
    local step = 0 * 8

    gg.setRanges(region)
    gg.searchNumber(targetValue, gg.TYPE_DWORD)
    local results = gg.getResults(500)

    if #results == 0 then
        gg.toast("No values found")
    else
        local edits = {}
        for i, res in ipairs(results) do
            local finalAddr = res.address - step
            table.insert(edits, {
                address = finalAddr,
                flags = gg.TYPE_FLOAT,
                value = 5
            })
        end
        gg.setValues(edits)
    end

    gg.sleep(10000)
    HitboxMenu()
end


local baxActive = false

local QWORD_TO_FIND = "4568905975200743424"
local REGION = gg.REGION_C_ALLOC
local FLOAT_MIN, FLOAT_MAX = 1.000001, 150.0
local MAX_CANDIDATES = 5000000
local WINDOW_BYTES = 0x30D40

local function toastCountDown(sec, msg)
    for i = sec, 1, -1 do
        gg.toast(msg .. "  (" .. i .. "с)")
        gg.sleep(1000)
    end
end

local function copyTable(list)
    local r = {}
    for i = 1, #list do
        r[i] = {address = list[i].address, flags = list[i].flags, value = list[i].value}
    end
    return r
end

local function valuesMap(list)
    local m = {}
    for i = 1, #list do m[list[i].address] = list[i].value end
    return m
end

local function filterByDirection(prevList, nextList, wantUp)
    local prev = valuesMap(prevList)
    local out = {}
    for i = 1, #nextList do
        local a = nextList[i].address
        local v0 = prev[a]
        local v1 = nextList[i].value
        if v0 ~= nil then
            if wantUp and v1 > v0 then
                out[#out + 1] = {address = a, flags = gg.TYPE_FLOAT, value = v1}
            elseif (not wantUp) and v1 < v0 then
                out[#out + 1] = {address = a, flags = gg.TYPE_FLOAT, value = v1}
            end
        end
    end
    return out
end

local function dedupByAddress(list)
    local seen, out = {}, {}
    for i = 1, #list do
        local a = list[i].address
        if not seen[a] then
            seen[a] = true
            out[#out + 1] = list[i]
        end
    end
    return out
end

local function findCoords()

    gg.clearResults()
    gg.setRanges(REGION)
    gg.searchNumber(QWORD_TO_FIND, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local qres = gg.getResults(1000000)

    if #qres == 0 then
        gg.alert("❌ Not found")
        return nil
    end

    local candidates = {}
    for i = 1, #qres do
        local startA = qres[i].address
        local endA = startA + WINDOW_BYTES
        gg.searchNumber(FLOAT_MIN .. "~" .. FLOAT_MAX, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, startA, endA)
        local part = gg.getResults(1000000)
        for j = 1, #part do
            part[j].flags = gg.TYPE_FLOAT
            candidates[#candidates + 1] = part[j]
            if #candidates >= MAX_CANDIDATES then
                break
            end
        end
        if #candidates >= MAX_CANDIDATES then break end
    end

    candidates = dedupByAddress(candidates)
    if #candidates == 0 then
        gg.alert("❌ Not found")
        return nil
    end

    return candidates
end

local function twoChecks(candidates)
    local before1 = gg.getValues(copyTable(candidates))
    toastCountDown(5, "Drive up or down")
    local dir1 = gg.choice({"Drove up", "Drove down"}, nil, "Where were they moving?")
    if not dir1 then return nil end
    local wantUp1 = (dir1 == 1)
    local after1 = gg.getValues(copyTable(candidates))
    local filtered1 = filterByDirection(before1, after1, wantUp1)
    if #filtered1 == 0 then return nil end

    local before2 = gg.getValues(copyTable(filtered1))
    toastCountDown(5, "Repeat the movement")
    local dir2 = gg.choice({"Drove up", "Drove down"}, nil, "Where were they moving (again) ?")
    if not dir2 then return nil end
    local wantUp2 = (dir2 == 1)
    local after2 = gg.getValues(copyTable(filtered1))
    local filtered2 = filterByDirection(before2, after2, wantUp2)
    if #filtered2 == 0 then return nil end

    return filtered2
end

local function processValues(list)
    local index = 1
    while index <= #list do
        local batch = {}
        for i = index, math.min(index + 9, #list) do
            batch[#batch + 1] = list[i]
        end

        for i, item in ipairs(batch) do
            item.value = item.value + 10
            gg.setValues({item})
            gg.toast("Option: #" .. i .. " из " .. #batch)
            gg.sleep(2000)
        end

        local menu = {}
        for i = 1, #batch do
            menu[#menu + 1] = "Select an option #" .. i
        end
        menu[#menu + 1] = "Following"

        local choice = gg.choice(menu, nil, "Select an option or 'Next'")
        if not choice then return end

        if choice <= #batch then
            local sel = batch[choice]
            local toSave = {}
            toSave[1] = sel
            toSave[2] = {address = sel.address - 0x4, flags = gg.TYPE_FLOAT}
            toSave[3] = {address = sel.address - 0x8, flags = gg.TYPE_FLOAT}
            toSave = gg.getValues(toSave)
            
            if toSave[1] then toSave[1].name = "Saved_Coord_X" end
            if toSave[2] then toSave[2].name = "Saved_Coord_Y" end
            if toSave[3] then toSave[3].name = "Saved_Coord_Z" end
            gg.addListItems(toSave)
            return
        else
            index = index + 10
        end
    end
    gg.alert("Coordinates ended ❌")
end

local function teleportToCheckpointCar()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Saved_Coord_X" then savedX = v end
        if v.name == "Saved_Coord_Y" then savedY = v end
        if v.name == "Saved_Coord_Z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        gg.alert("❌ Save the coordinates first.")
        return
    end

    savedX.value = 0
    savedY.value = 30
    savedZ.value = -1370
    gg.setValues({savedX, savedY, savedZ})
    gg.toast("➡ Teleport to the point (0, 30, -1370)")
    gg.sleep(5000)

    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9,44502007e13", gg.TYPE_FLOAT)
    local results = gg.getResults(1000000)

    local filtered = {}
    for _, v in ipairs(results) do
        if string.sub(string.format("%X", v.address), -3) == "278" then
            table.insert(filtered, v)
            break
        end
    end

    if #filtered == 0 then
        gg.alert("❌ Checkpoint not found")
        return
    end

    local firstFound = filtered[1]
    local baseAddr = firstFound.address

    local offset3 = baseAddr + (1 * 8)   -- X
    local offset1 = baseAddr + (2 * 8) -- Z
    local offset2 = baseAddr + (1.5* 8)   -- Y

    local coords = {
        {address = offset1, flags = gg.TYPE_FLOAT},  -- X
        {address = offset2, flags = gg.TYPE_FLOAT},  -- Y
        {address = offset3, flags = gg.TYPE_FLOAT},  -- Z
    }

    local values = gg.getValues(coords)
    for i, value in ipairs(values) do
        coords[i].value = value.value
    end

    savedX.value = coords[1].value
    savedY.value = coords[2].value
    savedZ.value = coords[3].value
    gg.setValues({savedX, savedY, savedZ})
    gg.toast("✅ Teleport to the checkpoint completed!")
    gg.clearResults()
end

function teleportToMarkerCar()
    gg.toast("Waiting for 5 seconds... Put a mark and don't touch the map")
    gg.sleep(5000)
    gg.clearResults()

    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9.21942286e-41", gg.TYPE_FLOAT)
    local first = gg.getResults(10000)

    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9.21956299e-41", gg.TYPE_FLOAT)
    local second = gg.getResults(10000)

    for _, v in ipairs(second) do
        table.insert(first, v)
    end

    local filtered = {}
    for _, v in ipairs(first) do
        if string.sub(string.format("%X", v.address), -3) == "80C" then
            table.insert(filtered, v)
        end
    end

    if #filtered == 0 then
        gg.toast("❌ Tag not found")
        return
    end

    local baseAddr = filtered[1].address
    local savedCoords = {
        {address = baseAddr - (1 * 8), flags = gg.TYPE_FLOAT},   -- X
        {address = baseAddr - (0.5 * 8), flags = gg.TYPE_FLOAT}  -- Z
    }

    local values = gg.getValues(savedCoords)
    for i, v in ipairs(values) do
        savedCoords[i].value = v.value
    end

    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for _, v in ipairs(savedList) do
        if v.name == "Saved_Coord_X" then savedX = v end
        if v.name == "Saved_Coord_Y" then savedY = v end
        if v.name == "Saved_Coord_Z" then savedZ = v end
    end

    if not (savedX and savedY and savedZ) then
        gg.alert("❌ Save the coordinates first")
        return
    end

    -- 1. телепорт на фикс (0,30,-1370)
    savedX.value = 0
    savedY.value = 30
    savedZ.value = -1370
    gg.setValues({savedX, savedY, savedZ})
    gg.toast("➡ Teleport to the point (0,30,-1370)")
    gg.sleep(1000)

    -- 2. телепорт по координатам метки
    savedX.value = savedCoords[1].value
    savedZ.value = savedCoords[2].value
    savedY.value = 55
    gg.setValues({savedX, savedY, savedZ})
    gg.toast("✅ Teleport to the marker completed!")
end

  function botTaxi()
    gg.toast("🚖 Taxi Bot Launched!")
    while true do
        -- 1 телепорт
        teleportToCheckpointCar()

        -- Пауза 2 сек
        gg.sleep(2000)

        -- 2 телепорта подряд
        teleportToCheckpointCar()

        -- Пауза 10 сек
        gg.sleep(10000)

        -- 1 телепорт
        teleportToCheckpointCar()

        -- Пауза 2 сек
        gg.sleep(2000)

        -- 2 телепорта подряд
        teleportToCheckpointCar()

        -- 🔴 Выход из цикла при открытии GG
        if gg.isVisible(true) then
            gg.setVisible(false)
            gg.toast("⛔ Taxi bot stopped")
            break
        end
    end
end

function cycleCheckpoints()
    toggleFreezeCarHP() 
    local cands = findCoords()
        if cands then
            local filtered = twoChecks(cands)
            if filtered then
                processValues(filtered)
            end
        end
    gg.toast("Wait 10 seconds")
    gg.sleep(10000)
    
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Saved_Coord_X" then savedX = v end
        if v.name == "Saved_Coord_Y" then savedY = v end
        if v.name == "Saved_Coord_Z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        gg.alert("❌ Save the coordinates first.")
        return
    end

    local checkpointAddr = nil
    local lastX, lastY, lastZ = nil, nil, nil
    local unchangedCount = 0

    while true do
        gg.clearResults()

        -- первый поиск чекпоинта
        if checkpointAddr == nil then
            gg.setRanges(gg.REGION_OTHER)
            gg.searchNumber("9,44502007e13", gg.TYPE_FLOAT)
            local results = gg.getResults(1000000)

            local filtered = {}
            for _, v in ipairs(results) do
                if string.sub(string.format("%X", v.address), -3) == "278" then
                    table.insert(filtered, v)
                    break
                end
            end

            if #filtered == 0 then
                gg.alert("❌ Checkpoint not found")
                return
            end

            checkpointAddr = filtered[1].address
            gg.toast("✅ Checkpoint found!")
        end

        -- читаем координаты чекпоинта
        local offset3 = checkpointAddr + (1 * 8)   -- X
        local offset1 = checkpointAddr + (2 * 8)   -- Z
        local offset2 = checkpointAddr + (1.5 * 8) -- Y

        local coords = {
            {address = offset1, flags = gg.TYPE_FLOAT}, -- X
            {address = offset2, flags = gg.TYPE_FLOAT}, -- Y
            {address = offset3, flags = gg.TYPE_FLOAT}, -- Z
        }

        local values = gg.getValues(coords)

        -- проверка: изменились ли координаты
        if lastX == values[1].value and lastY == values[2].value and lastZ == values[3].value then
            unchangedCount = unchangedCount + 1
        else
            unchangedCount = 0
        end

        -- ⬇ сначала телепорт в фиксированную точку
        savedX.value = 0
        savedY.value = 30
        savedZ.value = -1370
        gg.setValues({savedX, savedY, savedZ})
        gg.toast("➡ Teleport to the point (0, 30, -1370)")
        gg.sleep(1500)

        -- ⬇ теперь телепорт на чекпоинт
        savedX.value = values[1].value
        savedY.value = values[2].value
        savedZ.value = values[3].value
        gg.setValues({savedX, savedY, savedZ})

        gg.toast("🔄 Moving to Checkpoint: X:"..values[1].value.." Y:"..values[2].value.." Z:"..values[3].value)

        -- если координаты не менялись → выходим
        if unchangedCount >= 3 then
            gg.toast("✅ The coordinates have stopped being updated, the script has been completed")
            break
        end

        -- сохраняем текущее как последние
        lastX, lastY, lastZ = values[1].value, values[2].value, values[3].value

        gg.sleep(1000) -- задержка 2 сек
    end
end

function botAir()
    toggleFreezeCarHP() 
    gg.sleep(1500)
    local cands = findCoords()
        if cands then
            local filtered = twoChecks(cands)
            if filtered then
                processValues(filtered)
            end
        end
    gg.toast("Wait 10 seconds")
    gg.sleep(10000)
    
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Saved_Coord_X" then savedX = v end
        if v.name == "Saved_Coord_Y" then savedY = v end
        if v.name == "Saved_Coord_Z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        gg.alert("❌ Save the coordinates first.")
        return
    end

    local checkpointAddr = nil
    local lastX, lastY, lastZ = nil, nil, nil
    local unchangedCount = 0

    while true do
        gg.clearResults()

        -- первый поиск чекпоинта
        if checkpointAddr == nil then
            gg.setRanges(gg.REGION_OTHER)
            gg.searchNumber("3,68946096e11", gg.TYPE_FLOAT)
            local results = gg.getResults(1000000)

            local filtered = {}
            for _, v in ipairs(results) do
                if string.sub(string.format("%X", v.address), -3) == "278" then
                    table.insert(filtered, v)
                    break
                end
            end

            if #filtered == 0 then
                gg.alert("❌ Checkpoint not found")
                return
            end

            checkpointAddr = filtered[1].address
            gg.toast("✅ Checkpoint found!")
        end

        -- читаем координаты чекпоинта
        local offset3 = checkpointAddr + (1 * 8)   -- X
        local offset1 = checkpointAddr + (2 * 8)   -- Z
        local offset2 = checkpointAddr + (1.5 * 8) -- Y

        local coords = {
            {address = offset1, flags = gg.TYPE_FLOAT}, -- X
            {address = offset2, flags = gg.TYPE_FLOAT}, -- Y
            {address = offset3, flags = gg.TYPE_FLOAT}, -- Z
        }

        local values = gg.getValues(coords)

        -- проверка: изменились ли координаты
        if lastX == values[1].value and lastY == values[2].value and lastZ == values[3].value then
            unchangedCount = unchangedCount + 1
        else
            unchangedCount = 0
        end

        -- ⬇ теперь телепорт на чекпоинт
        savedX.value = values[1].value
        savedY.value = values[2].value
        savedZ.value = values[3].value
        gg.setValues({savedX, savedY, savedZ})

        gg.toast("🔄 Moving to Checkpoint: X:"..values[1].value.." Y:"..values[2].value.." Z:"..values[3].value)

        -- если координаты не менялись → выходим
        if unchangedCount >= 3 then
            gg.toast("✅ Checkpoints are over")
            break
        end

        -- сохраняем текущее как последние
        lastX, lastY, lastZ = values[1].value, values[2].value, values[3].value

        gg.sleep(1000) -- задержка 2 сек
    end
end

local FLOAT = gg.TYPE_FLOAT

-- Получение первых 3 элементов из списка GameGuardian
local function getFirst3Coords()
    local list = gg.getListItems()
    if #list < 3 then
        -- Попытка найти и сохранить координаты
        findAndSaveCoords()
        list = gg.getListItems()
        if #list < 3 then
            gg.toast("Error: coordinates not found!")
            return nil
        end
    end
    return {list[1], list[2], list[3]}
end

-- Телепорт
local function teleport(tx, ty, tz)
    if not (tx and ty and tz) then
        return
    end

    local saved = getFirst3Coords()
    if not saved then return end

    -- Проверяем адреса
    if not (saved[1].address and saved[2].address and saved[3].address) then
        gg.toast("Error: nil coordinates addresses")
        return
    end

    gg.setValues({
        {address = saved[1].address, flags = FLOAT, value = tx},
        {address = saved[2].address, flags = FLOAT, value = ty},
        {address = saved[3].address, flags = FLOAT, value = tz}
    })
end
local sequence = {
    {x = -806.40246582031, y = 782.3818359375, z = 13.10230064392},
    {x = -806.40246582031, y = 782.3818359375, z = 0.0},
    {x = -806.24920654297, y = 790.70220947266, z = 13.10230064392},
    {x = -806.24920654297, y = 790.70220947266, z = 0.0}
}

-- Основной бот
function bot_Neftezavod()
    teleport(sequence[1].x, sequence[1].y, sequence[1].z)
    gg.sleep(500)
    teleport(sequence[2].x, sequence[2].y, sequence[2].z)
    gg.sleep(500)
    gg.toast("Wait 2.5 seconds...")
    gg.sleep(2500)
    teleport(sequence[3].x, sequence[3].y, sequence[3].z)
    gg.sleep(500)
    teleport(sequence[4].x, sequence[4].y, sequence[4].z)
    gg.sleep(500)
    bot_Neftezavod()
end

function saveCurrentPoint()
    local values = gg.getListItems()
    if #values < 3 then
        gg.toast("First, find the coordinates")
        return teleport()
    end

    local input = gg.prompt({"Point Name:"}, nil, {"text"})
    if input and input[1] ~= "" then
        savedPoints[input[1]] = {
            x = values[1].value,
            y = values[2].value,
            z = values[3].value
        }
        savePointsToFile()
        gg.toast("The point is saved!")
    else
        gg.toast("Unsave")
    end
    teleportCar()
end

function chooseSavedPoint()
    if next(savedPoints) == nil then
        gg.toast("No saved points")
        return mainMenu()
    end

    local names = {}
    for name in pairs(savedPoints) do
        table.insert(names, name)
    end

    table.sort(names)
    local choice = gg.choice(names, nil, "Select a point")
    if choice then
        local point = savedPoints[names[choice]]
        applyTeleport(point.x, point.y, point.z)
    else
        gg.toast("Selection canceled")
        teleport()
    end
end

function cleanupOnExit()
    gg.removeListItems(gg.getListItems())
    gg.clearResults()
    gg.toast("All saved data has been deleted!")
end

function teleportToLocation(location)
    local x = location.x
    local y = location.y
    local z = location.z

    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        savedValues[1].value = x
        savedValues[2].value = y
        savedValues[3].value = z
        gg.setValues(savedValues)

        gg.toast("Teleport to " .. location.name .. " (X: " .. x .. ", Y: " .. y .. ", Z: " .. z .. ")")
        gg.sleep(1000)
        gg.toast("Teleporter completed!")
        mainMenu()
    else
        gg.toast("Error: No saved coordinates")
        teleport()
    end
end

function teleportManualCar()
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        local input = gg.prompt({"Enter X:", "Enter Y:", "Enter Z:"},
            {savedValues[1].value, savedValues[2].value, savedValues[3].value},
            {"number", "number", "number"})

        if input then
            savedValues[1].value = input[1]
            savedValues[2].value = input[2]
            savedValues[3].value = input[3]

            gg.setValues(savedValues)
            gg.toast("✅ Teleportation completed!")
            mainMenu()
        else
            gg.toast("❌ Teleporter canceled")
            teleport()
        end
    else
        gg.toast("Error: Saved coordinates not found!")
        teleportCar()
    end
end

function teleportCar()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔍 Find and save coordinates",
        "💾 Saved Points",
        "🚀 Teleport by coordinates",
        "✅ Teleport by mark",
        "🧾 Teleport by checkpoint",
        "🔙 Back"
    }, nil, "Choose an action")

    if choice == 1 then
        local cands = findCoords()
        if cands then
            local filtered = twoChecks(cands)
            if filtered then
                processValues(filtered)
            end
        end
    elseif choice == 2 then
        userSavedPointsMenu() 
    elseif choice == 3 then
        teleportManualCar()
    elseif choice == 4 then
        teleportToMarkerCar()
    elseif choice == 5 then
        teleportToCheckpointCar()
    elseif choice == 6 or choice == nil then
        transportMenu()
    end
end

function toggleBax()
    if not baxActive then
        bax()
        baxActive = true
    else
        bax2()
        baxActive = false
    end
end

function bax() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("250.0", gg.TYPE_FLOAT)
    revert = gg.getResults(1000)
    gg.editAll("1000.0234765", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗Function activated❗")
end 

function bax2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1000.0234765", gg.TYPE_FLOAT)
    revert = gg.getResults(1000)
    gg.editAll("250.0", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗Function deactivated❗")
end

local hpFrozen = false
local savedItems = {}

function toggleFreezeCarHP()
    gg.clearResults()
    if not hpFrozen then
        gg.setRanges(gg.REGION_C_ALLOC)
        gg.searchNumber("4934256341737799680", gg.TYPE_QWORD)
        gg.refineNumber("4934256341737799680")
        local results = gg.getResults(1000000)

        if #results > 0 then
            local setList = {}
            for i, result in ipairs(results) do
                local hpAddr = result.address + (0.5 * 8)
                table.insert(setList, {
                    address = hpAddr,
                    flags = gg.TYPE_FLOAT,
                    value = 1200,
                    freeze = true
                })
            end

            gg.setValues(setList)
            gg.addListItems(setList)
            savedItems = setList
            hpFrozen = true
            gg.toast("✅ Godmode is activated")
        else
            gg.toast("❌ No value found")
        end

        gg.clearResults()
    else
        -- Снять заморозку перед удалением
        for i = 1, #savedItems do
            savedItems[i].freeze = false
        end
        gg.setValues(savedItems)
        gg.removeListItems(savedItems)
        savedItems = {}
        hpFrozen = false
        gg.toast("❌ Godmode deactivated")
    end
end

local teleportCategories = {
    ["1.Jobs"] = {
      {name = "Oil Refinery (Starter Job)", x = -823, y = 765 , z = 13},
      {name = "Sawmill (Starter Job)", x = 2728 , y = -1695, z = 23},
      {name = "Furniture Factory (Starter Job)", x = 2321, y = 2031, z = 16},
      {name = "Bus Driver", x = -483, y = 882, z = 12},
      {name = "Food Delivery", x = 257, y = 1725, z = 8},
      {name = "Mine", x = -1364, y = 2644 , z = 40},
      {name = "Mechanic Station", x = 390, y = 807, z = 12},
      {name = "Garbage Truck Driver", x = 1757, y = 2239, z = 16},
      {name = "Cash-in-transit", x = -2081, y = 1928, z = 52},
      {name = "Vehicle Thief", x = 2163, y = -1856, z = 20},
      {name = "Diver", x = 2427, y = 241, z = 5},        
    },
   ["2.Public Places"] = {
      {name = "Driving School", x = -508, y = 64, z = 13},
      {name = "Military Commissariat", x = 1916, y = 2302, z = 16},
      {name = "Moscow City", x = -221, y = 101, z = 13},
      {name = "Batirevo Bus Station", x = 1814, y = 2514, z = 15},
      {name = "Arzamas Bus Station", x = -476, y = 913, z = 12},
      {name = "Arzamas Park", x = -47, y = 914, z = 12},
      {name = "Church", x = 1879, y = 1168, z = 30},
      {name = "Pier", x = -449, y = -45, z = 2},
      {name = "Flight School", x = -558, y = 39, z = 14},
   },
   ["3.Car Dealerships"] = {
      {name = "AutoHouse", x = 430, y = 1173, z = 12},
      {name = "ArzamasCars", x = 455, y = 2200, z = 12},
      {name = "Autoyard", x = 2324, y = -1804, z = 22},
      {name = "MotoStyle", x = -1691, y = 1733, z = 48},
      {name = "Aviation Market", x = -1117, y = -1326, z = 48},
      {name = "Car Market", x = 2424, y = -1832, z = 22},
      {name = "Arzamas Parking", x = -429, y = 674, z = 12},
      {name = "Southern Parking", x = 2215, y = -1969, z = 21},
   },
   ["4.Government Organizations"] = {
      {name = "Government", x = -120, y = 788, z = 12},
      {name = "FSB", x = 524, y = 330, z = 12},
      {name = "Army", x = 1901, y = 1730, z = 16},
      {name = "MVD Arzamas", x = 141, y = 1265, z = 12},
      {name = "Traffic Police Southern", x = 2581, y = -2416, z = 22},
      {name = "EMERCOM of Russia", x = 1811, y = 2091, z = 16},
      {name = "Arzamas Hospital", x = 405, y = 1762, z = 12},
      {name = "Southern Hospital", x = 2112, y = -2385, z = 23},
      {name = "RGTRK Ostankino", x = 2127, y = -1939, z = 21},
      {name = "TRK Rhythm", x = -308, y = 659, z = 12},
   },
   ["5.Criminal Organizations"] = {
      {name = "Tambov OPG", x = 153, y = 447, z = 11},
      {name = "Peaky Blinders", x = 2431, y = -1927, z = 22},
      {name = "Izmailovo OPG", x = 1798, y = 2195, z = 16},
      {name = "Real Guys", x = 385, y = 1955, z = 8},
      {name = "Den", x = 1937, y = 2086, z = 16},
      {name = "Black Market", x = 2327, y = -246, z = 4},
      {name = "Prison", x = -1717, y = -2820, z = 15}, 
   },
   ["6.Banks"] = {
      {name = "Bank.A", x = 361, y = 1367, z = 12},
      {name = "Bank.S", x = 2376, y = -2140, z = 23},
      {name = "Bank.B", x = 1850, y = 2037, z = 17}, 
      {name = "Bank.L", x = -2081, y = 1928, z = 52},
      {name = "Printing Yard", x = -2585, y = 2835, z = 2},
   },
   ["7.Hotels"] = {
      {name = "Budget Hotel", x = 179, y = 491, z = 13},
      {name = "Luxury Hotel", x = -220, y = 100, z = 13},
      {name = "Mid-Class Hotel", x = 2089, y = -2283, z = 25},
      {name = "Budget Hotel", x = -2249, y = 1999, z = 50},
   },
   ["8.Transport Companies"] = {
      {name = "TK Garel", x = 2199, y = -874, z = 14},
      {name = "TK Batyrevo", x = 1847, y = 2907, z = 13},
      {name = "TK Tokhovsk", x = -2499, y = -78, z = 14},
   },
   ["9.Service Stations"] = {
      {name = "STO", x = 2053, y = 1887, z = 16},
      {name = "Tire Service", x = 2182, y = -1836, z = 21},
      {name = "Styling Center", x = 397, y = 795, z = 12},
      {name = "Tuning Center", x = -2, y = 639, z = 12},
   },
   ["10.Entertainment"] = {
      {name = "Duels", x = 1605, y = 1001, z = 14},
      {name = "Club", x = 2555, y = -2204, z = 23},
      {name = "Casino", x = 1458, y = 2641, z = 13},
      {name = "Zoo", x = -1776, y = 1283, z = 48},
      {name = "Game Center", x = -2121, y = 2057, z = 51.0},
      {name = "Dungeon", x = -2685, y = 2768, z = 2},
      {name = "Container Battle (Military)", x = 1994, y = 1399, z = 26},
      {name = "Container Battle (ZZ)", x = 339, y = -1903, z = 42},
      {name = "Container Auction", x = 802, y = 1796, z = 10},
      {name = "Reserve", x = -2520, y = -2257, z = 19},
      {name = "Pier (Fishing)", x = 2426, y = 231, z = 5},
   },
   ["11.Businesses"] = {
     ["1.Gas Stations"] = {
        {name = "Gas Station 7", x = -420, y = 925, z = 12},
        {name = "Gas Station 12", x = 755, y = 2562, z = 12},           
        {name = "Gas Station 16", x = 1994, y = 1927, z = 16},           
        {name = "Gas Station 22", x = 2296, y = -743, z = 13},           
        {name = "Gas Station 25", x = 2320, y = -1729, z = 23},           
        {name = "Gas Station 29", x = -588, y = -1894, z = 41},           
        {name = "Gas Station 33", x = -2689, y = 4, z = 11},
        {name = "Gas Station 52", x = 709, y = 780, z = 12},           
        {name = "Gas Station 58", x = -2770, y = 1886, z = 4},          
        {name = "Gas Station 61", x = -2445, y = 2785, z = 2},          
        {name = "Gas Station 73", x = 133, y = -1105, z = 41},
     }, 
     ["2.Clothing Stores"] = {
        {name = "Clothing Store 3", x = 203, y = 825, z = 13},
        {name = "Clothing Store 19", x = 1859, y = 2250, z = 16},
        {name = "Clothing Store 36", x = 2257, y = -2100, z = 22},
        {name = "Clothing Store 45", x = -2088, y = 1853, z = 52},
     },
     ["3.Accessory Stores"] = {
        {name = "Accessory Store 4", x = 218, y = 862, z = 14},  
        {name = "Accessory Store 37", x = 2409, y = -2143, z = 22},
        {name = "Accessory Store 76", x = 1945, y = 2065, z = 16},
        {name = "Accessory Store 77", x = -1991, y = 1645, z = 45},
     },
     ["4.Weapon Stores"] = {
        {name = "Weapon Store 2", x = 209, y = 826, z = 13},
        {name = "Weapon Store 34", x = 2349, y = -2142, z = 22},
        {name = "Weapon Store 42", x = 1977, y = 1893, z = 16},
        {name = "Weapon Store 63", x = -2459, y = 2722, z = 2},
     },
     ["5.Shops 24/7"] = {
        {name = "Shop 24/7 1", x = 153, y = 776, z = 12},
        {name = "Shop 24/7 6", x = -421, y = 911, z = 12},
        {name = "Shop 24/7 8", x = -362, y = 1024, z = 13},
        {name = "Shop 24/7 9", x = 16, y = 917, z = 12},
        {name = "Shop 24/7 10", x = 305, y = 1666, z = 8},
        {name = "Shop 24/7 11", x = 750, y = 2572, z = 12},
        {name = "Shop 24/7 13", x = 1804, y = 2506, z = 16},
        {name = "Shop 24/7 15", x = 1994, y = 1937, z = 16},
        {name = "Shop 24/7 17", x = 1918, y = 2093, z = 16},
        {name = "Shop 24/7 18", x = 1854, y = 2245, z = 16},
        {name = "Shop 24/7 21", x = 2292, y = -734, z = 13},
        {name = "Shop 24/7 23", x = 2475, y = -729, z = 13},
        {name = "Shop 24/7 24", x = 2304, y = -1728, z = 23},
        {name = "Shop 24/7 28", x = -579, y = -1896, z = 41},
        {name = "Shop 24/7 30", x = -200, y = -1376, z = 41},
        {name = "Shop 24/7 32", x = 2698, y = 5, z = 11},
        {name = "Shop 24/7 35", x = 2258, y = -2106, z = 22},
        {name = "Shop 24/7 43", x = -2144, y = 2045, z = 50},
        {name = "Shop 24/7 49", x = 2281, y = -2377, z = 22},
        {name = "Shop 24/7 51", x = 700, y = 784, z = 12},
        {name = "Shop 24/7 59", x = -2765, y = 1896, z = 4},
        {name = "Shop 24/7 60", x = -2444, y = 2795, z = 2},
        {name = "Shop 24/7 69", x = -2117, y = -159, z = 27},
        {name = "Shop 24/7 72", x = 123, y = -1107, z = 41},
        {name = "Shop 24/7 75", x = -1727, y = -1234, z = 42},
     },
     ["6.Diners"] = {
        {name = "Diner 5", x = 174, y = 737, z = 12}, 
        {name = "Diner 14", x = 1952, y = 1905, z = 15},
        {name = "Diner 20", x = 1860, y = 2270, z = 15},
        {name = "Diner 31", x = -379, y = -1824, z = 49},
        {name = "Diner 44", x = -2065, y = 1984, z = 50},
        {name = "Diner 53", x = 2307, y = -1911, z = 22},
        {name = "Diner 68", x = -2445, y = 2722, z = 2},
        {name = "Diner 74", x = -613.219788, y = -1293.424683, z = 47.567101},
     },
     ["7.Wizard’s Shop"] = {
         {name = "Wizard’s Shop", x = -2651, y = 2837, z = 2},
     },
     ["8.Electronics Stores"] = {
         {name = "DNS", x = 166, y = 719, z = 13},
         {name = "Eldorado", x = -2196, y = 1935, z = 50},
         {name = "DNS", x = 1919, y = 2042, z = 16},
     },
     ["9.Central Market"] = {
         {name = "Central Market", x = -2535, y = 2757, z = 2},
     },
     ["10.Pet Shelter"] = {
         {name = "Pet Shelter", x = 322, y = 776, z = 12},
     },
     ["11.Fish Shop"] = {
         {name = "Fish Shop", x = 2251, y = 1369, z = 12},
     },
     ["12.Diving Stores"] = {
         {name = "Diving Shop Whale", x = -2043, y = 1104, z = 4},
         {name = "Diving Shop Shell", x = 2364, y = -2598, z = 23},
     }
   },
   ["12.Greenhouse Complex"] = {
      {name = "Garden-City Store", x = 1207, y = -574, z = 41},
      {name = "Wood Store", x = 2708, y = -1679, z = 23},
      {name = "Glass Store", x = 2322, y = 2031, z = 16},
      {name = "Rebar Store", x = -1372, y = 2648, z = 40},
      {name = "Wholesale Store Garel", x = 2219, y = -891, z = 14},
      {name = "Wholesale Store Batyrevo", x = 1867, y = 2891, z = 13},
      {name = "Wholesale Store Lytkarino", x = -2517, y = -62, z = 14},
   },
   ["13.Farming Complex"] = {
     ["1.Hay Farm"] = {
       {name = "Horns and Feathers", x = -1554, y = -1277, z = 42},   
       {name = "Horns and Hooves", x = 1381, y = 977, z = 13},
     },
     ["2.Anashan"] = {
       {name = "Anashan", x = 2451, y = -649, z = 13},
     },
     ["3.Taiga for Logging"] = {
       {name = "Taiga for Logging", x = -2544, y = -2041, z = 19},
     },
     ["4.Furniture Factory"] = {
        {name = "Furniture Factory", x = 2303, y = 2005, z = 16},
     }
   },
   ["14.Airline Office"] = {
     {name = "Airline Office", x = -1098, y = -1641, z = 48},
   }, 
}
local teleportCategoryOrder = {
    "1.Jobs",
    "2.Public Places",
    "3.Car Dealerships",
    "4.Government Organizations",
    "5.Criminal Organizations",
    "6.Banks",
    "7.Hotels",
    "8.Transport Companies",
    "9.Service Stations",
    "10.Entertainment",
    "11.Businesses",
    "12.Greenhouse Complex",
    "13.Farming Complex",
    "14.Airline Office"
}

local savedPointsFile = "/sdcard/saved_points.lua"
local savedPoints = {}

function loadSavedPoints()
    local f = io.open(savedPointsFile, "r")
    if f then
        local content = f:read("*a")
        savedPoints = load("return " .. content)()
        f:close()
    end
end

function savePointsToFile()
    local f = io.open(savedPointsFile, "w")
    if f then
        f:write(serializeTable(savedPoints))
        f:close()
    end
end

function serializeTable(tbl)
    local str = "{\n"
    for k, v in pairs(tbl) do
        str = str .. string.format('["%s"] = {x = %f, y = %f, z = %f},\n', k, v.x, v.y, v.z)
    end
    str = str .. "}"
    return str
end

function findAndSaveCoords()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(1)

    if #results > 0 then
        local baseAddr = results[1].address
        local offsets = {
            {address = baseAddr + (15 * 8), flags = gg.TYPE_FLOAT},
            {address = baseAddr + (15.5 * 8), flags = gg.TYPE_FLOAT},
            {address = baseAddr + (14.5 * 8), flags = gg.TYPE_FLOAT}
        }

        local values = gg.getValues(offsets)
        gg.addListItems(values)

        gg.toast("Coordinates saved!")
        teleport()
    else
        gg.toast("No value found")
        teleport()
    end

    gg.clearResults()
end

function teleportManual()
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        local input = gg.prompt({"Enter X:", "Enter Y:", "Enter Z:"},
            {savedValues[1].value, savedValues[2].value, savedValues[3].value},
            {"number", "number", "number"})

        if input then
            savedValues[1].value = input[1]
            savedValues[2].value = input[2]
            savedValues[3].value = input[3]

            gg.setValues(savedValues)
            gg.toast("✅ Teleportation completed!")
            mainMenu()
        else
            gg.toast("❌ Teleporter canceled")
            teleport()
        end
    else
        gg.toast("❌ Error: Saved coordinates not found!")
        teleport()
    end
end

function selectTeleportCategory()
    local categoryNames = teleportCategoryOrder

    local choice = gg.choice(categoryNames, nil, "Select a category")
    if choice then
        local selectedCategory = categoryNames[choice]

        if selectedCategory == "11.Businesses" or selectedCategory == "13.Farming Complex" then
            local sortedSubcategories = {}

            
            for subcat, _ in pairs(teleportCategories[selectedCategory]) do
                table.insert(sortedSubcategories, subcat)
            end

            
            table.sort(sortedSubcategories, function(a, b)
                local numA = tonumber(a:match("^(%d+)"))  
                local numB = tonumber(b:match("^(%d+)"))  
                return numA < numB  
            end)

            local choiceSubcategory = gg.choice(sortedSubcategories, nil, "Select Business Subcategory")
            if choiceSubcategory then
                local selectedSubcategory = sortedSubcategories[choiceSubcategory]
                selectTeleportLocation(selectedCategory, selectedSubcategory)
            else
                gg.toast("You have not selected a subcategory")
            end
        else
            selectTeleportLocation(selectedCategory)
        end
    else
        gg.toast("You didn't select a category")
        teleport()
    end
end

function selectTeleportLocation(category, subcategory)
    local locations
    if subcategory then
        
        locations = teleportCategories[category][subcategory]
    else
        
        locations = teleportCategories[category]
    end

    local locationNames = {}
    for _, location in ipairs(locations) do
        table.insert(locationNames, location.name)
    end

    local choiceLocation = gg.choice(locationNames, nil, "Choose a location")
    if choiceLocation then
        local selectedLocation = locations[choiceLocation]
        teleportToLocation(selectedLocation)
    else
        gg.toast("You didn't select a location")
        teleport()
    end
end
    
function applyTeleport(x, y, z)
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        savedValues[1].value = x
        savedValues[2].value = y
        savedValues[3].value = z
        gg.setValues(savedValues)
        gg.toast("✅ Teleporter completed!")
        mainMenu()
    else
        gg.toast("❌ Error: No saved coordinates")
        teleport()
    end
end

function userSavedPointsMenu()
    local options = {"➕ Save Current Point", "📌 Teleport to Saved", "⬅️ Back"}
    local choice = gg.choice(options, nil, "Saved Points")

    if choice == 1 then
        saveCurrentPoint()
    elseif choice == 2 then
        chooseSavedPoint()
    else
        teleport()
    end
end

function saveCurrentPoint()
    local values = gg.getListItems()
    if #values < 3 then
        gg.toast("First, find the coordinates")
        return teleport()
    end

    local input = gg.prompt({"Point Name:"}, nil, {"text"})
    if input and input[1] ~= "" then
        savedPoints[input[1]] = {
            x = values[1].value,
            y = values[2].value,
            z = values[3].value
        }
        savePointsToFile()
        gg.toast("✅ The point is saved!")
    else
        gg.toast("❌ Unsave")
    end
    teleport()
end

function chooseSavedPoint()
    if next(savedPoints) == nil then
        gg.toast("❌ No saved points")
        return mainMenu()
    end

    local names = {}
    for name in pairs(savedPoints) do
        table.insert(names, name)
    end

    table.sort(names)
    local choice = gg.choice(names, nil, "Select a point")
    if choice then
        local point = savedPoints[names[choice]]
        applyTeleport(point.x, point.y, point.z)
    else
        gg.toast("❌ Selection canceled")
        teleport()
    end
end

function cleanupOnExit()
    gg.removeListItems(gg.getListItems())
    gg.clearResults()
    gg.toast("All saved data has been deleted!")
end

function teleportToLocation(location)
    local x = location.x
    local y = location.y
    local z = location.z

    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        savedValues[1].value = x
        savedValues[2].value = y
        savedValues[3].value = z
        gg.setValues(savedValues)

        gg.toast("Teleport to " .. location.name .. " (X: " .. x .. ", Y: " .. y .. ", Z: " .. z .. ")")
        gg.sleep(1000)
        gg.toast("Teleporter completed!")
        mainMenu()
    else
        gg.toast("Error: No saved coordinates")
        teleport()
    end
end

loadSavedPoints()
mainMenu()

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        mainMenu()
    end
    gg.sleep(100)
end
