Feature: modificar_alquiler

Scenario: Se aprueba el alquiler
	Given el alquiler está pendiente de aprobar
	When se pone el alquiler como aprobado
	Then se cambia el estado del alquiler por aprobado
	And se envia un correo al cliente informandole que su alquiler fue aprobado
	And se informa en la página del admin que el alquiler fue aprobado

Scenario: Cambio de horario del alquiler
	Given la embarcación del alquiler tiene los horarios que se quieren cambiar disponibles
	When se intenta cambiar el horario de alquiler
	Then se cambia el horario del alquiler
	And se informa en la página del admin que el alquiler fue modificado
	
Scenario: Cambio de horario del alquiler para un horario no disponible
	Given la embarcación no tiene horarios disponibles
	When se intenta cambiar el horario del alquiler
	Then no se cambia el horario del alquiler
	And se le notifica al administrador que el horario no fue modificado porque el seleccionado no está disponible

