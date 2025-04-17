script_name = "t.me/tikxyz"
print("" .. script_name)

function mainMenu()
gg.setVisible(false)
  local choice = gg.choice({
    "Телепорт",
    "Транспорт",
    "Персонаж",
    "Выход"
  }, nil, "Выберите функцию:")

  if choice == 1 then
    teleport()
  elseif choice == 2 then
    transportMenu()
  elseif choice == 3 then
    PersMenu()
  elseif choice == 4 then
    os.exit()
  end
end

function PersMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        "Увеличение хитбоксов",
        "Увеличение хитбоксов V2(через стены)",
        "Назад"
    }, nil, "Персонаж")

    if choice == 1 then
        HitboxMenu()
    elseif choice == 2 then
        HitBoxMenuV2()
    elseif choice == 3 or choice == nil then
        mainMenu()
    end
end

function transportMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        "Включить Gm Car",
        "Назад"
    }, nil, "Транспорт")

    if choice == 1 then
        carHPMenu()
    elseif choice == 2 or choice == nil then
        mainMenu()
    end
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
        local results = gg.getResults(999)

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

function carHPMenu()
gg.setVisible(false)
  local choice = gg.choice({
    "Включить Gm",
    "Назад"
  }, nil, "Выберите действие")

  if choice == 1 then
    findAndEditAllCarHP(9999999)
  elseif choice == 2 or choice == nil then
    mainMenu()
  end
end

function findAndEditAllCarHP()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4934256341737799680", gg.TYPE_QWORD)
    gg.refineNumber("4934256341737799680")
    local results = gg.getResults(9999) 

    if #results > 0 then
        local values = {}
        for i, result in ipairs(results) do
            table.insert(values, {
                address = result.address + (0.5 * 8),
                flags = gg.TYPE_FLOAT,
                value = 9999999,
                name = "Car HP " .. i
            })
        end

        gg.setValues(values)
        gg.toast("Изменено HP у " .. #values .. " машин!")
        mainMenu()
    else
        gg.toast("Значение не найдено")
        mainMenu()
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
        "❌ Выход"
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
        cleanupOnExit()
        gg.toast("Выход")
        mainMenu()
    else
        gg.toast("Ничего не выбрано")
        mainMenu()
    end
end

function findAndSaveCoords()
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
    else
        gg.toast("Значение не найдено")
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
        end
    else
        gg.toast("Ошибка: не найдены сохранённые координаты!")
    end
    mainMenu()
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
        -- Если это подкатегория, выбираем локации в подкатегории
        locations = teleportCategories[category][subcategory]
    else
        -- Если это категория, то выбираем все локации в ней
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
        mainMenu()
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
        mainMenu()
    end
end

function saveCurrentPoint()
    local values = gg.getListItems()
    if #values < 3 then
        gg.toast("Сначала найдите координаты")
        return mainMenu()
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
    mainMenu()
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
        mainMenu()
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
    else
        gg.toast("Ошибка: нет сохранённых координат")
    end

    mainMenu() 
    gg.sleep(1000)
    gg.setVisible(false)
end

loadSavedPoints()
mainMenu()
