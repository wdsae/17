Процедура ОбработкаПроведения(Отказ,Режим)//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// регистр ОстаткиТоваров
	Движения.ОстаткиТоваров.Записывать = Истина;
	Движения.Закупки.Записывать = Истина;
	
	Для Каждого ТекСтрокаТовары из Товары Цикл
		Движение = Движения.ОстаткиТоваров.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Количество = ТекСтрокаТовары.Количество;
		Движение.Сумма = ТекСтрокаТовары.Сумма;

		Движение = Движения.Закупки.Добавить();
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Контрагент = Контрагент;
		Движение.Количество = ТекСтрокаТовары.Количество;
		Движение.Сумма = ТекСтрокаТовары.Сумма;
	КонецЦикла;
	
	// регистр РегистрБухУчет
	Движения.РегистрБухУчет.Записывать = Истина;
	Движение = Движения.РегистрБухУчет.Добавить();
	Движение.СчетДт = ПланыСчетов.БухУчет.Товары;
	Движение.СчетКт = ПланыСчетов.БухУчет.РасчетыСПоставщиками;
	Движение.Период = Дата;
	Движение.Сумма = СуммаДокумента;
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВКонецПроцедуры
КонецПроцедуры



Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	СуммаДокумента = Товары.Итог("Сумма");
КонецПроцедуры

