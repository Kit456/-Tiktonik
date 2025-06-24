function mainMenu()
gg.setVisible(false)
  local choice = gg.choice({
    "Телепорт",
    "Транспорт",
    "Персонаж",
    "Оружие",
    "Выход"
  }, nil, "Выберите функцию:")

  if choice == 1 then
    teleport()
  elseif choice == 2 then
    transportMenu()
  elseif choice == 3 then
    PersMenu()
  elseif choice == 4 then
    Gun()
  elseif choice == 5 then
    os.exit()
  end
end

local recoilActive = false

function Gun()
    gg.setVisible(false)
    local choice = gg.choice({
        "Выдать оружие",
        "Анти разброс(New)",
        "Назад"
    }, nil, "Выберите действие")

    if choice == 1 then
        Gun1()
    elseif choice == 2 then
        toggleRecoil()
    elseif choice == 3 or choice == nil then
        mainMenu()
    else
        gg.toast("Ничего не выбрано")
        mainMenu()
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
    gg.toast("🌀 Анти-Разброс Активирован 🌀")
end 

function gunn2() 
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("95;900", gg.TYPE_FLOAT)
    gg.refineNumber("95", gg.TYPE_FLOAT)
    revert = gg.getResults(555)
    gg.editAll("100", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("🌀 Анти-Разброс Деактивирован 🌀")
end

function Gun1()
    gg.setVisible(false)
    local menu = gg.choice({
        "▶ Выбрать: кастет",
        "▶ Выбрать: клюшка",
        "▶ Выбрать: дубинка",
        "▶ Выбрать: нож",                
        "▶ Выбрать: бита",        
        "▶ Выбрать: лопата",      
        "▶ Выбрать: палка",     
        "▶ Выбрать: катана",       
        "▶ Выбрать: пила",        
        "▶ Выбрать: дилдо",        
        "▶ Выбрать: дилдо2",        
        "▶ Выбрать: вибратор",        
        "▶ Выбрать: вибратор2",        
        "▶ Выбрать: цветы",        
        "▶ Выбрать: трость",        
        "▶ Выбрать: граната",        
        "▶ Выбрать: газ",        
        "▶ Выбрать: молотов",        
        "▶ Выбрать: кольт45",        
        "▶ Выбрать: шокер",        
        "▶ Выбрать: дигл",        
        "▶ Выбрать: шотган",        
        "▶ Выбрать: обрез",        
        "▶ Выбрать: спас",        
        "▶ Выбрать: узи",        
        "▶ Выбрать: мп5",        
        "▶ Выбрать: акр47",        
        "▶ Выбрать: м4",       
        "▶ Выбрать: тек9",        
        "▶ Выбрать: винтовка",        
        "▶ Выбрать: снайперка",        
        "▶ Выбрать: гранатомёт",       
        "▶ Выбрать: ракетница",       
        "▶ Выбрать: огнемет",        
        "▶ Выбрать: миниган",        
        "▶ Выбрать: липучка",        
        "▶ Выбрать: активатор",        
        "▶ Выбрать: спрей",        
        "▶ Выбрать: огнетушитель",        
        "▶ Выбрать: камера",        
        "▶ Выбрать: тепловизор",        
        "▶ Выбрать: тепловизор2",        
        "▶ Выбрать: парашют",        
        "❌ Выход"
    }, nil, "Выберите оружие:")

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
        gg.toast("Выдано оружие: " .. name)
    else
    gg.setVisible(false)
        gg.toast("Не удалось выдать оружие.")
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
        gg.toast("Координаты успешно заменены!")
        mainMenu()
    else
        gg.toast("Значение не найдено")
        mainMenu()
    end

    gg.clearResults()
end

function searchAndReplaceCoords()
    gg.toast("Ожидание 5 секунд... Поставьте метку и не не трогайте карту")
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
        gg.toast("Координаты не найдены")
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
        gg.toast("Метка не найдена")
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
    gg.toast("Координаты успешно перенесены!")
    mainMenu()
end

local sprintActive = false
local fovActive = false
local rainActive = false

function PersMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        "Увеличение хитбоксов",
        "Увеличение хитбоксов V2(через стены)",
        "Быстрый спринт(New)",
        "Фов(New)",
        "Дождь(New)",
        "Ходить сквозь стены",
        "Назад"
    }, nil, "Персонаж")

    if choice == 1 then
        HitboxMenu()
    elseif choice == 2 then
        HitBoxMenuV2()
    elseif choice == 3 then
        toggleSprint()
    elseif choice == 4 then
        toggleFov()
    elseif choice == 5 then
        toggleRain()
    elseif choice == 6 or choice == nil then
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
    gg.toast("❗СПРИНТ АКТИВИРОВАН❗")
    gg.clearResults()
end

function dv2()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4.0;-0.565651;0.20000000298;5.0;10.0;1.0;0.5;0.30000001192:29", gg.TYPE_FLOAT)
    gg.refineNumber("-0.565651", gg.TYPE_FLOAT)
    revert = gg.getResults(100000)
    gg.editAll("0.7", gg.TYPE_FLOAT)
    gg.toast("❗СПРИНТ ДЕАКТИВИРОВАН❗")
    gg.clearResults()
end

function fov1() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1116471296", gg.TYPE_DWORD)
    revert = gg.getResults(300)
    gg.editAll("1122469536", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("❗FOV АКТИВИРОВАН❗")
end 

function fov2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1122469536", gg.TYPE_DWORD)
    revert = gg.getResults(300)
    gg.editAll("1116471296", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("❗FOV ДЕАКТИВИРОВАН❗")
end 

function dojd1() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("0.00499999989", gg.TYPE_FLOAT)
    revert = gg.getResults(300)
    gg.editAll("-25.84625", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗ДОЖДЬ АКТИВИРОВАН❗")
end 

function dojd2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("-25.84625", gg.TYPE_FLOAT)
    revert = gg.getResults(300)
    gg.editAll("0.00499999989", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗ДОЖДЬ ДЕАКТИВИРОВАН❗")
end

function HitboxMenu()
  gg.clearResults()
    while true do
        gg.clearResults()
        gg.setRanges(gg.REGION_C_ALLOC)
        gg.searchNumber("1042536202", gg.TYPE_DWORD)
        local results = gg.getResults(5000)

        if results ~= nil and #results > 0 then
            gg.editAll("1076161254", gg.TYPE_DWORD)
            gg.clearResults()
            print("Значения изменены: найдено " .. #results)
        else
            print("Значения не найдены.")
        end

        gg.sleep(10000) -- пауза 10 секунд
    end
end

local baxActive = false -- переменная для отслеживания состояния

function transportMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        "Включить Gm Car",
        "Взорвать Машину(New)",
        "Назад"
    }, nil, "Транспорт")

    if choice == 1 then
        findAndFreezeAllCarHP()
    elseif choice == 2 then
        toggleBax()
    elseif choice == 3 or choice == nil then
        mainMenu()
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
    gg.toast("❗ФУНКЦИЯ АКТИВИРОВАНА❗")
end 

function bax2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1000.0234765", gg.TYPE_FLOAT)
    revert = gg.getResults(1000)
    gg.editAll("250.0", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗ФУНКЦИЯ ДЕАКТИВИРОВАНА❗")
end

local originalValue = 1042536203
local newValue = 1089999999
local state = false 

function HitBoxMenuV2()
    gg.clearResults()

    if not state then
        gg.searchNumber(originalValue, gg.TYPE_DWORD)
        local results = gg.getResults(999)

        if #results == 0 then
            gg.alert("❌ Значение для включения не найдено!")
            return
        end

        for i, v in ipairs(results) do
            v.value = newValue
        end

        gg.setValues(results)
        gg.toast("✅ Включено")
        state = true
        mainMenu()
        gg.clearResults()
    else
        gg.searchNumber(newValue, gg.TYPE_DWORD)
        local results = gg.getResults(99999999)

        if #results == 0 then
            gg.alert("❌ Значение для отключения не найдено!")
            return
        end

        for i, v in ipairs(results) do
            v.value = originalValue
        end

        gg.setValues(results)
        gg.toast("⛔ Выключено")
        state = false
        gg.clearResults()
        mainMenu()
    end
end

function findAndFreezeAllCarHP()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4934256341737799680", gg.TYPE_QWORD)
    gg.refineNumber("4934256341737799680")
    local results = gg.getResults(9999)

    if #results > 0 then
        local setList = {}
        for i, result in ipairs(results) do
            local hpAddr = result.address + (0.5 * 8)
            table.insert(setList, {
                address = hpAddr,
                flags = gg.TYPE_FLOAT,
                value = 100000
            })
        end

        gg.setValues(setList)
        gg.toast("Установлено 100000 HP у " .. #setList .. " машин!")
    else
        gg.toast("Значение не найдено")
    end

    gg.clearResults()
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
           {name = "Закусачная: Обжорка 5", x = 174, y = 737, z = 12}, 
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

function teleport()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔍 Найти и сохранить координаты",
        "🚀 Телепортироваться",
        "📍 Выбрать точку телепорта",
        "💾 Сохранённые точки",
        "✅ Телепорт по метке",
        "🧾 Телепорт по чекпоинту",
        "🔙 Назад"
    }, nil, "Выберите действие")

    if choice == 1 then
        findAndSaveCoords()
        mainMenu()
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
        gg.toast("Ничего не выбрано")
        mainMenu()
    end
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

        gg.toast("Координаты сохранены!")
        teleport()
    else
        gg.toast("Значение не найдено")
        teleport()
    end

    gg.clearResults()
end

function teleportManual()
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        local input = gg.prompt({"Введите X:", "Введите Y:", "Введите Z:"},
            {savedValues[1].value, savedValues[2].value, savedValues[3].value},
            {"number", "number", "number"})

        if input then
            savedValues[1].value = input[1]
            savedValues[2].value = input[2]
            savedValues[3].value = input[3]

            gg.setValues(savedValues)
            gg.toast("Телепортация выполнена!")
            mainMenu()
        else
            gg.toast("Телепорт отменён")
            teleport()
        end
    else
        gg.toast("Ошибка: не найдены сохранённые координаты!")
        teleport()
    end
end

function selectTeleportCategory()
    local categoryNames = teleportCategoryOrder

    local choice = gg.choice(categoryNames, nil, "Выберите категорию")
    if choice then
        local selectedCategory = categoryNames[choice]

        if selectedCategory == "11.Бизнесы" or selectedCategory == "13.Фермерский комплекс" then
            local sortedSubcategories = {}

            
            for subcat, _ in pairs(teleportCategories[selectedCategory]) do
                table.insert(sortedSubcategories, subcat)
            end

            
            table.sort(sortedSubcategories, function(a, b)
                local numA = tonumber(a:match("^(%d+)"))  
                local numB = tonumber(b:match("^(%d+)"))  
                return numA < numB  
            end)

            local choiceSubcategory = gg.choice(sortedSubcategories, nil, "Выберите подкатегорию бизнеса")
            if choiceSubcategory then
                local selectedSubcategory = sortedSubcategories[choiceSubcategory]
                selectTeleportLocation(selectedCategory, selectedSubcategory)
            else
                gg.toast("Вы не выбрали подкатегорию")
            end
        else
            selectTeleportLocation(selectedCategory)
        end
    else
        gg.toast("Вы не выбрали категорию")
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

    local choiceLocation = gg.choice(locationNames, nil, "Выберите локацию")
    if choiceLocation then
        local selectedLocation = locations[choiceLocation]
        teleportToLocation(selectedLocation)
    else
        gg.toast("Вы не выбрали локацию")
    end
end

function applyTeleport(x, y, z)
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        savedValues[1].value = x
        savedValues[2].value = y
        savedValues[3].value = z
        gg.setValues(savedValues)
        gg.toast("Телепорт выполнен!")
        mainMenu()
    else
        gg.toast("Ошибка: нет сохранённых координат")
        teleport()
    end
end

function userSavedPointsMenu()
    local options = {"➕ Сохранить текущую точку", "📌 Телепорт к сохранённой", "⬅️ Назад"}
    local choice = gg.choice(options, nil, "Сохранённые точки")

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
        gg.toast("Сначала найдите координаты")
        return teleport()
    end

    local input = gg.prompt({"Имя точки:"}, nil, {"text"})
    if input and input[1] ~= "" then
        savedPoints[input[1]] = {
            x = values[1].value,
            y = values[2].value,
            z = values[3].value
        }
        savePointsToFile()
        gg.toast("Точка сохранена!")
    else
        gg.toast("Отмена сохранения")
    end
    teleport()
end

function chooseSavedPoint()
    if next(savedPoints) == nil then
        gg.toast("Нет сохранённых точек")
        return mainMenu()
    end

    local names = {}
    for name in pairs(savedPoints) do
        table.insert(names, name)
    end

    table.sort(names)
    local choice = gg.choice(names, nil, "Выберите точку")
    if choice then
        local point = savedPoints[names[choice]]
        applyTeleport(point.x, point.y, point.z)
    else
        gg.toast("Выбор отменён")
        teleport()
    end
end

function cleanupOnExit()
    gg.removeListItems(gg.getListItems())
    gg.clearResults()
    gg.toast("Все сохранённые данные удалены!")
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

        gg.toast("Телепортируемся в " .. location.name .. " (X: " .. x .. ", Y: " .. y .. ", Z: " .. z .. ")")
        gg.sleep(1000)
        gg.toast("Телепорт выполнен!")
        mainMenu()
    else
        gg.toast("Ошибка: нет сохранённых координат")
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
