local mod = get_mod("blitzbar")
local InputUtils = mod:original_require("scripts/managers/input/input_utils")

local function cf(color_name)
	local color = Color[color_name](255, true)
	return string.format("{#color(%s,%s,%s)}", color[2], color[3], color[4])
end

local localizations = {
	mod_name = {
		en = "Blitz Bar",
		["zh-cn"] = "闪击/天赋技能计数器",
	},
	mod_description = {
		en = "#NAME?",
		["zh-cn"] = "添加耐力样式条以显示您当前的手榴弹剩余量。\n或灵能者的反噬程度，亦可以显示狂热者的殉道层数等。",
	},
	show_gauge = {
		en = "Always show",
		["zh-cn"] = "始终显示",
	},
	show_gauge_description = {
		en = "	Show even when empty.\n\n"
			.. cf("ui_disabled_text_color") .. "Options that " .. cf("ui_hud_green_medium") .. "refill" .. cf("ui_disabled_text_color") .. " over time will always be shown.",
		["zh-cn"] = "即使数值为空或0时也将保持显示状态。\n\n"
			.. cf("ui_disabled_text_color") .. "随着时间的推移" .. cf("ui_hud_green_medium") .. "自动补充" .. cf("ui_disabled_text_color") .. "的内容也将始终显示",
	},
	gauge_orientation = {
		en = "Orientation",
		["zh-cn"] = "显示方向",
	},
	orientation_option_horizontal = {
		en = "Horizontal (Bottom)",
		["zh-cn"] = "水平（向下）",
	},
	orientation_option_horizontal_flipped = {
		en = "Horizontal (Top)",
		["zh-cn"] = "水平（向上）",
	},
	orientation_option_vertical = {
		en = "Vertical (Left)",
		["zh-cn"] = "垂直（向左）",
	},
	orientation_option_vertical_flipped = {
		en = "Vertical (Right)",
		["zh-cn"] = "垂直（向右）",
	},
	auto_text_option = {
		en = "Auto gauge text",
		["zh-cn"] = "自适应计数器文本",
	},
	auto_text_option_description = {
		en = "Automatically sets gauge text to match what the bar is displaying.",
		["zh-cn"] = "自动更改计数器的文本以显示当前对应的内容",
	},

	-- ##############################
	-- #        TEXT_OPTIONS        #
	-- ##############################
	none = {
		en = "",
		["zh-cn"] = "",
	},
	none_display = {
		en = "",
		["zh-cn"] = "",
	},
	text_option_blitz = {
		en = "Blitz",
		["zh-cn"] = "闪击",
	},
	text_option_charges = {
		en = "Charges",
		["zh-cn"] = "充能",
	},
	text_option_grenades = {
		en = "Grenades",
		["zh-cn"] = "手雷数量",
	},

	-- ##############################
	-- #           PSYKER           #
	-- ##############################
	text_option_assail = {
		en = "Assail",
		["zh-cn"] = "灵能飞镖",
	},
	text_option_souls = {
		en = "Souls",
		["zh-cn"] = "灵魂之火",
	},
	text_option_warp = {
		en = "Warp",
		["zh-cn"] = "亚空间",
	},
	text_option_warpcharges = {
		en = "Warp charges",
		["zh-cn"] = "亚空间虹吸",
	},
	text_option_psionics = {
		en = "Psionics",
		["zh-cn"] = "灵能强化",
	},
	text_option_destiny = {
		en = "Destiny",
		["zh-cn"] = "扰动命运",
	},
	text_option_marks = {
		en = "Marks",
		["zh-cn"] = "标记",
	},

	-- ##############################
	-- #           ZEALOT           #
	-- ##############################
	text_option_martyrdom = {
		en = "Martyrdom",
		["zh-cn"] = "殉道",
	},
	text_option_knife = {
		en = "Knife",
		["zh-cn"] = "信仰之刃",
	},
	text_option_piety = {
		en = "Piety",
		["zh-cn"] = "炽热虔诚",
	},	
	text_option_inexorable = {
		en = "Inexorable",
		["zh-cn"] = "命定审判",
	},
	text_option_stun = {
		en = "Stun",
		["zh-cn"] = "眩晕手雷",
	},
	text_option_flame = {
		en = "Flame",
		["zh-cn"] = "献祭手雷",
	},

	-- ##############################
	-- #          VETERAN           #
	-- ##############################
	text_option_frag = {
		en = "Frag",
		["zh-cn"] = "破片手雷",
	},
	text_option_krak = {
		en = "Krak",
		["zh-cn"] = "穿甲手雷",
	},
	text_option_smoke = {
		en = "Smoke",
		["zh-cn"] = "烟雾手雷",
	},

	-- ##############################
	-- #           OGRYN           #
	-- ##############################
	text_option_box = {
		en = "Box",
		["zh-cn"] = "空手雷箱",
	},
	text_option_armour = {
		en = "Armour",
		["zh-cn"] = "手雷箱",
	},
	text_option_nuke = {
		en = "Nuke",
		["zh-cn"] = "破片炸弹",
	},
	text_option_rock = {
		en = "Rock",
		["zh-cn"] = "岩石",
	},

	-- ##############################
	-- #           VALUE            #
	-- ##############################
	value_decimals = {
		en = "Decimals",
		["zh-cn"] = "小数",
	},
	value_decimals_description = {
		en = "Show 1 decimal place for percentage values.\n\n"
		.. cf("ui_ogryn") .. "Ogryn{#reset()}" .. cf("ui_ogryn_text") .. " Feel no pain" .. cf("ui_disabled_text_color") .. " will appear incorrect with this off.",
		["zh-cn"] = "百分比后显示1位小数。\n\n"
		.. cf("ui_ogryn") .. "欧格林{#reset()}" .. cf("ui_ogryn_text") .. "感觉" .. cf("ui_disabled_text_color") .. "关闭此选项后不会出现任何疼痛。",
	},
	gauge_value = {
		en = "Value",
		["zh-cn"] = "数值",
	},
	value_option_damage = {
		en = "Damage",
		["zh-cn"] = "伤害",
	},
	value_option_damage_display = {
		en = "DMG:",
		["zh-cn"] = "伤害:",
	},
	value_option_stacks = {
		en = "Stacks",
		["zh-cn"] = "层数",
	},
	value_option_stacks_display = {
		en = "STK:",
		["zh-cn"] = "层:",
	},
	value_option_time_percent = {
		en = "Time (%%)",
		["zh-cn"] = "时间 (%%)",
	},
	value_option_time_percent_display = {
		en = "T:",
		["zh-cn"] = "时间:",
	},
	value_option_time_seconds = {
		en = "Time (s)",
		["zh-cn"] = "时间 (秒)",
	},
	value_option_time_seconds_display = {
		en = "T:",
		["zh-cn"] = "时间:",
	},
	gauge_color_1 = {
		en = "Value text color",
		["zh-cn"] = "数值颜色",
	},
	gauge_color_2 = {
		en = "Gauge color",
		["zh-cn"] = "计数条颜色",
	},
	value_time_full_empty = {
		en = "Full/Empty",
		["zh-cn"] = "显示 充满/耗尽",
	},
	value_time_full_empty_description = {
		en = "Instead of numerical values for the " .. cf("item_rarity_2") .. "Stacks{#reset()} option when at maximum or 0 stacks.\n"
			.. "\n"
			.. cf("item_rarity_1") .. "Grenade\t{#reset()}:  " .. cf("terminal_text_header") .. "FULL{#reset()} and " .. cf("terminal_text_body") .. "EMPTY{#reset()}\n"
			.. cf("item_rarity_4") .. "Keystone\t{#reset()}:  " .. cf("ui_hud_overcharge_high") .. "MAX{#reset()} and " .. cf("ui_disabled_text_color") .. "[NOTHING]{#reset()}\n",
		["zh-cn"] = "当技能的层数达到最大或 0 时，取代" .. cf("item_rarity_2") .. "层数{#reset()} 选项的数值显示。\n"
			.. "\n"
			.. cf("item_rarity_1") .. "投掷物\t{#reset()}:  " .. cf("terminal_text_header") .. "充满{#reset()}和" .. cf("terminal_text_body") .. "耗尽{#reset()}\n"
			.. cf("item_rarity_4") .. "楔石天赋\t{#reset()}:  " .. cf("ui_hud_overcharge_high") .. "最大{#reset()}和" .. cf("ui_disabled_text_color") .. "[NOTHING]{#reset()}\n",
	},
	martyrdom = {
		en = "Zealot martyrdom",
		["zh-cn"] = "狂热者殉道",
	},
	martyrdom_description = {
		en = "Use bar to display stacks of the Zealot passive " .. cf("item_rarity_5") .. "Martyrdom{#reset()}." ..
			"\n\n" .. cf("ui_disabled_text_color") .. "Will show " .. cf("item_rarity_dark_5") .. "Stun grenade" .. cf("ui_disabled_text_color") .. " charges if not enabled.",
		["zh-cn"] = "使用计数栏来显示狂热者被动技能" .. cf("item_rarity_5") .. "殉道{#reset()}." .. 
			"的层数\n\n" .. cf("ui_disabled_text_color") .. "如果未启用，将显示" .. cf("item_rarity_dark_5") .. "眩晕手雷" .. cf("ui_disabled_text_color") .. "的充能数量。",
	},
	veteran_override_replenish_text = {
		en = "Replenish time value",
		["zh-cn"] = "显示物品补充时间",
	},
	veteran_override_replenish_text_description = {
		en = "Automatically change " .. cf("item_rarity_2") .. "Stacks{#reset()} value to\n"
			.. cf("item_rarity_2") .. "Time (s){#reset()} for options that " .. cf("ui_hud_green_light") .. "refill{#reset()} over time.\n",
		["zh-cn"] = "自动更改" .. cf("item_rarity_2") .. "手雷数量{#reset()}的数值为\n手雷"
			.. cf("ui_hud_green_light") .. "自动补充{#reset()}所需的".. cf("item_rarity_2") .. "时间(s){#reset()}。",
	},
	archetype_options = {
		en = "Archetypes",
		["zh-cn"] = "角色设置",
	},
	psyker = {
		en = "Psyker",
		["zh-cn"] = "灵能者",
	},
	veteran = {
		en = "Veteran",
		["zh-cn"] = "老兵",
	},
	zealot = {
		en = "Zealot",
		["zh-cn"] = "狂热者",
	},
	ogryn = {
		en = "Ogryn",
		["zh-cn"] = "欧格林",
	},
	_grenade = {
		en = "Prefer Grenade",
		["zh-cn"] = "闪击技能优先",
	},
	_grenade_description = {
		en = "Will display " .. cf("item_rarity_1") .. "Grenade{#reset()} charges over " .. cf("item_rarity_4") .. "Keystone{#reset()} charges if possible.",
		["zh-cn"] = "如果可能的话，将显示" .. cf("item_rarity_1") .. "闪击技能{#reset()}而不是" .. cf("item_rarity_4") .. "楔石{#reset()}天赋的层数",
	},
	_show_gauge_description = {
		en = "Show the bar on this archetype.",
		["zh-cn"] = "在这个原型展示栏。",
	},
	_gauge_text = {
		en = "Gauge Text",
		["zh-cn"] = "计数器文本",
	},
	_gauge_text_description = {
		en = "What text should appear next to the gauge.\n"
			.. "\n"
			.. cf("ui_disabled_text_color") .. "Will have no affect if " .. cf("terminal_text_body") .. "Auto gauge text" .. cf("ui_disabled_text_color") .. " is enabled.",
		["zh-cn"] = "在计数器仪表旁应当显示什么文本。\n"
			.. "\n"
			.. cf("ui_disabled_text_color") .. "如果启用" .. cf("terminal_text_body") .. "自适应计数器文本" .. cf("ui_disabled_text_color") .. "则不会有任何影响。",
	},
	_gauge_value = {
		en = "Value",
		["zh-cn"] = "数值显示",
	},
	_gauge_value_description = {
		en = "Value to be displayed next to the gauge. \n" ..
			"If the value would make no sense then " .. cf("ui_disabled_text_color") .. "[NOTHING]{#reset()} will be shown instead",
		["zh-cn"] = "在计数器仪表旁显示的数值\n" ..
			"如果改数值没有任何意义，将在此处显示显示" .. cf("ui_disabled_text_color") .. "[NOTHING]{#reset()}",
	},
	_gauge_value_text = {
		en = "Value text",
		["zh-cn"] = "数值文本",
	},
	_gauge_value_text_description = {
		en = "Show additional text before value.",
		["zh-cn"] = "在数值前显示额外的文本。",
	},
	_color_full = {
		en = "Full color",
		["zh-cn"] = "满层颜色",
	},
	_color_full_description = {
		en = "Color of each bar when full.",
		["zh-cn"] = "投掷物数量或技能层数全满时的颜色。",
	},
	_color_empty = {
		en = "Empty color",
		["zh-cn"] = "全空颜色",
	},
	_color_empty_description = {
		en = "Color of each bar when empty.\n" ..
			"Transparent at a value of 0.",
		["zh-cn"] = "投掷物数量或技能层数耗尽时的颜色。\n" ..
			"透明的数值值为 0。",
	},
	full = {
		en = "FULL",
		["zh-cn"] = "充满",
	},
	max = {
		en = "MAX",
		["zh-cn"] = "最大",
	},
	empty = {
		en = "EMPTY",
		["zh-cn"] = "耗尽",
	}
}

local function display_name(text)
	local display_text = ""
	local words = string.split(text, "_")
	for _, word in ipairs(words) do
		word = (word:gsub("^%l", string.upper)) -- Parenthesis [https://www.luafaq.org/gotchas.html#T8.1]
		display_text = display_text .. " " .. word
	end
	return display_text
end

local color_names = Color.list
for _, color_name in ipairs(color_names) do
	localizations[color_name] = { en = cf(color_name) .. display_name(color_name) .. "{#reset()}"}
end

local archetypes = { "psyker", "veteran", "zealot", "ogryn" }
local options = { "_grenade", "_gauge_text", "_gauge_value", "_gauge_value_text", "_color_full", "_color_empty"}
for _, archetype in pairs(archetypes) do
	localizations[archetype .. "_show_gauge"] = {
		en = cf("ui_" .. archetype) .. localizations[archetype].en .. "{#reset()}"
	}
	for _, option in pairs(options) do
		localizations[archetype .. option] = table.clone(localizations[option])
		localizations[archetype .. option .. "_description"] = table.clone(localizations[option .. "_description"])
		for language, _ in pairs(localizations[archetype .. option]) do
			localizations[archetype .. option][language] = cf("ui_" .. archetype .. "_text") .. localizations[archetype .. option][language] .. "{#reset()}"
			localizations[archetype .. option .. "_description"][language] = localizations[archetype .. option .. "_description"][language]
		end
	end
end

return localizations
