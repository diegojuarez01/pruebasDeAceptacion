Feature: cancelar_alquiler

Scenario: Cancelar un alquiler pendiente de aprobar
	Given se intenta cancelar un alquiler
	When el alquiler está pendiente de aprobar 
	Then se cancela el alquiler
	And se muestra un aviso en la página informando que la cancelación se realizó con éxito
	And se le envia un correo al cliente informandole de la cancelación

Scenario: Cancelar un alquiler pagado
	Given se intenta cancelar un alquiler
	When el alquiler ya ha sido pagado
	Then se cancela el alquiler
	And se crea un proceso nuevo para que sea devuelto el precio del alquiler al cliente
	And se muestra un aviso en la página informando que la cancelación se realizó con éxito
	And se le envia un correo al cliente informandole de la cancelación y de la devolución de su dinero
	
Scenario: Cancelar un alquiler ya consumido
	Given se intenta cancelar un alquiler
	When el alquiler ya ha sido consumido por el cliente
	Then no se cancela el alquiler
	And se le informa al administrador que el alquiler no se puede cancelar porque ya ha sido consumido por el cliente


