
&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	//ТекущийОбъект.ДополнительныеСвойства.Вставить("Назначить", Истина);
	//ТекущийОбъект.ДополнительныеСвойства.Вставить("НовыйНомер", ЭтотОбъект.НовыйНомер);

КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	//Вставить содержимое обработчика
	
	ВключитьИсторияДанных();
	
КонецПроцедуры

Процедура ВключитьИсторияДанных()
	
	Настройки = Новый НастройкиИсторииДанных; 
	Настройки.Использование = Истина; 
	//Настройки.ИспользованиеПолей.Вставить("Комментарий", Истина); 
	//Настройки.ИспользованиеПолей.Вставить("Товары.Цена", Истина); 
	ИсторияДанных.УстановитьНастройки(Метаданные.Документы.Документ1, Настройки);
	
КонецПроцедуры