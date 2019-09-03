﻿-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- TrinityAdmin is a derivative of MangAdmin.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official Forums: http://groups.google.com/group/trinityadmin
-- GoogleCode Website: http://code.google.com/p/trinityadmin/
-- Subversion Repository: http://trinityadmin.googlecode.com/svn/
-- Dev Blog: http://trinityadmin.blogspot.com/
-------------------------------------------------------------------------------------------------------------

function Return_ruRU()
  return {
    ["slashcmds"] = { "/dma" },
    ["lang"] = "Русский",
    ["realm"] = "|cFF00FF00Реалм:|r Darkmoon",--..GetCVar("realmName"),
    ["char"] = "|cFF00FF00Чар:|r "..UnitName("player"),
    ["guid"] = "|cFF00FF00Guid:|r ",
    ["tickets"] = "|cFF00FF00Тикеты:|r ",
    ["gridnavigator"] = "Навигатор",
    ["selectionerror1"] = "Выбери либо себя либо другого ИГРОКА",
    ["selectionerror2"] = "Выбери только себя !",
    ["selectionerror3"] = "Выбери только другого игрока !",
    ["selectionerror4"] = "Выберите только НПС!",
    ["searchResults"] = "|cFF00FF00Результаты поиска:|r ",
    ["tabmenu_Main"] = "Главное",
    ["tabmenu_Char"] = "Чар",
    ["tabmenu_Tele"] = "Телепорт",
    ["tabmenu_Ticket"] = "Тикеты",
    ["tabmenu_Misc"] = "Разное",
    ["tabmenu_Server"] = "Сервак",
    ["tabmenu_Log"] = "Логи",
    ["tt_Default"] = "Задержи мышку над элементом для отображения подсказкм",
    ["tt_MainButton"] = "Включить МангАдмин.",
    ["tt_CharButton"] = "Открыть меню для чара.",
    ["tt_TeleButton"] = "Открыть меню для телепорта.",
    ["tt_TicketButton"] = "Открыть меню управления тикетами.",
    ["tt_MiscButton"] = "Открыть меню с различными другими действиями.",
    ["tt_ServerButton"] = "Открыть меню серверной части, (инфа и действия).",
    ["tt_LogButton"] = "Показать логи МангАдмина.",
    ["tt_LanguageButton"] = "Поменять язык и перезагрузить МангАдмин",
    ["tt_GMOnButton"] = "Включить ГМ режим.",
    ["tt_GMOffButton"] = "Выключить ГМ режим.",
    ["tt_FlyOnButton"] = "Включить режим полёта выбраному игроку(или себе).",
    ["tt_FlyOffButton"] = "Выключить режим полёта выбраному игроку(или себе).",
    ["tt_HoverOnButton"] = "Включить режим парения(hover).",
    ["tt_HoverOffButton"] = "Выключить режим парения(hover)",
    ["tt_WhispOnButton"] = "Принимать whisper-ы от игроков.",
    ["tt_WhispOffButton"] = "Не принимать whisper-ы от игроков.",
    ["tt_InvisOnButton"] = "Сделатся невидимым.",
    ["tt_InvisOffButton"] = "Сделатся видимым.",
    ["tt_TaxiOnButton"] = "Включить вежим такси для выбранного игрока. Чит закончится после лог-аута.",
    ["tt_TaxiOffButton"] = "Выключить чит такси для выбранного игрока.",
    ["tt_BankButton"] = "Банк.",
    ["tt_ScreenButton"] = "Сделать снимок.",
    ["tt_SpeedSlider"] = "Увеличить или уменьшить скорость выбранного перса.",
    ["tt_ScaleSlider"] = "Увеличить или уменьшить размер выбранного перса.",
    ["tt_ItemButton"] = "Открыть поиск вещей.",
    ["tt_ItemSetButton"] = "Открыть поиск сетов.",
    ["tt_SpellButton"] = "Открыть поиск спеллов.",
    ["tt_QuestButton"] = "Открыть поиск квестов.",
    ["tt_CreatureButton"] = "Открыть поиск существ.",
    ["tt_ObjectButton"] = "Открыть поиск объектов.",
    ["tt_SearchDefault"] = "ВВедите слово в поисковом поле.",
    ["tt_AnnounceButton"] = "Системно сообщение.",
    ["tt_KickButton"] = "Выкинуть выбранного игрока с сервера.",
    ["tt_ShutdownButton"] = "Вырубить сервер через количество секунд указаные в поле, если пусто то сразу!",
    ["ma_ItemButton"] = "Поиск вещи",
    ["ma_ItemSetButton"] = "Поиск сета",
    ["ma_SpellButton"] = "Поиск спелла",
    ["ma_QuestButton"] = "Поиск квеста",
    ["ma_CreatureButton"] = "Поиск существа",
    ["ma_ObjectButton"] = "Поиск обьекта",
    ["ma_TeleSearchButton"] = "Поиск телепорта",
    ["ma_LanguageButton"] = "Сменить язык",
    ["ma_GMOnButton"] = "Режим ГМ вкл.",
    ["ma_FlyOnButton"] = "Полёт вкл.",
    ["ma_HoverOnButton"] = "ПарИть вкл.",
    ["ma_WhisperOnButton"] = "Whisper вкл.",
    ["ma_InvisOnButton"] = "Невидимость вкл.",
    ["ma_TaxiOnButton"] = "Такси-чит вкл.",    
    ["ma_ScreenshotButton"] = "Снимок",
    ["ma_BankButton"] = "Банк",
    ["ma_OffButton"] = "ВЫКЛ.",
    ["ma_LearnAllButton"] = "Все спеллы",
    ["ma_LearnCraftsButton"] = "Все профессии и рецепты",
    ["ma_LearnGMButton"] = "Спеллы ГМ-а по умолчанию",
    ["ma_LearnLangButton"] = "Все языки",--remove
    ["ma_LearnClassButton"] = "Все классовые спеллы",
    ["ma_SearchButton"] = "Поиск...",
    ["ma_ResetButton"] = "Очистить",
    ["ma_KickButton"] = "Выкинуть",
    ["ma_KillButton"] = "Убить",
    ["ma_DismountButton"] = "Снять",
    ["ma_ReviveButton"] = "Оживить",
    ["ma_SaveButton"] = "Сохранить",
    ["ma_AnnounceButton"] = "Обьявить",
    ["ma_ShutdownButton"] = "Отрубить!",
    ["ma_ItemVar1Button"] = "Кол-во",
    ["ma_ObjectVar1Button"] = "Расклад ЛУТА",
    ["ma_ObjectVar2Button"] = "Время спауна",
    ["ma_LoadTicketsButton"] = "Показать тикеты",
    ["ma_GetCharTicketButton"] = "Притащить игрока",
    ["ma_GoCharTicketButton"] = "К игроку",
    ["ma_AnswerButton"] = "Ответить",
    ["ma_DeleteButton"] = "Стереть",
    ["ma_TicketCount"] = "|cFF00FF00Тикеты:|r ",
    ["ma_TicketsNoNew"] = "Нет новых тикетов.",
    ["ma_TicketsNewNumber"] = "Есть |cffeda55f%s|r новых тикетов!",
    ["ma_TicketsGoLast"] = "Перейти с автору последнего тикета (%s).",
    ["ma_TicketsGetLast"] = "Притащить %s сюда!.",
    ["ma_IconHint"] = "|cffeda55fЖми|r чтобы открыть МангАдмин. |cffeda55fШифт+Клик|r чтобы перезагрузить интерфейс. |cffeda55fАлт+Клик|r сбросить счётчик тикетов.",
    ["ma_Reload"] = "Перезагрузить",
    ["ma_LoadMore"] = "Подгрузить...",
    ["ma_MailRecipient"] = "Получатель",
    ["ma_Mail"] = "Послать письмо",
    ["ma_Send"] = "Послать",
    ["made_by"] = "TestUnit",
    ["ma_MailSubject"] = "Тема",
    ["ma_MailYourMsg"] = "Сообщение !",
    ["ma_Online"] = "Онлайн",
    ["ma_Offline"] = "Оффлайн",
    ["ma_TicketsInfoPlayer"] = "|cFF00FF00Чар:|r ",
    ["ma_TicketsInfoStatus"] = "|cFF00FF00Статус:|r ",
    ["ma_TicketsInfoAccount"] = "|cFF00FF00Аккаунт:|r ",
    ["ma_TicketsInfoAccLevel"] = "|cFF00FF00Уровень акка:|r ",
    ["ma_TicketsInfoLastIP"] = "|cFF00FF00Последний IP:|r ",
    ["ma_TicketsInfoPlayedTime"] = "|cFF00FF00Время в игре:|r ",
    ["ma_TicketsInfoLevel"] = "|cFF00FF00Уровень:|r ",
    ["ma_TicketsInfoMoney"] = "|cFF00FF00Денег:|r ",
    ["ma_TicketsInfoLatency"] = "|cFF00FF00Пинг:|r ",
    ["ma_TicketsNoInfo"] = "Нет информации",
    ["ma_TicketsNotLoaded"] = "Нет инфы по тикету...",
    ["ma_TicketsNoTickets"] = "Нет тикетов!",
    ["ma_TicketTicketLoaded"] = "|cFF00FF00Загрузка тикета:|r %s\n\nИнфа чара\n\n",
    ["ma_FavAdd"] = "В избранное",
    ["ma_FavRemove"] = "Удалить",
    ["ma_SelectAllButton"] = "Выбрать всё",
    ["ma_DeselectAllButton"] = "Отменить всё",
    ["ma_MailBytesLeft"] = "Байт осталось: ",
    ["ma_WeatherFine"] = "Хорошая",
    ["ma_WeatherFog"] = "Туманно",
    ["ma_WeatherRain"] = "Дождь",
    ["ma_WeatherSnow"] = "Снег",
    ["ma_WeatherSand"] = "Пеcчаная",
    ["ma_Money"] = "Деньги",
    ["ma_Energy"] = "Энергия",
    ["ma_Rage"] = "Ярость",
    ["ma_Mana"] = "Мана",
    ["ma_Healthpoints"] = "Здоровье",
    ["ma_Talents"] = "Таланты",
    ["ma_Stats"] = "Статы",
    ["ma_Spells"] = "Спеллы",
    ["ma_Honor"] = "Честь",
    ["ma_Level"] = "Уровень",
    ["ma_AllLang"] = "Все языки",
    -- languages
    ["Common"] = "Общий",
    ["Orcish"] = "Орочий",
    ["Taurahe"] = "Таурий",
    ["Darnassian"] = "Дарнассийский",
    ["Dwarvish"] = "Карликовый",
    ["Thalassian"] = "Талассийский",
    ["Demonic"] = "Демонический",
    ["Draconic"] = "Драконий",
    ["Titan"] = "Титановый",
    ["Kalimag"] = "Калимагский",
    ["Gnomish"] = "Гномий",
    ["Troll"] = "Троллий",
    ["Gutterspeak"] = "Gutterspeak",
    ["Draenei"] = "Дренейский",
    ["ma_NoFavorites"] = "В избранном ничего нет!",
    ["ma_NoZones"] = "Сектор не найден!",
    ["ma_NoSubZones"] = "Нет под-сектора!",
    ["favoriteResults"] = "|cFF00FF00Избранные:|r ",
    ["Zone"] = "|cFF00FF00Сектор:|r ",
    ["tt_DisplayAccountLevel"] = "Показать твой уровень чара",
    ["tt_TicketOn"] = "Сообщать о новых тикетах.",
    ["tt_TicketOff"] = "Не сообщать о новых тикетах.",
    ["info_revision"] = "|cFF00FF00Версия МАНГОСА:|r ",
    ["info_platform"] = "|cFF00FF00Платформа сервака:|r ",
    ["info_online"] = "|cFF00FF00Игроков на линии:|r ",
    ["info_maxonline"] = "|cFF00FF00Максимум :|r ",
    ["info_uptime"] = "|cFF00FF00Время сервака:|r ",
    ["cmd_toggle"] = "Переключить на главное окно",
    ["cmd_transparency"] = "Прозрачность (0.5 or 1.0)",
    ["cmd_tooltip"] = "Переключить отображение подсказок",
    ["tt_SkillButton"] = "Включить функцию поиска скиллов и редактирования избранного.",
    ["tt_RotateLeft"] = "Повернуть влево.",
    ["tt_RotateRight"] = "Повернуть вправо.",
    ["tt_FrmTrSlider"] = "Изменить прозрачность фона.",
    ["tt_BtnTrSlider"] = "Изменить прозрачность кнопочек.",
    ["ma_SkillButton"] = "Поиск скилла",
    ["ma_SkillVar1Button"] = "Скилл",
    ["ma_SkillVar2Button"] = "Максимум скилл",
    ["tt_DisplayAccountLvl"] = "Отобразить уровень доступа.",
    --linkifier
    ["lfer_Spawn"] = "Spawn",
    ["lfer_List"] = "List",
	["lfer_Reload"] = "Перезагружать",
    ["lfer_Goto"] = "Goto",
    ["lfer_Move"] = "Move",
    ["lfer_Turn"] = "Turn",
    ["lfer_Delete"] = "Delete",
    ["lfer_Teleport"] = "Teleport",
    ["lfer_Morph"] = "Morph",
    ["lfer_Add"] = "Add",
    ["lfer_Remove"] = "Remove",
    ["lfer_Learn"] = "Learn",
    ["lfer_Unlearn"] = "Unlearn",
    ["lfer_Error"] = "Error Search String Matched but an error occured or unable to find type"
  }
end
