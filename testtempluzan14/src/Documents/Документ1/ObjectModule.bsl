
Процедура ПриУстановкеНовогоНомера(СтандартнаяОбработка, Префикс)
	
	СтандартнаяОбработка = Ложь;
	УстановитьПрефикс(Префикс);
	ПолучитьНовыйНомер(ЭтотОбъект, Префикс, "000");
	ЭтотОбъект.Номер = ЭтотОбъект.ДополнительныеСвойства.НовыйНомер;
	
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр РегистрНакопления1 Приход
	Движения.РегистрНакопления1.Записывать = Истина;
	Движение = Движения.РегистрНакопления1.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Измерение1 = Номер;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	// Вставить содержимое обработчика.
КонецПроцедуры

Процедура ОбработкаУдаленияПроведения(Отказ)
	// Вставить содержимое обработчика.
КонецПроцедуры

Процедура ОбработкаФормированияПоВерсииИсторииДанных(ДанныеВерсии, НомерВерсии, ИсключитьДанные, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	ВключитьИсторияДанных();
	
	Если ЭтотОбъект.ЭтоНовый() Тогда
		ЭтотОбъект.ДополнительныеСвойства.Вставить("пмт_ЭтоНовый", Истина);
	Иначе
		ЭтотОбъект.ДополнительныеСвойства.Вставить("пмт_ЭтоНовый", Ложь);
	КонецЕсли;
	
КонецПроцедуры

Процедура ПередУдалением(Отказ)
	// Вставить содержимое обработчика.
КонецПроцедуры

Процедура ПриЗаписи(Отказ)

	Если ЭтотОбъект.ДополнительныеСвойства.пмт_ЭтоНовый Тогда
	
		Префикс = Константы.ПрефиксУзла.Получить()+"-";
		ОписаниеТипаЧисло = новый ОписаниеТипов("Число",Новый КвалификаторыЧисла(15,0));
		Число = ОписаниеТипаЧисло.ПривестиЗначение(Прав(ЭтотОбъект.Номер,6));		
		
		//НайтиМаксимальныйНомер(ЭтотОбъект, Префикс, "000");
		//ЭтотОбъект.УстановитьНовыйНомер(Префикс);
		
	//	Если Лев(ЭтотОбъект.Номер,3) <> Лев(Префикс,3) или Число=1 Тогда
	//	СкорректироватьНомерПродолжитьНумерацию(ЭтотОбъект, Префикс, "000");
	//	ЭтотОбъект.УстановитьНовыйНомер(Префикс);
	//КонецЕсли;	
	//
	//Если ЭтотОбъект.ДополнительныеСвойства.Свойство("НовыйНомер") Тогда
		//Пока ЭтотОбъект.Номер < ЭтотОбъект.ДополнительныеСвойства.НовыйНомер Цикл
		//    НайтиМаксимальныйНомер(ЭтотОбъект, Префикс, "000");
		//	ЭтотОбъект.УстановитьНовыйНомер(Префикс);
		//КонецЦикла;	
	КонецЕсли;
	
КонецПроцедуры

Процедура ПриКопировании(ОбъектКопирования)
	// Вставить содержимое обработчика.
КонецПроцедуры

Процедура УстановитьПрефикс(Префикс)
	
	Префикс = Константы.ПрефиксУзла.Получить()+"-";
	
КонецПроцедуры	

Процедура ПолучитьНовыйНомер(ЭтотОбъект, Префикс, ПрефиксПредыдущий)
	
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ ПЕРВЫЕ 1
	|	МАКСИМУМ(Документ1.Номер) КАК Номер
	|ИЗ
	|	Документ.Документ1 КАК Документ1
	|ГДЕ
	|	Документ1.Номер ПОДОБНО &Номер
	|
	|УПОРЯДОЧИТЬ ПО
	|	Номер
	|АВТОУПОРЯДОЧИВАНИЕ";
	
	Запрос.УстановитьПараметр("Номер", ПрефиксПредыдущий+"%");
	
	Результат = Запрос.Выполнить();
	Выборка = Результат.Выбрать();
	Если Выборка.Следующий() Тогда
		
		НомерЧисломСтрока = Прав(Выборка.Номер,6);
		ОписаниеТипаЧисло = новый ОписаниеТипов("Число",Новый КвалификаторыЧисла(15,0));
		НомерЧислом = ОписаниеТипаЧисло.ПривестиЗначение(НомерЧисломСтрока) ;		
		
		Если НомерЧислом = 0 Тогда
			Возврат;
		КонецЕсли;	
		
		НомерЧислом = НомерЧислом+1;
		
		НомерЧистый = Формат(НомерЧислом, "ЧЦ=" + 6 + "; ЧВН=; ЧГ=0");
		ЭтотОбъект.ДополнительныеСвойства.Вставить("НовыйНомер", Префикс+НомерЧистый);
	КонецЕсли;	
	
КонецПроцедуры	


Процедура ВключитьИсторияДанных()
	
	Настройки = Новый НастройкиИсторииДанных; 
	Настройки.Использование = Истина; 
	//Настройки.ИспользованиеПолей.Вставить("Реквизит1", Истина); 
	//Настройки.ИспользованиеПолей.Вставить("Товары.Цена", Истина); 
	ИсторияДанных.УстановитьНастройки(Метаданные.Документы.Документ1, Настройки);
	
КонецПроцедуры