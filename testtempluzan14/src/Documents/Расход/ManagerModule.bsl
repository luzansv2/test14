#Если Сервер или ТолстыйКлиентОбычноеПриложение или ВнешнееСоединение Тогда

	
Процедура ЭтоСервер() Экспорт	
	
	#Если Сервер Тогда
	
		Сообщить("Это сервер");
	#КонецЕсли

	#Если Клиент Тогда
		Сообщить("Это клиент");
	#КонецЕсли

	//#Если ТолстыйКлиентУправляемоеПриложение Тогда
	//	Сообщить("Это ТолстыйКлиентУправляемоеПриложение ");
	//#КонецЕсли
	
	ом_ЭтоСервер.ЭтоСервер();
	
КонецПроцедуры	


#КонецЕсли
