--{ id, имя, команда, параметры, описание}
--{ , , , , }
DMA.CommandsList = {
	{ 1, "GM", ".gm", "on\\off", "Включить/выключить ГМ режим. В этом режиме у вас над головой появится приписка <ГМ>"},
	{ 2, "VIS", ".gm vis", "on\\off", "Вы видны/невидны игрокам. Так же если вы будите писать сообщения в «белый» чат будучи невидимым, то игроки не увидят ваших сообщений"},
	{ 3, "CHAT", ".gm chat", "on\\off", "Включить/выключить ГМ чат. Если вы его выключаете то в чате не отображается значок BLIZZ, а у игроков не появляется отдельного чата если вы захотите с ними связаться"},
	{ 4, "WHISPER", ".whisper", "on\\off", "Включить/выключить личку в ГМ режиме"},
	{ 5, "FLY", ".gm fly", "on\\off", "Включает/отключает полёт персонажа по цели. Если нет цели то используется на вас"},
	{ 6, "TELE", ".tele", "...", "Телепортирует вас в указанную зону"},
	{ 7, "GPS", ".gps", "-", },
	{ 8, "GOXYZ", ".gp xyz", "<значение X> <значение Y> <значение Z>", "Телепортирует вас по указанным координатам"},
	{ 9, "GOZONE", ".go zone", "<значение X> <значение Y> <AreaID>", "Телепортирует вас в определенную зону какой-либо локации. Как говорил Морган: «Пример ».go zone 40 40 1519 отправит вроде как в Штормград. Я надеюсь."},
	{ 10, "GOZAXIS", ".go zaxis", "<значение>", " Команда перемещает вас вверх или вниз, в зависимости от того, какое значение будет вписано. Если перед цифрой стоит + или -, то перемещение будет относительным"},
	{ 11, "GOFORWARD", ".go forward", "<значение>", "Команда перемещает вас вперед или назад(перед там, куда смотрит ваш персонаж), в зависимости от того, какое значение будет вписано"},
	{ 12, "GOBADD", ".gob add", "<id>", "Поставить ГО с указанным ID"},
	{ 13, "GOBDEL", ".gob del", "<id>", "Удалить ГО с указанным ID"},
	{ 14, "GOBNEAR", ".gob near", "<знчение>", "В чате показываются все ГО в указанном радиусе"},
	{ 15, "GOBTAR", ".gob target", "-", "Берет в таргет ближайшую к вам ГО"},
	{ 16, "GOBMOVE", ".gob move", "<GUID> или взятая в .gob target ГО", "Передвигает ГО в вашу позицию"},
	{ 17, "LOOKUP", ".lookup", "area\\craeture\\event\\faction\\item\\itemset\\object\\player+\\skill\\spell+\\taxinode\\tele\\map + <название>", "Поиск названия по выбранной категории."},
	{ 18, "NPCADD", ".npc add", "<id>", "Добавляет NPC с указанным ID"},
	{ 19, "NPCDEL", ".npc del", "<GUID>", "Удаляет NPC. Если не указан GUID то удаляет NPC по таргету"},
	{ 20, "NPCNEAR", ".npc near", "<значение>", "Поиск NPC в указанном радиусе"},
	{ 21, "NPCFOLLOW", ".npc follow", "<target>", "NPC начинает следовать за вами"},
	{ 22, "NPCFOLLOWSTOP", ".npc follow stop", "<target>", "NPC прекращает следовать за вами"},
	{ 23, "NPCINFO", ".npc info", "<target>", "Показывает информацию о NPC"},
	{ 24, "NPCMORPH", ".npc set mod displayID", "<target> <displayID>", "Изменяет модель NPC"},
	{ 25, "NPCEMOTE", ".npc playemote", "<emoteID>", "NPC будет проигрывать определенную анимацию"},
	{ 26, "COMETOME", ".cometome", "<target>", "NPC передвигается на вашу позицию"},
	{ 27, "POSESS", ".poss", "<target>", "Взять <target> под контроль"},
	{ 28, "UNPOSESS", ".unposs", "<target>", "Снять ваш контроль с <target>"},
	{ 29, "NPCFACTION", ".npc set fa", "<id>", "Меняет фракцию NPC (35 - нейтралитет ко всем)"},
	{ 30, "NPCSETSPAWN", ".npc set spawn", "<значение>", "NPC будет ходить по указанной области. Рекомендуемое значение 3-5."},
	{ 31, "NPCSCALE", ".npc set scale", "<значение", "Меняет размер NPC в <scale> раз перманентно. Не рекомендуется использовать слишком большие значения. Размер некоторых NPC не меняется"},
	{ 32, "CHARRENAME", ".char rename", "<target>\\<name>", "Отметить персонажа для смены ника"},
	{ 33, "CHARRERACE", ".char changerace", "<target>\\<name>", "Отмечает персонажа для смены расы"},
	{ 34, "CHARCUST", ".char cust", "<target>\\<name>", "Отмечает персонажа для смены внешности"},
	{ 35, "CHARFACTION", ".char changefaction", "<target>\\<name>", "Отмечает персонажа для смены фракции"},
	{ 36, "SUMM", ".summ", "<target>\\<name>", "Телепортирует персонажа к вашей позиции"},
	{ 37, "RECALL", ".recall", "<target>", "Возвращает персонажа на ту позицию, на которой он находился до сумона (до .summ)"},
	{ 38, "APP", ".app", "<target>\\<name>", "Вы телепортируетесь к позиции персонажа"},
	{ 39, "KICK", ".kick", "<name>", "Выкидывает персонажа из игры"},
	{ 40, "FREEZE", ".freeze", "<target>", "На персонажа появляется/снимается дебафф, который не позволяет двигаться"},
	{ 41, "UNFREEZE", ".unfreeze", "<target>", "С персонажа снимается дебафф, который не позволял двигаться"},
	{ 42, "MUTE", ".mute", "<name> <время в минутах(30m)> <причина>", "Игрок не сможет говорить в течении определенного времени"},
	{ 43, "DIE", ".die", "<target>", "Убить"},
	{ 44, "REVIVE", ".revive", "<target>", "Воскресить"},
	{ 45, "TELENAME", ".tele name", "<name> <название зоны>", "Телепортирует персонажа в указанную зону"},
	{ 46, "PINFO", ".pinfo", "<target>\\<name>", "Показывает информацию о персонаже"},
	{ 47, "GMNAME", ".gmname", "<текст>", "Чат ГМов внутри игры."},
	{ 48, "ANNOUNCE", ".nameannounce", "<текст>", "Дать объявление на весь сервер."},
	{ 49, "HELP", ".help", "<название команды>", "Выдаёт помощь по команде. Пример: .help summon"},
	{ 49, "VIEWALL", ".cheat explore", "0\\1", "Открывает или скрывает все карты для выбранного игрока"},
	{ 49, "WATERWALK", ".cheat waterwalk", "on\\off", "Включает или выключает хождение по воде для выбранного игрока"},
	{ 49, "TAXI", ".cheat taxi", "on\\off", "Открывает или скрывает все маршруты распорядителей полётов для выбранного игрока"}
}
