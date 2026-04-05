local isLangSelected = false
local currentLang = "RU"
local i18n = {} 

local url = "https://raw.githubusercontent.com/Kit456/-Tiktonik/refs/heads/⠅T⠊i⠞k-⠇t⠑o⠛n⠑i⠝k⠙/language.lua"

function loadTranslations()
    local response = gg.makeRequest(url)
    
    if not response or not response.content then
        gg.alert("Ошибка: нет ответа от сервера")
        return false
    end

    local chunk, err = load(response.content)
    if not chunk then
        gg.alert("Ошибка загрузки Lua: " .. tostring(err))
        return false
    end

    local ok, newData = pcall(chunk)
    if not ok then
        gg.alert("Ошибка выполнения файла переводов")
        return false
    end

    if type(newData) == "table" then
        i18n = newData
        return true
    else
        gg.alert("Файл переводов должен возвращать таблицу!")
        return false
    end
end

function _T(key)
    if i18n and i18n[currentLang] and i18n[currentLang][key] then
        return i18n[currentLang][key]
    end
    return key
end

function selectLanguage()
    if isLangSelected then return end 

    if not loadTranslations() then
        gg.alert("Не удалось загрузить переводы")
        os.exit()
    end
    
    local choice = gg.choice({"Русский", "English"}, nil, "Select Language / Выберите язык:")
    
    if choice == 1 then
        currentLang = "RU"
        isLangSelected = true
    elseif choice == 2 then
        currentLang = "EN"
        isLangSelected = true
    else
        os.exit()
    end
end

function mainMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        _T("menu_teleport"),
        _T("menu_transport"),
        _T("menu_character"),
        _T("menu_gan"),
        _T("menu_bots"),
        _T("menu_exit"),
    }, nil, _T("prompt_choose_func"))

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
        _T("teleport_teleport_cords"), 
        _T("teleport_teleport_point"), 
        _T("teleport_save"), 
        _T("teleport_teleport_met"), 
        _T("teleport_teleport_checkpoint"), 
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

    
    if choice == 1 then
        teleportManual()
    elseif choice == 2 then
        selectTeleportCategory()
    elseif choice == 3 then
        userSavedPointsMenu()
    elseif choice == 4 then
        searchAndReplaceCoords()
    elseif choice == 5 then
        TeleportPoMet()
    elseif choice == 6 then
        mainMenu()
    else
        mainMenu()
    end
end

function transportMenu()
    local choice = gg.choice({
        _T("car_teleport"), 
        _T("car_gamemode"), 
        _T("car_bax"), 
        _T("car_flip"), 
        _T("car_speed"), 
        _T("car_scooter_speed"), 
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

    if choice == 1 then
        teleportCar()
    elseif choice == 2 then
        toggleFreezeCarHP()
    elseif choice == 3 then
        toggleBax()
    elseif choice == 4 then
        flip()
    elseif choice == 5 then
        speedcars()
    elseif choice == 6 then
        FastScooterToggle()
    elseif choice == 7 or choice == nil then
        mainMenu()
    end
end

function PersMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        _T("pers_magnification_hit"), 
        _T("pets_speed_sprint"), 
        _T("pers_Infinite_sprint"), 
        _T("pers_fov"), 
        _T("pers_name_tags"), 
        _T("pers_rain"), 
        _T("pers_change_nick"), 
        _T("pets_gamemode"), 
        _T("pers_armor"), 
        _T("pers_speed"), 
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

    if choice == 1 then
        searchAndChangeHitboxes()
    elseif choice == 2 then
        toggleSprint()
    elseif choice == 3 then
        Sprint()
    elseif choice == 4 then
        toggleFov()
    elseif choice == 5 then
        nameTags()
    elseif choice == 6 then
        toggleRain()
    elseif choice == 7 then
        changeNik()
    elseif choice == 8 then
        Gm_pers()
    elseif choice == 9 then
        Gm_armor()
    elseif choice == 10 then
        SpeedHack()
    elseif choice == 11 or choice == nil then
        mainMenu()
    end
end

function Bots()
        local subMenu = gg.choice({
        _T("bot_taxi"), 
        _T("bot_race"), 
        _T("bot_air"), 
        _T("bot_track"), 
        _T("bot_diver"), 
        _T("bot_oil"), 
        _T("bot_mine"), 
        _T("bot_sawmill"), 
        _T("bot_furniture"), 
        _T("bot_delivery"), 
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

        if subMenu == 1 then
            botTaxi()
        elseif subMenu == 2 then
            cycleCheckpoints()
        elseif subMenu == 3 then
            botAir() 
        elseif subMenu == 4 then
            bot_track()
        elseif subMenu == 5 then
            diverMenu()
        elseif subMenu == 6 then
            bot_Neftezavod()
        elseif subMenu == 7 then
            bot_main()
        elseif subMenu == 8 then
            bot_forest()
        elseif subMenu == 9 then
            bot_factory()
        elseif subMenu == 10 then
            botCourier()
        elseif subMenu == 11 then
            mainMenu()
        end
    end

local recoilActive = false

function Gun()
    gg.setVisible(false)
    local choice = gg.choice({
        _T("gun_give"), 
        _T("gun_throw"), 
        _T("gun_offset"), 
        _T("gun_overkill"), 
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

    if choice == 1 then
        Gun1()
    elseif choice == 2 then
        toggleRecoil()
    elseif choice == 3 then
        Smeh()
    elseif choice == 4 then
        Gm_weapons()
    elseif choice == 5 or choice == nil then
        mainMenu()
    end
end

local active = false
local savedAddr = nil
local savedValue = nil
local selectedSpeed = 3 -- значение по умолчанию

function chooseSpeedSlider()
    local input = gg.prompt(
        {_T("change_speed")},
        {selectedSpeed},
        {"number"}
    )

    if input then
        selectedSpeed = tonumber(input[1])
    end
end


function SpeedHack()
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)

    if not active then
        chooseSpeedSlider()

        gg.searchNumber("9187343240761165228", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
        local results = gg.getResults(1)

        if #results == 0 then
            gg.alert(_T("value_not_entered"))
            return
        end

        savedAddr = results[1].address
        savedValue = gg.getValues({{address = savedAddr, flags = gg.TYPE_QWORD}})[1].value

        local t = {}
        t[1] = {address = savedAddr, flags = gg.TYPE_FLOAT, value = selectedSpeed}
        gg.setValues(t)

        active = true
        gg.toast(_T("activated") .. " | x" .. selectedSpeed)

    else
        if savedAddr ~= nil and savedValue ~= nil then
            local restore = {}
            restore[1] = {address = savedAddr, flags = gg.TYPE_QWORD, value = savedValue}
            gg.setValues(restore)
            gg.toast(_T("Deactivated"))
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
        gg.alert(_T("No_value_found"))
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
        gg.toast(_T("activated"))
    end
end

function speedcars()
    gg.clearResults()

    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4812096201845506048", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)

    local r = gg.getResults(100)
    if #r == 0 then
        gg.alert(_T("No_value_found"))
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
    gg.toast(_T("activated"))
end

function flip()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4812096201845506048", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(100)

    if #results == 0 then
        gg.alert(_T("No_value_found"))
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
    gg.toast(_T("activated"))
end

local modifiedValues = {}

function searchAndReplaceFloat(target, newValue)
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber(target, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(100)
    
    if #results == 0 then
        gg.toast(_T("No_value_found"))
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
    gg.toast(_T("success"))
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
    gg.toast(_T("success"))
    modifiedValues = {}
end


function Gm_armor()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("99999.99", gg.TYPE_FLOAT)
    local results = gg.getResults(1)

    if #results == 0 then
        gg.alert(_T("No_value_found"))
        return
    end
    local targetAddr = results[1].address - (9.5 * 8)
    local edit = {
        address = targetAddr,
        flags = gg.TYPE_FLOAT,
        value = 3276887
    }

    gg.setValues({edit})
    edit.freeze = true
    gg.addListItems({edit})

    gg.toast(_T("activated"))
end

function Gm_pers()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("99999.99", gg.TYPE_FLOAT)
    local results = gg.getResults(1)

    if #results == 0 then
        gg.alert(_T("No_value_found"))
        return
    end
    local targetAddr = results[1].address - (10.5 * 8)
    local edit = {
        address = targetAddr,
        flags = gg.TYPE_FLOAT,
        value = 3276887
    }

    gg.setValues({edit})
    edit.freeze = true
    gg.addListItems({edit})

    gg.toast(_T("activated"))
end

function Smeh()
    local choice = gg.choice({
        _T("offset"),
        _T("offset_2"),
        _T("offset_3"),
        _T("offset_4"),
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

    if choice == 1 then
        searchAndReplaceFloat("0.20000000298", -1)
    elseif choice == 2 then
        searchAndReplaceFloat("0.20000000298", 1)
    elseif choice == 3 then
        local input = gg.prompt({_T("offset_5")}, nil, {"number"})
        if input and input[1] then
            local num = tonumber(input[1])
            if num then
                searchAndReplaceFloat("0.20000000298", num)
            else
                gg.toast(_T("not_number"))
            end
        else
            gg.toast(_T("entry_canceled"))
        end
    elseif choice == 4 then
        restoreOriginalValues()
        gg.clearResults()
    end
end

function Gm_weapons()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔫 AK-47",
        "💥 Desert Eagle",
        "🔧 M4",
        "⚙️ MP5",
        "🧨 Shotgun",
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

    if choice == 1 then
        Gm_weapon("AK-47", 27, 27.5)
    elseif choice == 2 then
        Gm_weapon("Desert Eagle", 15, 15.5)
    elseif choice == 3 then
        Gm_weapon("M4", 27, 27.5)
    elseif choice == 4 then
        Gm_weapon("MP5", 23,5, 23)
    elseif choice == 5 then
        Gm_weapon("Shotgun", 19, 19.5)
    elseif choice == 6 then
        Gun()
    end
end

function Gm_weapon(name, offset_main, offset_ref)
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("99999.99", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(1)
    local baseAddr = results[1].address
    local targetAddr = baseAddr + (offset_main * 8)
    local refAddr = baseAddr + (offset_ref * 8)
    local refValue = gg.getValues({{address = refAddr, flags = gg.TYPE_DWORD}})[1].value
    gg.setValues({{address = targetAddr, flags = gg.TYPE_DWORD, value = refValue}})
    gg.addListItems({{address = targetAddr, flags = gg.TYPE_DWORD, freeze = true}})

    gg.toast(_T("activated"))
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
    gg.toast(_T("activated"))
end 

function gunn2() 
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("95;900", gg.TYPE_FLOAT)
    gg.refineNumber("95", gg.TYPE_FLOAT)
    revert = gg.getResults(555)
    gg.editAll("100", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast(_T("Deactivated"))
end

function Gun1()
    gg.setVisible(false)
    local menu = gg.choice({
        _T("gun1"), 
        _T("gun2"), 
        _T("gun3"), 
        _T("gun4"), 
        _T("gun5"), 
        _T("gun6"), 
        _T("gun7"), 
        _T("gun8"), 
        _T("gun9"), 
        _T("gun10"), 
        _T("gun11"), 
        _T("gun12"), 
        _T("gun13"), 
        _T("gun14"), 
        _T("gun15"), 
        _T("gun16"), 
        _T("gun17"), 
        _T("gun18"), 
        _T("gun19"), 
        _T("gun20"), 
        _T("gun21"), 
        _T("gun22"), 
        _T("gun23"), 
        _T("gun24"), 
        _T("gun25"), 
        _T("gun26"), 
        _T("gun27"), 
        _T("gun28"), 
        _T("gun29"), 
        _T("gun30"), 
        _T("gun31"), 
        _T("gun32"), 
        _T("gun33"), 
        _T("gun34"), 
        _T("gun35"), 
        _T("gun36"), 
        _T("gun37"), 
        _T("gun38"), 
        _T("gun39"), 
        _T("gun40"), 
        _T("gun41"), 
        _T("gun42"), 
        _T("gun43"), 
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

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
    gg.setRanges(gg.REGION_OTHER)
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
            {address = baseAddr + (35.5 * 8), flags = gg.TYPE_DWORD, value = 20},
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
    WEAPON_BRASSKNUCKLE = "Кастет",
    WEAPON_GOLFCLUB = "Клюшка для гольфа",
    WEAPON_NITESTICK = "Полицейская дубинка",
    WEAPON_KNIFE = "Нож",
    WEAPON_BAT = "Бейсбольная бита",
    WEAPON_SHOVEL = "Лопата",
    WEAPON_POOLSTICK = "Бильярдный кий",
    WEAPON_KATANA = "Катана",
    WEAPON_CHAINSAW = "Бензопила",
    WEAPON_DILDO1 = "Фиолетовый фаллоимитатор",
    WEAPON_DILDO2 = "Серый фаллоимитатор",
    WEAPON_VIBE1 = "Розовый вибратор",
    WEAPON_VIBE2 = "Белый вибратор",
    WEAPON_FLOWER = "Букет цветов",
    WEAPON_CANE = "Трость",
    WEAPON_GRENADE = "Граната",
    WEAPON_TEARGAS = "Слезоточивый газ",
    WEAPON_MOLOTOV = "Коктейль Молотова",
    WEAPON_COLT45 = "Пистолет Colt .45",
    WEAPON_SILENCED = "Пистолет с глушителем",
    WEAPON_DESERT_EAGLE = "Desert Eagle",
    WEAPON_SHOTGUN = "Обрез",
    WEAPON_SAWEDOFF = "Двустволка",
    WEAPON_SPAS12 = "SPAS-12",
    WEAPON_UZI = "Узи",
    WEAPON_MP5 = "MP5",
    WEAPON_AK47 = "АК-47",
    WEAPON_M4 = "M4",
    WEAPON_TEC9 = "TEC-9",
    WEAPON_RIFLE = "Охотничья винтовка",
    WEAPON_SNIPER = "Снайперская винтовка",
    WEAPON_ROCKET_LAUNCHER = "РПГ",
    WEAPON_HEATSEEKER = "Самонаводящийся РПГ",
    WEAPON_FLAMETHROWER = "Огнемёт",
    WEAPON_MINIGUN = "Миниган",
    WEAPON_SATCHEL = "Взрывчатка",
    WEAPON_BOMB = "Бомба",
    WEAPON_SPRAYCAN = "Баллончик с краской",
    WEAPON_FIREEXTINGUISHER = "Огнетушитель",
    WEAPON_CAMERA = "Камера",
    WEAPON_PARACHUTE = "Парашют",
}
    if #offsets > 0 then
        gg.setValues(offsets)
        local name = weaponNames[type] or type
        gg.toast(_T("activated"))
    else
    gg.setVisible(false)
        gg.toast(_T("no_weapons"))
    end
end

function TeleportPoMet()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil

    for i, v in ipairs(savedList) do
        if v.name == "x" then savedX = v end
        if v.name == "y" then savedY = v end
        if v.name == "z" then savedZ = v end
    end

    if not (savedX and savedY and savedZ) then
        findAndSaveCoords(true)
    end

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
        gg.toast(_T("tag_found"))
        return
    end

    local baseAddr = filtered[1].address
    local coords = {
        {address = baseAddr + (1 * 8), flags = gg.TYPE_FLOAT},   -- X
        {address = baseAddr + (1.5 * 8), flags = gg.TYPE_FLOAT}, -- Z
        {address = baseAddr + (2 * 8), flags = gg.TYPE_FLOAT}    -- Y
    }

    local values = gg.getValues(coords)

    savedX.value = values[1].value
    savedY.value = values[2].value
    savedZ.value = values[3].value

    gg.setValues({savedX, savedY, savedZ})
    gg.toast(_T("changed_successfully"))
    gg.clearResults()
end

function searchAndReplaceCoords()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "x" then savedX = v end
        if v.name == "y" then savedY = v end
        if v.name == "z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        findAndSaveCoords(true)
    end
    gg.toast(_T("expectation"))
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
        gg.toast(_T("no_coordinates_found"))
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
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(1)

    if #results == 0 then
        gg.toast(_T("tag_found"))
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
    gg.toast(_T("coordinates_change"))
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
    local oldNick = gg.prompt({_T("Current_nickname")}, nil, {"text"})
    if not oldNick or not oldNick[1] then
        gg.toast(_T("Nickname_entered"))
        return
    end

    local oldAscii = stringToAscii(oldNick[1])
    local results = searchAsciiSequence(oldAscii)

    if #results == 0 then
        gg.toast(_T("Nickname_found"))
        return
    end

    local newNick = gg.prompt({_T("New_nickname")}, nil, {"text"})
    if not newNick or not newNick[1] then
        gg.toast(_T("Not_entered"))
        return
    end

    if #newNick[1] ~= #oldNick[1] then
        gg.toast(_T("Same_length"))
        return
    end

    local newAscii = stringToAscii(newNick[1])
    replaceAscii(results, newAscii)

    gg.toast(_T("Modified") .. newNick[1])
end

--------------------------------------------------------------

function changeChatNickSafe()
    local oldNick = gg.prompt({_T("Current_nickname")}, nil, {"text"})
    if not oldNick or not oldNick[1] then
        gg.toast(_T("Nickname_entered"))
        return
    end
    
    local newNick = gg.prompt({"Введите новый ник:"}, nil, {"text"})
    if not newNick or not newNick[1] then
        gg.toast(_T("Not_entered"))
        return
    end

    if #oldNick[1] ~= #newNick[1] then
        gg.toast(_T("Same_length"))
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
        gg.toast(_T("Nickname_found"))
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
        setList = {table.unpack(setList, 1, 50 * #newNick[1])}
    end

    if #setList > 0 then
        gg.setValues(setList)
        gg.toast(_T("Changed"))
    end
end

function changeNik()
    gg.setVisible(false)
    local choice = gg.choice({
        _T("Change_another_player"), 
        _T("Chat_Nick"), 
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

    if choice == 1 then
        changeTwinNick()
    elseif choice == 2 then
        changeChatNickSafe()
    elseif choice == 3 then
        mainMenu()
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
    gg.toast(_T("activated"))
    gg.clearResults()
end

function dv2()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4.0;-0.565651;0.20000000298;5.0;10.0;1.0;0.5;0.30000001192:29", gg.TYPE_FLOAT)
    gg.refineNumber("-0.565651", gg.TYPE_FLOAT)
    revert = gg.getResults(100000)
    gg.editAll("0.7", gg.TYPE_FLOAT)
    gg.toast(_T("Deactivated"))
    gg.clearResults()
end

function fov1() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1116471296", gg.TYPE_DWORD)
    revert = gg.getResults(300)
    gg.editAll("1122469536", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast(_T("activated"))
end 

function fov2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1122469536", gg.TYPE_DWORD)
    revert = gg.getResults(300)
    gg.editAll("1116471296", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast(_T("Deactivated"))
end 

function dojd1() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("0.00499999989", gg.TYPE_FLOAT)
    revert = gg.getResults(300)
    gg.editAll("-25.84625", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast(_T("activated"))
end 

function dojd2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("-25.84625", gg.TYPE_FLOAT)
    revert = gg.getResults(300)
    gg.editAll("0.00499999989", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast(_T("Deactivated"))
end

local baxActive = false

local function teleportToCheckpointCar()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        gg.alert(_T("save_coordinates"))
        return
    end

    savedX.value = 0
    savedY.value = 30
    savedZ.value = -1370
    gg.setValues({savedX, savedY, savedZ})
    gg.toast("➡ Телепорт в точку (0, 0, 0)")
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
        gg.alert(_T("not_found"))
        return
    end

    local firstFound = filtered[1]
    local baseAddr = firstFound.address

    local offset3 = baseAddr + (1 * 8)   -- X
    local offset1 = baseAddr + (2 * 8) -- Z
    local offset2 = baseAddr + (1.5 * 8)   -- Y

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
    gg.toast(_T("teleport_checkpoint"))
    gg.clearResults()
end

function teleportToMarkerCar() 
    gg.toast(_T("expectation"))
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
        gg.toast(_T("tag_found"))
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
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end

    if not (savedX and savedY and savedZ) then
        gg.alert(_T("save_coordinates"))
        return
    end

    savedX.value = 0
    savedY.value = 30
    savedZ.value = -1370
    gg.setValues({savedX, savedY, savedZ})
    gg.toast(_T("to_point"))
    gg.sleep(2000)

    savedX.value = savedCoords[1].value
    savedZ.value = savedCoords[2].value
    savedY.value = 55
    gg.setValues({savedX, savedY, savedZ})
    gg.toast(_T("Teleporter_completed"))
end

function botTaxi()
    gg.toast(_T("bot_taxi"))
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil

    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end

    if not (savedX and savedY and savedZ) then
        gg.alert(_T("save_coordinates"))
        return
    end

    -- поиск чекпоинта
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9,44502007e13", gg.TYPE_FLOAT)

    local results = gg.getResults(1000000)
    local checkpointAddr = nil

    for _, v in ipairs(results) do
        if string.sub(string.format("%X", v.address), -3) == "278" then
            checkpointAddr = v.address
            break
        end
    end

    if checkpointAddr == nil then
        gg.alert(_T("not_found"))
        return
    end
    gg.clearResults()
    gg.toast(_T("checkpoint_found"))

    local coords = {
        {address = checkpointAddr + (2 * 8), flags = gg.TYPE_FLOAT},   -- X
        {address = checkpointAddr + (1.5 * 8), flags = gg.TYPE_FLOAT}, -- Y
        {address = checkpointAddr + (1 * 8), flags = gg.TYPE_FLOAT},   -- Z
    }

    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)
            gg.toast(_T("bot_stopped"))
            break
        end

        local car = gg.getValues({
            {address = savedX.address, flags = gg.TYPE_FLOAT},
            {address = savedY.address, flags = gg.TYPE_FLOAT},
            {address = savedZ.address, flags = gg.TYPE_FLOAT}
        })

        local target = gg.getValues(coords)

        local dx = target[1].value - car[1].value
        local dy = target[2].value - car[2].value
        local dz = target[3].value - car[3].value

        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)

        if dist > 1 then

            local speed = 5

            savedX.value = car[1].value + dx/dist * speed
            savedY.value = car[2].value + dy/dist * speed
            savedZ.value = car[3].value + dz/dist * speed

            gg.setValues({savedX, savedY, savedZ})
        end
        gg.sleep(50)
    end
end




function cycleCheckpoints()
    toggleFreezeCarHP()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil

    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end

    if not (savedX and savedY and savedZ) then
        gg.alert(_T("save_coordinates"))
        return
    end
    local function moveSmooth(savedX, savedY, savedZ, coords)
    while true do
        local cur = gg.getValues({
            {address = savedX.address, flags = gg.TYPE_FLOAT},
            {address = savedY.address, flags = gg.TYPE_FLOAT},
            {address = savedZ.address, flags = gg.TYPE_FLOAT}
        })

        local target = gg.getValues(coords)

        local curX = cur[1].value
        local curY = cur[2].value
        local curZ = cur[3].value

        local targetX = target[1].value
        local targetY = target[2].value
        local targetZ = target[3].value

        local dx = targetX - curX
        local dy = targetY - curY
        local dz = targetZ - curZ

        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)

        if dist < 1 then
            break
        end

        local speed = 5

        savedX.value = curX + dx/dist * speed
        savedY.value = curY + dy/dist * speed
        savedZ.value = curZ + dz/dist * speed

        gg.setValues({savedX, savedY, savedZ})

        gg.sleep(50)
    end
end
    local checkpointAddr = nil
    local lastX, lastY, lastZ = nil, nil, nil
    local unchangedCount = 0
    while true do
        gg.clearResults()
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
                gg.alert(_T("not_found"))
                return
            end

            checkpointAddr = filtered[1].address
            gg.toast(_T("checkpoint_found"))

        end
        local offset3 = checkpointAddr + (1 * 8)
        local offset1 = checkpointAddr + (2 * 8)
        local offset2 = checkpointAddr + (1.5 * 8)

        local coords = {
            {address = offset1, flags = gg.TYPE_FLOAT},
            {address = offset2, flags = gg.TYPE_FLOAT},
            {address = offset3, flags = gg.TYPE_FLOAT},
        }
        local values = gg.getValues(coords)
        if lastX == values[1].value and lastY == values[2].value and lastZ == values[3].value then
            unchangedCount = unchangedCount + 1
        else
            unchangedCount = 0
        end
        moveSmooth(savedX, savedY, savedZ, coords)
        if unchangedCount >= 3 then
            gg.toast(_T("stopped_updating"))
            break
        end
        lastX = values[1].value
        lastY = values[2].value
        lastZ = values[3].value
        gg.sleep(1000)
    end
end

function botAir()
    toggleFreezeAirHP() 
    gg.sleep(1500)
    
    -- Окно настройки скорости полета
    local prompt = gg.prompt(
        {_T("enter_speed")}, 
        {"7"}, 
        {"number"}
    )
    
    if not prompt then
        return
    end
    local customSpeed = tonumber(prompt[1])
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end
    
    if not (savedX and savedY and savedZ) then
        gg.alert(_T("save_coordinates"))
        return
    end

    local checkpointAddr = nil

    gg.clearResults()
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
        gg.alert(_T("not_found"))
        return
    end

    checkpointAddr = filtered[1].address
    gg.toast(_T("checkpoint_found"))

    -- Офсеты чекпоинта
    local coords = {
        {address = checkpointAddr + (2 * 8), flags = gg.TYPE_FLOAT},   -- X
        {address = checkpointAddr + (1.5 * 8), flags = gg.TYPE_FLOAT}, -- Y
        {address = checkpointAddr + (1 * 8), flags = gg.TYPE_FLOAT},   -- Z
    }

    local timeAtCheckpoint = 0 -- Таймер для проверки конца рейса

    while true do
        -- Проверка на выход в меню GameGuardian
        if gg.isVisible(true) then
            gg.setVisible(false)
            gg.toast(_T("bot_stopped"))
            break
        end

        -- Получаем текущие координаты самолета
        local car = gg.getValues({
            {address = savedX.address, flags = gg.TYPE_FLOAT},
            {address = savedY.address, flags = gg.TYPE_FLOAT},
            {address = savedZ.address, flags = gg.TYPE_FLOAT}
        })

        -- Получаем координаты текущего чекпоинта
        local target = gg.getValues(coords)

        local dx = target[1].value - car[1].value
        local dy = target[2].value - car[2].value
        local dz = target[3].value - car[3].value
        
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)

        -- Для самолета берем радиус побольше (например, 5 или 10 метров), 
        -- чтобы он не пытался втиснуться в 1 пиксель
        if dist > 5 then
            -- Летим к чекпоинту
            savedX.value = car[1].value + (dx / dist) * customSpeed
            savedY.value = car[2].value + (dy / dist) * customSpeed
            savedZ.value = car[3].value + (dz / dist) * customSpeed
            
            gg.setValues({savedX, savedY, savedZ})
            
            timeAtCheckpoint = 0 -- Обнуляем таймер, пока находимся в движении
        else
            -- Мы достигли чекпоинта, ждем пока он обновится
            timeAtCheckpoint = timeAtCheckpoint + 50
            
            -- Если мы стоим на чекпоинте 3 секунды (3000 мс) и он не меняет координаты, 
            -- значит новых точек нет и рейс окончен.
            if timeAtCheckpoint >= 3000 then
                gg.toast(_T("stopped_updating"))
                break
            end
        end
        
        gg.sleep(50) -- Плавный цикл в 50 мс
    end
end

local FLOAT = gg.TYPE_FLOAT

local function getFirst3Coords()
    local list = gg.getListItems()
    if #list < 3 then
        findAndSaveCoords()
        list = gg.getListItems()
        if #list < 3 then
            gg.toast(_T("no_coordinates_found"))
            return nil
        end
    end
    return {list[1], list[2], list[3]}
end

local function teleport(tx, ty, tz)
    if not (tx and ty and tz) then
        return
    end

    local saved = getFirst3Coords()
    if not saved then return end
    if not (saved[1].address and saved[2].address and saved[3].address) then
        return
    end

    gg.setValues({
        {address = saved[1].address, flags = FLOAT, value = tx},
        {address = saved[2].address, flags = FLOAT, value = ty},
        {address = saved[3].address, flags = FLOAT, value = tz}
    })
end

local pumps = {
    {x = -2094, y = 1550, z = 45},--1
    {x = -1822, y = -187, z = 37},--2  
    {x = -146, y = -2024, z = 32},--3
    {x = -2728, y = 2794, z = 2},--4
    {x = -2747, y = 2813, z = 2},--5
    {x = -2805, y = 2813, z = 2},--6
    {x = -2798, y = 2777, z = 2},--7
    {x = -2750, y = 2768, z = 2},--8
    {x = -2798, y = 2753, z = 2},--9
    {x = -2791, y = 2726, z = 2},--10
    {x = -2748, y = 2730, z = 2},--11
    {x = -2667, y = 2883, z = 2},--12
    {x = -2481, y = 2846, z = 5},--13
    {x = -1392, y = 2517, z = 44},--14
    {x = -1607, y = 1457, z = 50},--15
    {x = -2094, y = 1128, z = 5},--16
    {x = -2709, y = 2134, z = 27},--17
    {x = -2214, y = -39, z = 13},--18
    {x = -2217, y = 186, z = 11},--19
    {x = -2034, y = -28, z = 12},--20
    {x = -1996, y = -179, z = 11},--21
    {x = 2351, y = 1989, z = 17},--22
    {x = 1371, y = 963, z = 14},--23
    {x = 1642, y = 1010, z = 14},--24
    {x = 1592, y = 1003, z = 14},--25
    {x = 1858, y = 2038, z = 16},--26
    {x = 445, y = 1171, z = 13},--27
    {x = 342, y = -1926, z = 42},--28
    {x = -1077, y = -1616, z = 49},--29
    {x = -777, y = 782, z = 15},--30
    {x = -141, y = 853, z = 13},--31
    {x = -116, y = 811, z = 13},--32
    {x = 148, y = 763, z = 13},--33
    {x = 355, y = 1360, z = 12},--34
    {x = -2239, y = 1965, z = 51},--35
    {x = -1966, y = -291, z = 22},--36
    {x = -2172, y = 311, z = 12},--37
    {x = -2229, y = 296, z = 12},--38
    {x = -2142, y = 250, z = 12},--39
    {x = -2065, y = 264, z = 11},--40
    {x = -2073, y = 175, z = 11},--41
    {x = -2167, y = 202, z = 13},--42
    {x = -2183, y = 247, z = 12},--43
    {x = 2490, y = 346, z = 32},--44
    {x = -2517, y = 181, z = 12},--45
    {x = -2217, y = 186, z = 11},--46
    {x = -2597, y = 109, z = 11},--47
    {x = -2408, y = 397, z = 11},--48
    {x = 2516, y = -188, z = 4},--49
    {x = 2043, y = 1396, z = 27},--50
    {x = 2554, y = -2188, z = 23},--51
    {x = 2325, y = -1814, z = 23},--52
    {x = 533, y = 329, z = 13},--53
    {x = 1133, y = 423, z = 13},--54
    {x = 412, y = 579, z = 13},--55
    {x = 181, y = 446, z = 12},--56
    {x = -285, y = 100, z = 14},--57
    {x = -458, y = 899, z = 12},--58
    {x = -44, y = 909, z = 13},--59
    {x = 1896, y = 1909, z = 14},--60
    {x = 1796, y = 2514, z = 16},--61
    {x = -218, y = 1024, z = 13},--62
    {x = -1885, y = 201, z = 12},--63
    {x = 1874, y = 1224, z = 34},--64
    {x = 158, y = 2022, z = 9},--65
    {x = -8, y = 1360, z = 13},--66
    {x = 1301, y = 2812, z = 13},--67
    {x = 1229.70, y = 1060.70, z = 49}--68
}

-- Основной бот
function bot_pumps()
    teleport(pumps[1].x, pumps[1].y, pumps[1].z)--2
    gg.sleep(3000)
    teleport(pumps[2].x, pumps[2].y, pumps[2].z)--2
    gg.sleep(3000)
    teleport(pumps[3].x, pumps[3].y, pumps[3].z)--3
    gg.sleep(3000)
    teleport(pumps[4].x, pumps[4].y, pumps[4].z)--4
    gg.sleep(3000)
    teleport(pumps[5].x, pumps[5].y, pumps[5].z)--5
    gg.sleep(3000)
    teleport(pumps[6].x, pumps[6].y, pumps[6].z)--6
    gg.sleep(3000)
    teleport(pumps[7].x, pumps[7].y, pumps[7].z)--7
    gg.sleep(3000)
    teleport(pumps[8].x, pumps[8].y, pumps[8].z)--8
    gg.sleep(3000)
    teleport(pumps[9].x, pumps[9].y, pumps[9].z)--9
    gg.sleep(3000)
    teleport(pumps[10].x, pumps[10].y, pumps[10].z)--10
    gg.sleep(3000)
    teleport(pumps[11].x, pumps[11].y, pumps[11].z)--11
    gg.sleep(3000)
    teleport(pumps[12].x, pumps[12].y, pumps[12].z)--12
    gg.sleep(3000)
    teleport(pumps[13].x, pumps[13].y, pumps[13].z)--13
    gg.sleep(3000)
    teleport(pumps[14].x, pumps[14].y, pumps[14].z)--14
    gg.sleep(3000)
    teleport(pumps[15].x, pumps[15].y, pumps[15].z)--15
    gg.sleep(3000)
    teleport(pumps[16].x, pumps[16].y, pumps[16].z)--16
    gg.sleep(3000)
    teleport(pumps[17].x, pumps[17].y, pumps[17].z)--17
    gg.sleep(3000)
    teleport(pumps[18].x, pumps[18].y, pumps[18].z)--18
    gg.sleep(3000)
    teleport(pumps[19].x, pumps[19].y, pumps[19].z)--19
    gg.sleep(3000)
    teleport(pumps[20].x, pumps[20].y, pumps[20].z)--20
    gg.sleep(3000)
    teleport(pumps[21].x, pumps[21].y, pumps[21].z)--21
    gg.sleep(3000)
    teleport(pumps[22].x, pumps[22].y, pumps[22].z)--22
    gg.sleep(3000)
    teleport(pumps[23].x, pumps[23].y, pumps[23].z)--23
    gg.sleep(3000)
    teleport(pumps[24].x, pumps[24].y, pumps[24].z)--24
    gg.sleep(3000)
    teleport(pumps[25].x, pumps[25].y, pumps[25].z)--25
    gg.sleep(3000)
    teleport(pumps[26].x, pumps[26].y, pumps[26].z)--26
    gg.sleep(3000)
    teleport(pumps[27].x, pumps[27].y, pumps[27].z)--27
    gg.sleep(3000)
    teleport(pumps[28].x, pumps[28].y, pumps[28].z)--28
    gg.sleep(3000)
    teleport(pumps[29].x, pumps[29].y, pumps[29].z)--29
    gg.sleep(3000)
    teleport(pumps[30].x, pumps[30].y, pumps[30].z)--30
    gg.sleep(3000)
    teleport(pumps[31].x, pumps[31].y, pumps[31].z)--31
    gg.sleep(3000)
    teleport(pumps[32].x, pumps[32].y, pumps[32].z)--32
    gg.sleep(3000)
    teleport(pumps[33].x, pumps[33].y, pumps[33].z)--33
    gg.sleep(3000)
    teleport(pumps[34].x, pumps[34].y, pumps[34].z)--34
    gg.sleep(3000)
    teleport(pumps[35].x, pumps[35].y, pumps[35].z)--35
    gg.sleep(3000)
    teleport(pumps[36].x, pumps[36].y, pumps[36].z)--36
    gg.sleep(3000)
    teleport(pumps[37].x, pumps[37].y, pumps[37].z)--37
    gg.sleep(3000)
    teleport(pumps[38].x, pumps[38].y, pumps[38].z)--38
    gg.sleep(3000)
    teleport(pumps[39].x, pumps[39].y, pumps[39].z)--39
    gg.sleep(3000)
    teleport(pumps[40].x, pumps[40].y, pumps[40].z)--40
    gg.sleep(3000)
    teleport(pumps[41].x, pumps[41].y, pumps[41].z)--41
    gg.sleep(3000)
    teleport(pumps[42].x, pumps[42].y, pumps[42].z)--42
    gg.sleep(3000)
    teleport(pumps[43].x, pumps[43].y, pumps[43].z)--43
    gg.sleep(3000)
    teleport(pumps[44].x, pumps[44].y, pumps[44].z)--44
    gg.sleep(3000)
    teleport(pumps[45].x, pumps[45].y, pumps[45].z)--45
    gg.sleep(3000)
    teleport(pumps[46].x, pumps[46].y, pumps[46].z)--46
    gg.sleep(3000)
    teleport(pumps[47].x, pumps[47].y, pumps[47].z)--47
    gg.sleep(3000)
    teleport(pumps[48].x, pumps[48].y, pumps[48].z)--48
    gg.sleep(3000)
    teleport(pumps[49].x, pumps[49].y, pumps[49].z)--49
    gg.sleep(3000)
    teleport(pumps[50].x, pumps[50].y, pumps[50].z)--50
    gg.sleep(3000)
    teleport(pumps[51].x, pumps[51].y, pumps[51].z)--51
    gg.sleep(3000)
    teleport(pumps[52].x, pumps[52].y, pumps[52].z)--52
    gg.sleep(3000)
    teleport(pumps[53].x, pumps[53].y, pumps[53].z)--53
    gg.sleep(3000)
    teleport(pumps[54].x, pumps[54].y, pumps[54].z)--54
    gg.sleep(3000)
    teleport(pumps[55].x, pumps[55].y, pumps[55].z)--55
    gg.sleep(3000)
    teleport(pumps[56].x, pumps[56].y, pumps[56].z)--56
    gg.sleep(3000)
    teleport(pumps[57].x, pumps[57].y, pumps[57].z)--57
    gg.sleep(3000)
    teleport(pumps[58].x, pumps[58].y, pumps[58].z)--58
    gg.sleep(3000)
    teleport(pumps[59].x, pumps[59].y, pumps[59].z)--59
    gg.sleep(3000)
    teleport(pumps[60].x, pumps[60].y, pumps[60].z)--60
    gg.sleep(3000)
    teleport(pumps[61].x, pumps[61].y, pumps[61].z)--61
    gg.sleep(3000)
    teleport(pumps[62].x, pumps[62].y, pumps[62].z)--62
    gg.sleep(3000)
    teleport(pumps[63].x, pumps[63].y, pumps[63].z)--63
    gg.sleep(3000)
    teleport(pumps[64].x, pumps[64].y, pumps[64].z)--64
    gg.sleep(3000)
    teleport(pumps[65].x, pumps[65].y, pumps[65].z)--65
    gg.sleep(3000)
    teleport(pumps[66].x, pumps[66].y, pumps[66].z)--66
    gg.sleep(3000)
    teleport(pumps[67].x, pumps[67].y, pumps[67].z)--67
    gg.sleep(3000)
    teleport(pumps[68].x, pumps[68].y, pumps[68].z)--68
    gg.sleep(5000)
    bot_pumps()
end

local candy = {
    {x = 1597, y = 984, z = 14}, --1
    {x = 1621, y = 991, z = 14},--2  
    {x = 1615, y = 1013, z = 14},--3
    {x = 1605, y = 1061, z = 14},--4
    {x = 1620, y = 1044, z = 14},--5
    {x = 1599, y = 1075, z = 14},--6
    {x = 1560, y = 1062, z = 14},--7
    {x = 1595, y = 1065, z = 18},--8
    {x = 1636, y = 1069, z = 18},--9
    {x = 1648, y = 1073, z = 20},--10
    {x = 1655, y = 1070, z = 14},--11
    {x = 1642, y = 1036, z = 14},--12
    {x = 1676, y = 1057, z = 17},--13
    {x = 1693, y = 996, z = 14},--14
    {x = 1711, y = 977, z = 14},--15
    {x = 1671, y = 962, z = 14},--16
    {x = 1688, y = 973, z = 16},--17
    {x = 1643, y = 1002, z = 19},--18
    {x = 1669, y = 1016, z = 13},--19
    {x = 1645, y = 989, z = 14},--20
    {x = 1620, y = 961, z = 14},--21
    {x = 1636, y = 1013, z = 14},--22
    {x = 1685, y = 1026, z = 14},--23
    {x = 1643, y = 1088, z = 14},--24
    {x = 1669, y = 1085, z = 14},--25
    {x = 1593, y = 1043, z = 14}--26   
}

-- Основной бот
function bot_candy()
    teleport(candy[1].x, candy[1].y, candy[1].z)--1
    gg.sleep(2000)
    teleport(candy[2].x, candy[2].y, candy[2].z)--2
    gg.sleep(2000)
    teleport(candy[3].x, candy[3].y, candy[3].z)--3
    gg.sleep(2000)
    teleport(candy[4].x, candy[4].y, candy[4].z)--4
    gg.sleep(2000)
    teleport(candy[5].x, candy[5].y, candy[5].z)--5
    gg.sleep(2000)
    teleport(candy[6].x, candy[6].y, candy[6].z)--6
    gg.sleep(2000)
    teleport(candy[7].x, candy[7].y, candy[7].z)--7
    gg.sleep(2000)
    teleport(candy[8].x, candy[8].y, candy[8].z)--8
    gg.sleep(2000)
    teleport(candy[9].x, candy[9].y, candy[9].z)--9
    gg.sleep(2000)
    teleport(candy[10].x, candy[10].y, candy[10].z)--10
    gg.sleep(2000)
    teleport(candy[11].x, candy[11].y, candy[11].z)--11
    gg.sleep(2000)
    teleport(candy[12].x, candy[12].y, candy[12].z)--12
    gg.sleep(2000)
    teleport(candy[13].x, candy[13].y, candy[13].z)--13
    gg.sleep(2000)
    teleport(candy[14].x, candy[14].y, candy[14].z)--14
    gg.sleep(2000)
    teleport(candy[15].x, candy[15].y, candy[15].z)--15
    gg.sleep(2000)
    teleport(candy[16].x, candy[16].y, candy[16].z)--16
    gg.sleep(2000)
    teleport(candy[17].x, candy[17].y, candy[17].z)--17
    gg.sleep(2000)
    teleport(candy[18].x, candy[18].y, candy[18].z)--18
    gg.sleep(2000)
    teleport(candy[19].x, candy[19].y, candy[19].z)--19
    gg.sleep(2000)
    teleport(candy[20].x, candy[20].y, candy[20].z)--20
    gg.sleep(2000)
    teleport(candy[21].x, candy[21].y, candy[21].z)--21
    gg.sleep(2000)
    teleport(candy[22].x, candy[22].y, candy[22].z)--22
    gg.sleep(2000)
    teleport(candy[23].x, candy[23].y, candy[23].z)--23
    gg.sleep(2000)
    teleport(candy[24].x, candy[24].y, candy[24].z)--24
    gg.sleep(2000)
    teleport(candy[25].x, candy[25].y, candy[25].z)--25
    gg.sleep(2000)
    teleport(candy[26].x, candy[26].y, candy[26].z)--26
    gg.sleep(2000)
    bot_candy() 
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
    gg.toast(_T("waiting"))
    gg.sleep(20000)
    teleport(sequence[3].x, sequence[3].y, sequence[3].z)
    gg.sleep(500)
    teleport(sequence[4].x, sequence[4].y, sequence[4].z)
    gg.sleep(500)
    bot_Neftezavod()
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

        gg.toast(_T("teleport_to") .. location.name .. " (X: " .. x .. ", Y: " .. y .. ", Z: " .. z .. ")")
        gg.sleep(1000)
        gg.toast(_T("Teleporter_completed"))
        mainMenu()
    else
        teleport()
    end
end

function teleportManualCar()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        gg.alert(_T("save_coordinates"))
        return
    end
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        local input = gg.prompt({_T("Enter_x"), _T("Enter_y"), _T("Enter_z")},
            {savedValues[1].value, savedValues[2].value, savedValues[3].value},
            {"number", "number", "number"})

        if input then
            savedValues[1].value = input[1]
            savedValues[2].value = input[2]
            savedValues[3].value = input[3]

            gg.setValues(savedValues)
            gg.toast(_T("teleportation_completed"))
            mainMenu()
        else
            gg.toast(_T("teleporter_canceled"))
            teleport()
        end
    else
        teleportCar()
    end
end

function teleportCar()
    gg.setVisible(false)
    local choice = gg.choice({
        _T("New"), 
        _T("Old"),
        _T("teleport_save"), 
        _T("teleport_teleport_cords"), 
        _T("teleport_teleport_met"), 
        _T("teleport_teleport_checkpoint"), 
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

    if choice == 1 then
        local result = findSmartCarCoords()
        if result then
            processSmartCarValues(result)
        end
    elseif choice == 2 then
        local cands = findCoordsOld()
        if cands then
            local filtered = twoChecksOld(cands)
            if filtered then
                processValuesOld(filtered)
            end
        end
    elseif choice == 3 then
        userSavedPointsMenucar() 
    elseif choice == 4 then
        teleportManualCar()
    elseif choice == 5 then
        teleportToMarkerCar()
    elseif choice == 6 then
        teleportToCheckpointCar()
    elseif choice == 7 or choice == nil then
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
    gg.toast(_T("activated"))
end 

function bax2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1000.0234765", gg.TYPE_FLOAT)
    revert = gg.getResults(1000)
    gg.editAll("250.0", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast(_T("Deactivated"))
end

local hpFrozen = false
local savedItems = {}

function toggleFreezeCarHP()
    gg.toast("используйте эту функцию когда у машины 100хп")
    gg.sleep(500)
    gg.clearResults()
    if not hpFrozen then
        gg.setRanges(gg.REGION_OTGER)
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
            gg.toast(_T("activated"))
        else
            gg.toast(_T("No_value_found"))
        end

        gg.clearResults()
    else
        for i = 1, #savedItems do
            savedItems[i].freeze = false
        end
        gg.setValues(savedItems)
        gg.removeListItems(savedItems)
        savedItems = {}
        hpFrozen = false
        gg.toast(_T("Deactivated"))
    end
end

function toggleFreezeAirHP()
    gg.clearResults()
    if not hpFrozen then
        gg.setRanges(gg.REGION_OTHER)
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
                    value = 12000,
                    freeze = true
                })
            end

            gg.setValues(setList)
            gg.addListItems(setList)
            savedItems = setList
            hpFrozen = true
        end
        gg.clearResults()
    end
end


local teleportCategories = {
    ["1.Работы"] = {
        {name = "Нефтезавод (Начальная работа)", x = -823, y = 765 , z = 13},
        {name = "Лесопилка (Начальная работа) ", x = 2728 , y = -1695, z = 23},
        {name = "Мебельный завод (Начальная работа)", x = 2321, y = 2031, z = 16},
        {name = "Водитель автобуса", x = -483, y = 882, z = 12},
        {name = "Доставщик еды", x = 257, y = 1725, z = 8},
        {name = "Шахта", x = -1364, y = 2644 , z = 40},
        {name = "Станция механиков", x = 390, y = 807, z = 12},
        {name = "Водитель мусаровоза", x = 1757, y = 2239, z = 16},
        {name = "Инкасация", x = -2081, y = 1928, z = 52},
        {name = "Угонщик транспортных средств", x = 2163, y = -1856, z = 20},
        {name = "Дайвер", x = 2427, y = 241, z = 5},        
    },
    ["2.Общественные места"] = {
        {name = "Автошкола", x = -508, y = 64, z = 13},
        {name = "Военкомат", x = 1916, y = 2302, z = 16},
        {name = "Москва сити", x = -221, y = 101, z = 13},
        {name = "Автовокзал Батырево", x = 1814, y = 2514, z = 15},
        {name = "Автовокзал Арзамас", x = -476, y = 913, z = 12},
        {name = "Парк Арзамас", x = -47, y = 914, z = 12},
        {name = "Церковь", x = 1879, y = 1168, z = 30},
        {name = "Причал", x = -449, y = -45, z = 2},
        {name = "Авиашкола", x = -558, y = 39, z = 14},
    },
    ["3.Автосалоны"] = {
        {name = "АвтоХаус", x = 430, y = 1173, z = 12},
        {name = "АрзамасКарс", x = 455, y = 2200, z = 12},
        {name = "Автодвор", x = 2324, y = -1804, z = 22},
        {name = "МотоСтайл", x = -1691, y = 1733, z = 48},
        {name = "Авиа-рынок", x = -1117, y = -1326, z = 48},
        {name = "Авторынок", x = 2424, y = -1832, z = 22},
        {name = "Паркинг Арзамас", x = -429, y = 674, z = 12},
        {name = "Паркинг Южный", x = 2215, y = -1969, z = 21},
    },
    ["4.Государственные организации"] = {
        {name = "Правительство", x = -120, y = 788, z = 12},
        {name = "ФСБ", x = 524, y = 330, z = 12},
        {name = "Армия", x = 1901, y = 1730, z = 16},
        {name = "МВД Арзамас", x = 141, y = 1265, z = 12},
        {name = "ГИБДД Южный", x = 2581, y = -2416, z = 22},
        {name = "МЧС России", x = 1811, y = 2091, z = 16},
        {name = "Больница Арзамас", x = 405, y = 1762, z = 12},
        {name = "Больница Южный", x = 2112, y = -2385, z = 23},
        {name = "РГТРК Останкино", x = 2127, y = -1939, z = 21},
        {name = "ТРК Ритм", x = -308, y = 659, z = 12},
    },
    ["5.Криминальные структуры"] = {
             {name = "Тамбовская ОПГ", x = 153, y = 447, z = 11},
             {name = "Острые Козырьки", x = 2431, y = -1927, z = 22},
             {name = "Измайловская ОПГ ", x = 1798, y = 2195, z = 16},
             {name = "Реальные пацаны", x = 385, y = 1955, z = 8},
             {name = "Притон", x = 1937, y = 2086, z = 16},
             {name = "Чёрный рынок", x = 2327, y = -246, z = 4},
             {name = "Тюрьма", x = -1717, y = -2820, z = 15}, 
    },
    ["6.Банки"] = {
        {name = "Банк.А", x = 361, y = 1367, z = 12},
        {name = "Банк.Ю", x = 2376, y = -2140, z = 23},
        {name = "Банк.Б", x = 1850, y = 2037, z = 17}, 
        {name = "Банк.Л", x = -2081, y = 1928, z = 52},
        {name = "Печатный Двор", x = -2585, y = 2835, z = 2},
    },
    ["7.Отели"] = {
        {name = "Отель бюджетного класса", x = 179, y = 491, z = 13},
        {name = "Отель элитного класса", x = -220, y = 100, z = 13},
        {name = "Отель среднего класса", x = 2089, y = -2283, z = 25},
        {name = "Отель бюджетного класса", x = -2249, y = 1999, z = 50},
    },
    ["8.Транспортные компании"] = {
        {name = "ТК Гарель", x = 2199, y = -874, z = 14},
        {name = "ТК Батырево", x = 1847, y = 2907, z = 13},
        {name = "ТК Лыткарино", x = -2499, y = -78, z = 14},
    },
    ["9.Станции Технического Обслуживания"] = {
        {name = "СТО", x = 2053, y = 1887, z = 16},
        {name = "Шономонтаж", x = 2182, y = -1836, z = 21},
        {name = "Сталинг-центр", x = 397, y = 795, z = 12},
        {name = "Тюнинг-центр", x = -2, y = 639, z = 12},
    },
    ["10.Развлечения"] = {
        {name = "Дуэли", x = 1605, y = 1001, z = 14},
        {name = "Клуб", x = 2555, y = -2204, z = 23},
        {name = "Казино", x = 1458, y = 2641, z = 13},
        {name = "Зоопарк", x = - 1776, y = 1283, z = 48},
        {name = "Игровой центр", x = -2121, y = 2057, z = 51.0},
        {name = "Подземелье", x = -2685, y = 2768, z = 2},
        {name = "Битва за контейнеры (ВЧ)", x = 1994, y = 1399, z = 26},
        {name = "Битва за контейнеры (ЗЗ)", x = 339, y = -1903, z = 42},
        {name = "Аукцион контейнеров", x = 802, y = 1796, z = 10},
        {name = "Заповедник", x = -2520, y = -2257, z = 19},
        {name = "Пирс (Рыбалка)", x = 2426, y = 231, z = 5},
    },
    ["11.Бизнесы"] = {
        ["1.АЗС"] = {
           {name = "Заправка 7", x = -420, y = 925, z = 12},
           {name = "Заправка 12", x = 755, y = 2562, z = 12},           
           {name = "Заправка 16", x = 1994, y = 1927, z = 16},           
           {name = "Заправка 22", x = 2296, y = -743, z = 13},           
           {name = "Заправка 25", x = 2320, y = -1729, z = 23},           
           {name = "Заправка 29", x = -588, y = -1894, z = 41},           
           {name = "Заправка 33", x = -2689, y = 4, z = 11},
           {name = "Заправка 52", x = 709, y = 780, z = 12},           
           {name = "Заправка 58", x = -2770, y = 1886, z = 4},          
           {name = "Заправка 61", x = -2445, y = 2785, z = 2},          
           {name = "Заправка 73", x = 133, y = -1105, z = 41},
        }, 
        ["2.Магазины одежды"] = {
           {name = "Магазин одежды 3", x = 203, y = 825, z = 13},
           {name = "Магазин одежды 19", x = 1859, y = 2250, z = 16},
           {name = "Магазин одежды 36", x = 2257, y = -2100, z = 22},
           {name = "Магазин одежды 45", x = -2088, y = 1853, z = 52},
        },
        ["3.Магазины аксессуаров"] = {
           {name = "Магазин аксессуаров 4", x = 218, y = 862, z = 14},  
           {name = "Магазин аксессуаров 37", x = 2409, y = -2143, z = 22},
           {name = "Магазин аксессуаров 76", x = 1945, y = 2065, z = 16},
           {name = "Магазин аксессуаров 77", x = -1991, y = 1645, z = 45},
        },
        ["4.Магазины оружия"] = {
           {name = "Магазин оружия 2", x = 209, y = 826, z = 13},
           {name = "Магазин оружия 34", x = 2349, y = -2142, z = 22},
           {name = "Магазин оружия 42", x = 1977, y = 1893, z = 16},
           {name = "Магазин оружия 63", x = -2459, y = 2722, z = 2},
        },
        ["5.Магазины 24/7"] = {
           {name = "Магазин 24/7 1", x = 153, y = 776, z = 12},
           {name = "Магазин 24/7 6", x = -421, y = 911, z = 12},
           {name = "Магазин 24/7 8", x = -362, y = 1024, z = 13},
           {name = "Магазин 24/7 9", x = 16, y = 917, z = 12},
           {name = "Магазин 24/7 10", x = 305, y = 1666, z = 8},
           {name = "Магазин 24/7 11", x = 750, y = 2572, z = 12},
           {name = "Магазин 24/7 13", x = 1804, y = 2506, z = 16},
           {name = "Магазин 24/7 15", x = 1994, y = 1937, z = 16},
           {name = "Магазин 24/7 17", x = 1918, y = 2093, z = 16},
           {name = "Магазин 24/7 18", x = 1854, y = 2245, z = 16},
           {name = "Магазин 24/7 21", x = 2292, y = -734, z = 13},
           {name = "Магазин 24/7 23", x = 2475, y = -729, z = 13},
           {name = "Магазин 24/7 24", x = 2304, y = -1728, z = 23},
           {name = "Магазин 24/7 28", x = -579, y = -1896, z = 41},
           {name = "Магазин 24/7 30", x = -200, y = -1376, z = 41},
           {name = "Магазин 24/7 32", x = 2698, y = 5, z = 11},
           {name = "Магазин 24/7 35", x = 2258, y = -2106, z = 22},
           {name = "Магазин 24/7 43", x = -2144, y = 2045, z = 50},
           {name = "Магазин 24/7 49", x = 2281, y = -2377, z = 22},
           {name = "Магазин 24/7 51", x = 700, y = 784, z = 12},
           {name = "Магазин 24/7 59", x = -2765, y = 1896, z = 4},
           {name = "Магазин 24/7 60", x = -2444, y = 2795, z = 2},
           {name = "Магазин 24/7 69", x = -2117, y = -159, z = 27},
           {name = "Магазин 24/7 72", x = 123, y = -1107, z = 41},
           {name = "Магазин 24/7 75", x = -1727, y = -1234, z = 42},
        },
        ["6.Закусочные"] = {
           {name = "Закусачная: 5", x = 174, y = 737, z = 12}, 
           {name = "Закусачная 14", x = 1952, y = 1905, z = 15},
           {name = "Закусачная 20", x = 1860, y = 2270, z = 15},
           {name = "Закусачная 31", x = -379, y = -1824, z = 49},
           {name = "Закусачная 44", x = -2065, y = 1984, z = 50},
           {name = "Закусачная 53", x = 2307, y = -1911, z = 22},
           {name = "Закусачная 68", x = -2445, y = 2722, z = 2},
           {name = "закусачная 74", x = -613.219788, y = -1293.424683, z = 47.567101},
        },
        ["7.Лавка чародея"] = {
                {name = "Лавка чародея", x = -2651, y = 2837, z = 2},
        },
        ["8.Магазины электроники"] = {
            {name = "DNS", x = 166, y = 719, z = 13},
            {name = "Эльдорадо", x = -2196, y = 1935, z = 50},
            {name = "ДНС", x = 1919, y = 2042, z = 16},
        },
        ["9.Центральный рынок"] = {
            {name = "Центральный рынок", x = -2535, y = 2757, z = 2},
        },
        ["10.Приют питомцев"] = {
            {name = "Приют питомцев", x = 322, y = 776, z = 12},
        },
        ["11.Рыбатская лавка"] = {
            {name = "Рыбатская лавка", x = 2251, y = 1369, z = 12},
        },
        ["12.Магазины дайвинга"] = {
            {name = "Магазин дайвинга Кит", x = -2043, y = 1104, z = 4},
            {name = "Магазин дайвинга Ракушка", x = 2364, y = -2598, z = 23},
        }
    },
    ["12.Тепличный комплекс"] = {
        {name = "Магазин Сад-Город", x = 1207, y = -574, z = 41},
        {name = "Магазин древесины", x = 2708, y = -1679, z = 23},
        {name = "Магазин стекла", x = 2322, y = 2031, z = 16},
        {name = "Магазин арматуры", x = -1372, y = 2648, z = 40},
        {name = "Оптовый магазин Гарель", x = 2219, y = -891, z = 14},
        {name = "Оптовый магазин Батврево", x = 1867, y = 2891, z = 13},
        {name = "Оптовый магазин Лыткарино", x = -2517, y = -62, z = 14},
    },
    ["13.Фермерский комплекс"] = {
       ["1.Ферма для сбора сена"] = {
         {name = "Рога и перья", x = -1554, y = -1277, z = 42},   
         {name = "Рога и копыта", x = 1381, y = 977, z = 13},
       },
       ["2.Анашан"] = {
         {name = "Анашан", x = 2451, y = -649, z = 13},
       },
       ["3.Тайга для сбора древесины"] = {
                 {name = "Тайга для сбора древесины", x = -2544, y = -2041, z = 19},
       },
       ["4.Мебельный завод"] = {
                 {name = "Мебельный завод", x = 2303, y = 2005, z = 16},
       }
    },
    ["14.Офис авиакомпаний"] = {
         {name = "Офис авиакомпаний", x = -1098, y = -1641, z = 48},
    },
}
local teleportCategoryOrder = {
    "1.Работы",
    "2.Общественные места",
    "3.Автосалоны",
    "4.Государственные организации",
    "5.Криминальные структуры",
    "6.Банки",
    "7.Отели",
    "8.Транспортные компании",
    "9.Станции Технического Обслуживания",
    "10.Развлечения",
    "11.Бизнесы",
    "12.Тепличный комплекс",
    "13.Фермерский комплекс",
    "14.Офис авиакомпаний"
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

function findAndSaveCoords(noMenu)
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(3)

    if #results > 0 then
        local baseAddr = results[1].address
        
        local x_item = {
            address = baseAddr + (15 * 8), 
            flags = gg.TYPE_FLOAT, 
            value = 0,
            name = "y",
            freeze = false
        }
        
        local y_item = {
            address = baseAddr + (15.5 * 8), 
            flags = gg.TYPE_FLOAT, 
            value = 0,
            name = "z", 
            freeze = false
        }
        
        local z_item = {
            address = baseAddr + (14.5 * 8), 
            flags = gg.TYPE_FLOAT, 
            value = 0,
            name = "x",
            freeze = false
        }
        
        local current_values = gg.getValues({x_item, y_item, z_item})
        x_item.value = current_values[1].value
        y_item.value = current_values[2].value  
        z_item.value = current_values[3].value
        gg.addListItems({x_item, y_item, z_item})
        gg.toast(_T("coordinates_saved"))
        if noMenu then
            return
        else
            teleport()
        end
    else
        gg.toast(_T("No_value_found"))
        if not noMenu then
            teleport()
        end
    end

    gg.clearResults()
end

function teleportManual()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "x" then savedX = v end
        if v.name == "y" then savedY = v end
        if v.name == "z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        findAndSaveCoords(true)
    end
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        local input = gg.prompt({_T("Enter_x"), _T("Enter_y"), _T("Enter_z")},
            {savedValues[1].value, savedValues[2].value, savedValues[3].value},
            {"number", "number", "number"})

        if input then
            savedValues[1].value = input[1]
            savedValues[2].value = input[2]
            savedValues[3].value = input[3]

            gg.setValues(savedValues)
            gg.toast(_T("Teleporter_completed"))
            mainMenu()
        else
            gg.toast(_T("teleporter_canceled"))
            teleport()
        end
    else
        teleport()
    end
end

function selectTeleportCategory()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "x" then savedX = v end
        if v.name == "y" then savedY = v end
        if v.name == "z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        findAndSaveCoords(true)
    end
    
    -- СОЗДАЕМ СПИСОК ПЕРЕВОДОВ СПЕЦИАЛЬНО ДЛЯ МЕНЮ
    local displayNames = {
        _T("Point1"), _T("Point2"), _T("Point3"), _T("Point4"),
        _T("Point5"), _T("Point6"), _T("Point7"), _T("Point8"),
        _T("Point9"), _T("Point10"), _T("Point11"), _T("Point12"),
        _T("Point13"), _T("Point14")
    }

    -- Показываем пользователю переведенные названия
    local choice = gg.choice(displayNames, nil, _T("choose_catagoria"))
    
    if choice then
        -- Но для логики берем оригинальное русское название из старой таблицы!
        local selectedCategory = teleportCategoryOrder[choice]

        if selectedCategory == "11.Бизнесы" or selectedCategory == "13.Фермерский комплекс" then
            -- ... (дальше твой код идет без изменений)
            local sortedSubcategories = {}

            
            for subcat, _ in pairs(teleportCategories[selectedCategory]) do
                table.insert(sortedSubcategories, subcat)
            end

            
            table.sort(sortedSubcategories, function(a, b)
                local numA = tonumber(a:match("^(%d+)"))  
                local numB = tonumber(b:match("^(%d+)"))  
                return numA < numB  
            end)

            local choiceSubcategory = gg.choice(sortedSubcategories, nil, _T("select_category"))
            if choiceSubcategory then
                local selectedSubcategory = sortedSubcategories[choiceSubcategory]
                selectTeleportLocation(selectedCategory, selectedSubcategory)
            else
                gg.toast(_T("not_category"))
            end
        else
            selectTeleportLocation(selectedCategory)
        end
    else
        gg.toast(_T("not_category2"))
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

    local choiceLocation = gg.choice(locationNames, nil, _T("choose_location"))
    if choiceLocation then
        local selectedLocation = locations[choiceLocation]
        teleportToLocation(selectedLocation)
    else
        gg.toast(_T("not_location"))
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
        gg.toast(_T("teleportation_completed"))
        mainMenu()
    else
        gg.toast(_T("no_coordinates"))
        teleport()
    end
end
function userSavedPointsMenucar()
    
    local options = {_T("save_point"), _T("teleport_point"), _T("back")}
    local choice = gg.choice(options, nil, _T("saved_points"))

    if choice == 1 then
        saveCurrentPoint()
    elseif choice == 2 then
        chooseSavedPointcar()
    else
        teleportCar()
    end
end

function userSavedPointsMenu()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "x" then savedX = v end
        if v.name == "y" then savedY = v end
        if v.name == "z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        findAndSaveCoords(true)
    end
    local options = {_T("save_point"), _T("teleport_point"), _T("back")}
    local choice = gg.choice(options, nil, _T("saved_points"))

    if choice == 1 then
        saveCurrentPoint()
    elseif choice == 2 then
        chooseSavedPoint()
    else
        teleport()
    end
end

function saveCurrentPoint()
    loadSavedPoints()
    local values = gg.getListItems()
    if #values < 3 then
        gg.toast(_T("find_coordinates"))
        return teleport()
    end

    local input = gg.prompt({_T("point_name")}, nil, {"text"})
    if input and input[1] ~= "" then
        savedPoints[input[1]] = {
            x = values[1].value,
            y = values[2].value,
            z = values[3].value
        }
        savePointsToFile()
        gg.toast(_T("the_saved"))
    else
        gg.toast(_T("mark_save"))
    end
    teleport()
end

function chooseSavedPoint()
    loadSavedPoints()
    if next(savedPoints) == nil then
        gg.toast(_T("No_saved_points"))
        return mainMenu()
    end

    local names = {}
    for name in pairs(savedPoints) do
        table.insert(names, name)
    end

    table.sort(names)
    local choice = gg.choice(names, nil, _T("select_point"))
    if choice then
        local point = savedPoints[names[choice]]
        applyTeleport(point.x, point.y, point.z)
    else
        gg.toast(_T("selected"))
        teleport()
    end
end

function applyTeleportCar(x_val, y_val, z_val)
    local list = gg.getListItems()
    local toUpdate = {}

    for i, v in ipairs(list) do
        -- Проверяем имя каждого элемента в списке
        if v.name == "Car_X" then
            v.value = x_val
            table.insert(toUpdate, v)
        elseif v.name == "Car_Y" then
            v.value = y_val
            table.insert(toUpdate, v)
        elseif v.name == "Car_Z" then
            v.value = z_val
            table.insert(toUpdate, v)
        end
    end

    if #toUpdate > 0 then
        gg.setValues(toUpdate)
    else
        gg.toast(_T("No_coordinates"))
    end
end

function chooseSavedPointcar()
    loadSavedPoints()
    if next(savedPoints) == nil then
        gg.toast(_T("No_saved_points"))
        return mainMenu()
    end

    local names = {}
    for name in pairs(savedPoints) do
        table.insert(names, name)
    end

    table.sort(names)
    local choice = gg.choice(names, nil, _T("select_point"))
    
    if choice then
        local point = savedPoints[names[choice]]
        applyTeleportCar(0, 0, 0)
        gg.sleep(3500) 
        applyTeleportCar(point.z, point.y, point.x)
    else
        gg.toast(_T("selected"))
    end
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

        gg.toast(_T("teleport_to") .. location.name .. " (X: " .. x .. ", Y: " .. y .. ", Z: " .. z .. ")")
        gg.sleep(1000)
        gg.toast(_T("Teleporter_completed"))
        mainMenu()
    else
        gg.toast(_T("no_coordinates"))
        teleport()
    end
end

--new

local isActive = false
local originalValues = {}
local customValue = 1000000.0

function nameTags()
    if isActive then
        if #originalValues > 0 then
            gg.setValues(originalValues)
            originalValues = {}
        end
        gg.toast(_T("Deactivated"))
        isActive = false
        return
    end

    local valueInput = gg.prompt({
        _T("installation_value")
    }, {
        tostring(customValue)
    }, {"number"})

    if not valueInput then
        gg.toast(_T("Cancelled"))
        return
    end
    customValue = tonumber(valueInput[1]) or customValue
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("1.08978982e-41", gg.TYPE_FLOAT)
    local results = gg.getResults(10000)

    if #results == 0 then
        gg.toast(_T("No_value_found"))
        return
    end

    local offset = 1.5 * 8
    local modifications = {}
    originalValues = {}
    local changedCount = 0

    for i, result in ipairs(results) do
        local targetAddress = result.address + offset
        local targetData = gg.getValues({
            {address = targetAddress, flags = gg.TYPE_FLOAT}
        })[1]
        if targetData.value == 15 then
            table.insert(originalValues, {
                address = targetAddress,
                value = 15.0,
                flags = gg.TYPE_FLOAT
            })
            
            table.insert(modifications, {
                address = targetAddress,
                value = customValue,
                flags = gg.TYPE_FLOAT
            })
            changedCount = changedCount + 1
        end
    end

    if changedCount > 0 then
        gg.setValues(modifications)
        gg.toast(_T("activated"))
        isActive = true
    else
        gg.toast(_T("No_value_found"))
        originalValues = {}
    end
end

local minePoints = {
    {x = -726.88, y = -2738.85, z = -24.92},   
    {x = -731.56, y = -2743.46, z = -25.17},   
    {x = -770.80, y = -2742.86, z = -22.25},   
    {x = -751.50, y = -2778.73, z = -19.90},
    {x = -756.84, y = -2779.91, z = -19.90},
    {x = -1446.21, y = 2580.12, z = 40.80},
}

function bot_main()
    findAndSaveCoords(true) 
    gg.sleep(500)
    local savedValues = gg.getListItems()
    
    if #savedValues < 3 then
        return
    end
    local coords = {}
    for i, v in ipairs(savedValues) do
        if v.name == "x" then coords.x = v end
        if v.name == "y" then coords.y = v end  
        if v.name == "z" then coords.z = v end
    end
    
    if not (coords.x and coords.y and coords.z) then
        return
    end
    
    gg.toast(_T("activated"))
    
    local minePoint = 1
    
    while true do
        local point = minePoints[minePoint]
        coords.x.value = point.x
        coords.y.value = point.y  
        coords.z.value = point.z
        gg.setValues({coords.x, coords.y, coords.z})
        minePoint = minePoint + 1
        if minePoint > #minePoints then
            minePoint = 1
        end
        gg.sleep(5000)
        if gg.isVisible(true) then
            gg.setVisible(false)
            gg.toast(_T("bot_stopped"))
            break
        end
    end
end

function searchAndChangeHitboxes()
    local searchValue = 1042536202      -- исходное значение (DWORD)
    local changeValue = 7.333333        -- значение увеличения (FLOAT)
    local delay = 3000                  -- задержка в мс

    local input = gg.prompt(
        {
            "Значение для увеличения:",
            _T("Latency")
        },
        {
            tostring(changeValue),
            tostring(delay / 1000)
        },
        {
            "number",
            "number"
        }
    )

    if not input then
        gg.toast(_T("Cancelled"))
        return
    end

    changeValue = tonumber(input[1]) or changeValue
    delay = (tonumber(input[2]) or 3) * 1000

    -- Android 14+: расширенный диапазон
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_OTHER)
    gg.setVisible(false)

    local fs_active = true
    local totalChanged = 0

    gg.toast(_T("Searching_hitboxes"))

    while fs_active do
        gg.searchNumber(searchValue, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)

        local results = gg.getResults(200)
        if #results > 0 then
            for i, v in ipairs(results) do
                v.value = changeValue
                v.flags = gg.TYPE_FLOAT
            end

            gg.setValues(results)
            totalChanged = totalChanged + #results
        end

        gg.clearResults()
        gg.sleep(delay)

        if gg.isVisible() then
            gg.setVisible(false)

            local choice = gg.alert(
                "Hitbox Finder\n\n" ..
                _T("Current_Value") .. changeValue .. "\n" ..
                _T("Changed_adrosov") .. totalChanged,
                _T("Continue"), 
                _T("Change_Value"), 
                _T("Stop")
            )

            if choice == 2 then
                local newInput = gg.prompt(
                    {_T("New_Value")},
                    {tostring(changeValue)},
                    {"number"}
                )
                if newInput then
                    changeValue = tonumber(newInput[1]) or changeValue
                    gg.toast(_T("New_Value") .. changeValue)
                end
            elseif choice == 3 then
                fs_active = false
                gg.toast(_T("Script_stopped"))
            end
        end
    end
end

local fs_active = false
local ORIGINAL = "4539628425391341620"
local BOOSTED  = "4539628427538825268"

function FastScooterToggle()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(bit32.bor(gg.REGION_C_ALLOC, gg.REGION_OTHER))

    if not fs_active then
        gg.searchNumber(ORIGINAL, gg.TYPE_QWORD)
        local r = gg.getResults(10)

        if #r == 0 then
            gg.toast(_T("No_value_found"))
            return
        end

        gg.editAll(BOOSTED, gg.TYPE_QWORD)
        gg.clearResults()

        fs_active = true
        gg.toast(_T("activated"))

    else
        gg.searchNumber(BOOSTED, gg.TYPE_QWORD)
        local r = gg.getResults(10)

        if #r == 0 then
            gg.toast(_T("No_value_found"))
        end

        gg.editAll(ORIGINAL, gg.TYPE_QWORD)
        gg.clearResults()

        fs_active = false
        gg.toast(_T("Deactivated"))
    end
end

--бот нефте
local mainPoint = { -803.948120, 779.632568, 13.102301 }
local sidePoints = {
    { -789.562561, 779.015381, 13.102301 },
    { -806.212463, 790.878296, 13.102301 },
    { -789.562256, 785.196472, 13.102301 },
}

local steps = 350
local delay = 10


function bot_Neftezavod()
    math.randomseed(os.time())
    findAndSaveCoords(true) 
    local list = gg.getListItems()
    local tbl  = {}
    for _, v in ipairs(list) do
        if     v.name == "x" then tbl[1] = v
        elseif v.name == "y" then tbl[2] = v
        elseif v.name == "z" then tbl[3] = v
        end
    end
    if #tbl ~= 3 then
        return
    end
    while true do
        gotoPoint(tbl, mainPoint)
        gg.toast(_T("point_reached"))
        gg.sleep(5000)
        local randomIdx = math.random(1, #sidePoints)
        local target    = sidePoints[randomIdx]
        gotoPoint(tbl, target)
        gg.toast(_T("point2_reached"))
        gg.sleep(2000)
    end
end

function gotoPoint(tbl, point)
    local tx, ty, tz = point[1], point[2], point[3]
    local sx, sy, sz = tbl[1].value, tbl[2].value, tbl[3].value

    local dx = (tx - sx) / steps
    local dy = (ty - sy) / steps
    local dz = (tz - sz) / steps

    for i = 1, steps do
        tbl[1].value = sx + dx * i
        tbl[2].value = sy + dy * i
        tbl[3].value = sz + dz * i
        gg.setValues(tbl)
        gg.sleep(delay)
    end
end

--бот завола
local mainPoint2 = { 660.644165, 1312.790894, 1746.433960 }
local sidePoints2 = {
    { 647.613525, 1313.033325, 1746.433960 },
    { 647.672913, 1310.464478, 1746.433960 },
    { 647.493164, 1308.049683, 1746.433960 },
}

local steps2 = 350
local delay2 = 10

function bot_factory()
    math.randomseed(os.time())
    findAndSaveCoords(true) 
    local list2 = gg.getListItems()
    local tbl2  = {}
    for _, v in ipairs(list2) do
        if     v.name == "x" then tbl2[1] = v
        elseif v.name == "y" then tbl2[2] = v
        elseif v.name == "z" then tbl2[3] = v
        end
    end
    if #tbl2 ~= 3 then
        return
    end
    while true do
        gotoPoint2(tbl2, mainPoint2)
        gg.toast(_T("point2_reached"))
        gg.sleep(2000)
        local randomIdx2 = math.random(1, #sidePoints2)
        local target2    = sidePoints2[randomIdx2]
        gotoPoint2(tbl2, target2)
        gg.toast(_T("point_reached"))
        gg.sleep(5000)
    end
end

function gotoPoint2(tbl2, point2)
    local tx2, ty2, tz2 = point2[1], point2[2], point2[3]
    local sx2, sy2, sz2 = tbl2[1].value, tbl2[2].value, tbl2[3].value

    local dx2 = (tx2 - sx2) / steps2
    local dy2 = (ty2 - sy2) / steps2
    local dz2 = (tz2 - sz2) / steps2

    for i = 1, steps2 do
        tbl2[1].value = sx2 + dx2 * i
        tbl2[2].value = sy2 + dy2 * i
        tbl2[3].value = sz2 + dz2 * i
        gg.setValues(tbl2)
        gg.sleep(delay2)
    end
end

--бот леса
local mainPoint3 =  { 2691.738037, -1750.477905, 23.279127 }
local sidePoints3 = {
    { 2698.947998, -1723.269775, 23.338751 }
}

local steps3 = 350
local delay3 = 10

function bot_forest()
    math.randomseed(os.time())
    findAndSaveCoords(true) 
    local list3 = gg.getListItems()
    local tbl3  = {}
    for _, v in ipairs(list3) do
        if     v.name == "x" then tbl3[1] = v
        elseif v.name == "y" then tbl3[2] = v
        elseif v.name == "z" then tbl3[3] = v
        end
    end
    if #tbl3 ~= 3 then
        return
    end
    while true do
        gotoPoint3(tbl3, mainPoint3)
        gg.toast(_T("point_reached"))
        gg.sleep(5000)
        local randomIdx3 = math.random(1, #sidePoints3)
        local target3    = sidePoints3[randomIdx3]
        gotoPoint3(tbl3, target3)
        gg.toast(_T("point2_reached"))
        gg.sleep(2000)
    end
end

function gotoPoint3(tbl3, point3)
    local tx3, ty3, tz3 = point3[1], point3[2], point3[3]
    local sx3, sy3, sz3 = tbl3[1].value, tbl3[2].value, tbl3[3].value

    local dx3 = (tx3 - sx3) / steps3
    local dy3 = (ty3 - sy3) / steps3
    local dz3 = (tz3 - sz3) / steps3

    for i = 1, steps3 do
        tbl3[1].value = sx3 + dx3 * i
        tbl3[2].value = sy3 + dy3 * i
        tbl3[3].value = sz3 + dz3 * i
        gg.setValues(tbl3)
        gg.sleep(delay3)
    end
end


-- =====================================================
-- 🏎️ SMART CAR SEARCH (WITH AUTO-CLEANUP)
-- =====================================================

SMART_QWORD_SIGN = "4568905975200743424"
SMART_REGION = gg.REGION_OTHER
SMART_WINDOW = 0x30D40 
SMART_RADIUS = 40.0 

function getPlayerCoords()
    local list = gg.getListItems()
    local x, y, z = nil, nil, nil
    for _, v in ipairs(list) do
        if v.name == "x" then x = tonumber(v.value) end
        if v.name == "y" then y = tonumber(v.value) end
        if v.name == "z" then z = tonumber(v.value) end
    end
    if not (x and y and z) then
        if findAndSaveCoords then findAndSaveCoords(true) end
        list = gg.getListItems()
        for _, v in ipairs(list) do
            if v.name == "x" then x = tonumber(v.value) end
            if v.name == "y" then y = tonumber(v.value) end
            if v.name == "z" then z = tonumber(v.value) end
        end
    end
    return x, y, z
end

function findSmartCarCoords()
    local px, py, pz = getPlayerCoords()
    if not pz then return nil end

    local s_min = pz - 1.5
    local s_max = pz + 1.5

    gg.clearResults()
    gg.setRanges(SMART_REGION)
    gg.searchNumber(SMART_QWORD_SIGN, gg.TYPE_QWORD)
    local qres = gg.getResults(100)
    if #qres == 0 then return nil end

    local pre_list = {}

    for i = 1, #qres do
        local startA = qres[i].address
        local endA   = startA + SMART_WINDOW
        gg.searchNumber(s_min .. "~" .. s_max, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, startA, endA)
        local part = gg.getResults(400)
        gg.clearResults()

        for j = 1, #part do
            -- Фильтр выравнивания (кратно 4)
            if (part[j].address % 4 == 0) then
                local struct = gg.getValues({
                    {address = part[j].address - 8, flags = gg.TYPE_FLOAT},
                    {address = part[j].address - 4, flags = gg.TYPE_FLOAT}
                })
                
                local cx, cy = struct[1].value, struct[2].value
                local dist = math.sqrt((cx - px)^2 + (cy - py)^2 + (part[j].value - pz)^2)

                if dist > 0.1 and dist <= SMART_RADIUS then
                    pre_list[#pre_list + 1] = part[j]
                end
            end
        end
    end
    
    if #pre_list == 0 then return nil end

    -- ==============================
    -- 🔄 СИНХРОНИЗАЦИЯ (ANTI-ROAD)
    -- ==============================
    gg.toast(_T("move"))
    local snap1 = gg.getValues(pre_list)
    gg.sleep(2500) 
    local snap2 = gg.getValues(pre_list)

    local final_list = {}
    local seen = {}

    for i = 1, #snap2 do
        if math.abs(snap2[i].value - snap1[i].value) > 0.000001 then
            if not seen[snap2[i].address] then
                seen[snap2[i].address] = true
                final_list[#final_list + 1] = snap2[i]
            end
        end
    end

    if #final_list == 0 then 
        for _, v in ipairs(pre_list) do
            if not seen[v.address] then
                seen[v.address] = true
                final_list[#final_list + 1] = v
            end
        end
    end

    return final_list
end

function processSmartCarValues(list)
    if not list or #list == 0 then
        gg.alert(_T("Machine_found"))
        return
    end

    -- =====================================================
    -- 🧹 ОЧИСТКА СТАРЫХ КООРДИНАТ (Car_X, Car_Y, Car_Z)
    -- =====================================================
    local currentItems = gg.getListItems()
    local toRemove = {}
    for _, item in ipairs(currentItems) do
        if item.name == "Car_X" or item.name == "Car_Y" or item.name == "Car_Z" then
            table.insert(toRemove, item)
        end
    end
    
    if #toRemove > 0 then
        gg.removeListItems(toRemove)
    end
    -- =====================================================

    local idx = 1
    while idx <= #list do
        local batch = {}
        local cache_z = {} 
        
        for i = idx, math.min(idx + 4, #list) do
            batch[#batch + 1] = list[i]
        end

        for i, item in ipairs(batch) do
            local val = gg.getValues({item})
            cache_z[i] = val[1].value
            gg.setValues({{address = item.address, flags = gg.TYPE_FLOAT, value = cache_z[i] + 7 }})
            gg.toast(_T("variant") .. i)
            gg.sleep(1000)
        end

        local menu = {}
        for i = 1, #batch do menu[#menu + 1] = _T("select") .. i end
        if #list > idx + 4 then menu[#menu + 1] = _T("read_more") end

        local choice = gg.choice(menu, nil, _T("properties_found") .. #list)
        
        -- ВОЗВРАТ МАШИНЫ В ИСХОДНУЮ ВЫСОТУ
        for i, item in ipairs(batch) do
            gg.setValues({{address = item.address, flags = gg.TYPE_FLOAT, value = cache_z[i]}})
        end

        if not choice then return end 

        if choice <= #batch then
            local sel = batch[choice]
            -- СОХРАНЕНИЕ НОВЫХ КООРДИНАТ
            gg.addListItems({
                {address = sel.address - 8, flags = gg.TYPE_FLOAT, name = "Car_Z"},
                {address = sel.address - 4, flags = gg.TYPE_FLOAT, name = "Car_Y"},
                {address = sel.address,     flags = gg.TYPE_FLOAT, name = "Car_X"}
            })
            gg.toast(_T("coordinates_saved"))
            return
        else
            idx = idx + 5
        end
    end
end














-- =====================================================
-- 🔵 OLD SEARCH (ИЗОЛИРОВАННЫЙ)
-- =====================================================

OLD_QWORD_TO_FIND = "4568905975200743424"
OLD_REGION = gg.REGION_OTHER
OLD_FLOAT_MIN = 1.000001
OLD_FLOAT_MAX = 1000.0
OLD_MAX_CANDIDATES = 5000000
OLD_WINDOW_BYTES = 0x30D40

-- ==============================
-- УТИЛИТЫ OLD
-- ==============================

function old_copyTable(list)
    local r = {}
    for i = 1, #list do
        r[i] = {
            address = list[i].address,
            flags   = list[i].flags,
            value   = list[i].value
        }
    end
    return r
end

function old_valuesMap(list)
    local m = {}
    for i = 1, #list do
        m[list[i].address] = list[i].value
    end
    return m
end

function old_filterByDirection(prevList, nextList, wantUp)
    local prev = old_valuesMap(prevList)
    local out = {}

    for i = 1, #nextList do
        local a  = nextList[i].address
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

function old_dedupByAddress(list)
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

-- ==============================
-- 🔍 OLD ШАГ 1
-- ==============================

function findCoordsOld()

    gg.clearResults()
    gg.setRanges(OLD_REGION)

    gg.searchNumber(
        OLD_QWORD_TO_FIND,
        gg.TYPE_QWORD,
        false,
        gg.SIGN_EQUAL,
        0,
        -1
    )

    local qres = gg.getResults(1000000)

    if #qres == 0 then
        gg.alert(_T("Machine_found"))
        return nil
    end

    local candidates = {}

    for i = 1, #qres do
        local startA = qres[i].address
        local endA   = startA + OLD_WINDOW_BYTES

        gg.searchNumber(
            OLD_FLOAT_MIN .. "~" .. OLD_FLOAT_MAX,
            gg.TYPE_FLOAT,
            false,
            gg.SIGN_EQUAL,
            startA,
            endA
        )

        local part = gg.getResults(1000000)

        for j = 1, #part do
            part[j].flags = gg.TYPE_FLOAT
            candidates[#candidates + 1] = part[j]

            if #candidates >= OLD_MAX_CANDIDATES then
                break
            end
        end

        if #candidates >= OLD_MAX_CANDIDATES then break end
    end

    candidates = old_dedupByAddress(candidates)
    gg.clearResults()

    return candidates
end

-- ==============================
-- 🔍 OLD ШАГ 2
-- ==============================

function twoChecksOld(candidates)

    if not candidates then return nil end

    local before1 = gg.getValues(old_copyTable(candidates))

    gg.toast(_T("Move2"))
    gg.sleep(3000)

    local dir1 = gg.choice({_T("Drove_up"), _T("Drove_down")}, nil, _T("Where_moving"))
    if not dir1 then return nil end

    local wantUp1 = (dir1 == 1)
    local after1  = gg.getValues(old_copyTable(candidates))
    local filtered1 = old_filterByDirection(before1, after1, wantUp1)

    if #filtered1 == 0 then return nil end

    local before2 = gg.getValues(old_copyTable(filtered1))

    gg.toast(_T("Repeat"))
    gg.sleep(3000)

    local dir2 = gg.choice({_T("Drove_up"), _T("Drove_down")}, nil, _T("Where_moving"))
    if not dir2 then return nil end

    local wantUp2 = (dir2 == 1)
    local after2  = gg.getValues(old_copyTable(filtered1))
    local filtered2 = old_filterByDirection(before2, after2, wantUp2)

    if #filtered2 == 0 then return nil end

    return filtered2
end

-- ==============================
-- 🔍 OLD ШАГ 3
-- ==============================

function processValuesOld(list)

    local index = 1

    while index <= #list do

        local batch = {}

        for i = index, math.min(index + 9, #list) do
            batch[#batch + 1] = list[i]
        end

        for i, item in ipairs(batch) do
            item.value = item.value + 10
            gg.setValues({item})
            gg.toast(_T("variant") .. i)
            gg.sleep(1500)
        end

        local menu = {}
        for i = 1, #batch do
            menu[#menu + 1] = _T("select") .. i
        end
        menu[#menu + 1] = "Следующее"

        local choice = gg.choice(menu, nil, _T("Select_option"))
        if not choice then return end

        if choice <= #batch then

            local sel = batch[choice]

            local toSave = {
                sel,
                {address = sel.address - 0x4, flags = gg.TYPE_FLOAT},
                {address = sel.address - 0x8, flags = gg.TYPE_FLOAT}
            }

            toSave = gg.getValues(toSave)

            if toSave[1] then toSave[1].name = "Car_X" end
            if toSave[2] then toSave[2].name = "Car_Y" end
            if toSave[3] then toSave[3].name = "Car_Z" end

            gg.addListItems(toSave)
            gg.toast(_T("coordinates_saved"))
            return
        else
            index = index + 10
        end
    end

    gg.alert(_T("Coordinates_ended"))
end

function bot_track()
    gg.toast(_T("Only_with"))
    
    -- 1. Вызываем окно ввода скорости
    local prompt = gg.prompt(
        {_T("Bot_movement")}, 
        {"5"}, 
        {"number"}
    )
    
    -- Проверка: если нажали "Отмена", то выходим
    if not prompt then
        gg.toast(_T("Launch_canceled"))
        return
    end
    
    -- Сохраняем введенную скорость как число
    local customSpeed = tonumber(prompt[1])

    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil

    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end

    if not (savedX and savedY and savedZ) then
        gg.alert(_T("save_coordinates"))
        return
    end

    -- поиск чекпоинта
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9,44502007e13", gg.TYPE_FLOAT)

    local results = gg.getResults(1000000)
    local checkpointAddr = nil

    for _, v in ipairs(results) do
        if string.sub(string.format("%X", v.address), -3) == "278" then
            checkpointAddr = v.address
            break
        end
    end

    if checkpointAddr == nil then
        gg.alert(_T("No_value_found"))
        return
    end
    gg.clearResults()
    gg.toast(_T("checkpoint_found") .. customSpeed)

    local coords = {
        {address = checkpointAddr + (2 * 8), flags = gg.TYPE_FLOAT},   -- X
        {address = checkpointAddr + (1.5 * 8), flags = gg.TYPE_FLOAT}, -- Y
        {address = checkpointAddr + (1 * 8), flags = gg.TYPE_FLOAT},   -- Z
    }

    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)
            gg.toast(_T("bot_stopped"))
            break
        end

        local car = gg.getValues({
            {address = savedX.address, flags = gg.TYPE_FLOAT},
            {address = savedY.address, flags = gg.TYPE_FLOAT},
            {address = savedZ.address, flags = gg.TYPE_FLOAT}
        })

        local target = gg.getValues(coords)

        local dx = target[1].value - car[1].value
        local dy = target[2].value - car[2].value
        local dz = target[3].value - car[3].value

        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)

        if dist > 1 then
            savedX.value = car[1].value + dx/dist * customSpeed
            savedY.value = car[2].value + dy/dist * customSpeed
            savedZ.value = car[3].value + dz/dist * customSpeed

            gg.setValues({savedX, savedY, savedZ})
        end
        gg.sleep(50)
    end
end

function botCourier()
        
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    
    for i, v in ipairs(savedList) do
        if v.name == "x" then savedX = v end
        if v.name == "y" then savedY = v end
        if v.name == "z" then savedZ = v end
    end
    
    if not (savedX and savedY and savedZ) then
        gg.alert(_T("save_coordinates"))
        return
    end

    -- Переменные для отслеживания изменений
    local lastX, lastY, lastZ = 0, 0, 0
    local notFoundCount = 0 
    local MAX_WAIT_TIME = 20 -- Увеличил время ожидания до 20 секунд

    while true do
        gg.clearResults()
        gg.setRanges(gg.REGION_OTHER)
        gg.searchNumber("9,44502007e13", gg.TYPE_FLOAT)
        local results = gg.getResults(100) -- Берем первые 100 совпадений для надежности

        local foundNew = false
        
        if results and #results > 0 then
            for _, v in ipairs(results) do
                -- Проверка сигнатуры адреса (как в твоем исходнике)
                if string.sub(string.format("%X", v.address), -3) == "278" then
                    local addr = v.address
                    
                    -- Смещения для получения координат текущей найденной метки
                    local valZ = gg.getValues({{address = addr + 16, flags = gg.TYPE_FLOAT}})[1].value
                    local valX = gg.getValues({{address = addr + 8, flags = gg.TYPE_FLOAT}})[1].value
                    local valY = gg.getValues({{address = addr + 12, flags = gg.TYPE_FLOAT}})[1].value

                    -- Проверяем, отличаются ли координаты от тех, на которые мы уже летали
                    if valX ~= lastX or valY ~= lastY or valZ ~= lastZ then
                        -- Телепортируем
                        savedX.value = valX
                        savedY.value = valY
                        savedZ.value = valZ
                        gg.setValues({savedX, savedY, savedZ})
                        
                        gg.toast(_T("Label_Found"))
                        
                        -- Запоминаем эти координаты как "старые"
                        lastX, lastY, lastZ = valX, valY, valZ
                        foundNew = true
                        notFoundCount = 0
                        break -- Выходим из перебора результатов, так как метка найдена
                    end
                end
            end
        end

        if not foundNew then
            -- Если мы уже на этой метке, просто пишем об этом
            if lastX ~= 0 then
                gg.toast(_T("Next_Label"))
            else
                notFoundCount = notFoundCount + 1
                gg.toast(_T("First_point") .. notFoundCount .. "/" .. MAX_WAIT_TIME .. ")")
            end
            
            -- Если метка не появляется слишком долго — выходим
            if notFoundCount >= MAX_WAIT_TIME then
                gg.alert(_T("Tag_not_found"))
                return
            end
        end

        gg.sleep(6500) -- Пауза между проверками
    end
end

local diverPoints1 = {
    {x = 922.68,  y = -535.45, z = -33.73},
    {x = 916.31,  y = -544.10, z = -36.57},
    {x = 917.63,  y = -560.92, z = -42.54},
    {x = 948.53,  y = -589.21, z = -39.06},
    {x = 939.75,  y = -574.43, z = -50.96},
    {x = 953.91,  y = -590.91, z = -48.80},
    {x = 949.40,  y = -569.16, z = -49.08},
    {x = 984.93,  y = -554.42, z = -34.78},
    {x = 945.03,  y = -538.44, z = -48.97},
    {x = 963.03,  y = -498.17, z = -42.89},
    {x = 959.36,  y = -482.82, z = -45.33},
    {x = 931.50,  y = -491.15, z = -51.70},
    {x = 884.28,  y = -500.64, z = -49.35},
    {x = 899.77,  y = -497.84, z = -52.17},
    {x = 898.91,  y = -485.31, z = -52.44},
    {x = 893.78,  y = -521.52, z = -49.77},
    {x = 875.80,  y = -522.46, z = -46.85},
    {x = 883.88,  y = -536.53, z = -47.55},
    {x = 942.60,  y = -556.80, z = -34.59},
}

local diverPoints2 = {
    {x = -2727.59,  y = 977.52, z = -36.00},
    {x = -2718.78,  y = 990.80, z = -42.92},
    {x = -2686.15,  y = 1000.92, z = -41.69},
    {x = -2669.69,  y = 997.75, z = -41.03},
    {x = -2681.93,  y = 995.82, z = -41.76},
    {x = -2687.06,  y = 997.81, z = -52.14},
    {x = -2706.82,  y = 993.06, z = -53.74},
    {x = -2744.28,  y = 982.73, z = -54.07},
    {x = -2737.76,  y = 999.38, z = -53.64},
    {x = -2728.46,  y = 1001.51, z = -53.70},
    {x = -2703.90,  y = 1031.51, z = -52.56},
    {x = -2689.94,  y = 1019.05, z = -52.92},
    {x = -2663.42,  y = 1015.66, z = -52.66},
    {x = -2663.42,  y = 1009.23, z = -51.03},
    {x = -2654.73,  y = 1005.95, z = -52.76},
    {x = -2639.77,  y = 1004.54, z = -52.58},
    {x = -2637.71,  y = 981.45, z = -53.13},
    {x = -2666.98,  y = 984.43, z = -51.57},
    {x = -2687.28,  y = 952.10, z = -54.55},
    {x = -2696.30,  y = 963.66, z = -54.39},
}

local SWIM_SPEED = 0.6
local STOP_DIST = 0.5
local COLLECT_TIME = 4000 

function startDiverBot(points, name)
    local savedValues = gg.getListItems()
    local coords = {}
    for _, v in ipairs(savedValues) do
        if v.name == "x" then coords.x = v end
        if v.name == "y" then coords.y = v end  
        if v.name == "z" then coords.z = v end
    end
    
    if not (coords.x and coords.y and coords.z) then
        findAndSaveCoords(true)
        return
    end

    gg.toast(_T("Launched") .. name)
    local pointIdx = 1

    while true do
        local target = points[pointIdx]
        while true do
            if gg.isVisible(true) then
                gg.setVisible(false)
                gg.toast(_T("bot_stopped"))
                return
            end

            local current = gg.getValues({coords.x, coords.y, coords.z})
            local dx = target.x - current[1].value
            local dy = target.y - current[2].value
            local dz = target.z - current[3].value
            local dist = math.sqrt(dx*dx + dy*dy + dz*dz)

            if dist > STOP_DIST then
                coords.x.value = current[1].value + (dx / dist) * SWIM_SPEED
                coords.y.value = current[2].value + (dy / dist) * SWIM_SPEED
                coords.z.value = current[3].value + (dz / dist) * SWIM_SPEED
                
                gg.setValues({coords.x, coords.y, coords.z})
                gg.sleep(70)
            else
                gg.toast(_T("Collecting_item"))
                gg.sleep(COLLECT_TIME)
                break 
            end
        end

        pointIdx = pointIdx + 1
        if pointIdx > #points then
            gg.toast(_T("The_Complete"))
            pointIdx = 1
        end
    end
end


function diverMenu()
    local shipChoice = gg.choice({
        _T("Ship"),
        _T("Ship2"),
        _T("back"), 
    }, nil, _T("prompt_choose_func"))

    if shipChoice == 1 then
        startDiverBot(diverPoints1, _T("Ship"))
    elseif shipChoice == 2 then
        startDiverBot(diverPoints2, _T("Ship2"))
    elseif shipChoice == 3 then
        Bots()
    end
end

-- Главный цикл скрипта
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        selectLanguage() 
        mainMenu() 
    end
    gg.sleep(100) 
end