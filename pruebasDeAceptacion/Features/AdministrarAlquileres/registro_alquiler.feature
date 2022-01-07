Feature: registro_alquiler

Scenario: Crear un nuevo alquiler por el administrador
	Given se intenta crear un nuevo alquiler por el administrador
	When se insertan los siguientes datos como nuevo alquiler: <client>,<emb>,<horario>,<espc>
	Then se crea el nuevo alquiler con los datos: <client>,<emb>,<horario>,<espc>
	And se le notifica al amdinistrador que el alquiler fue creado correctamente
	And se envia un correo al cliente informandole del alquiler creado

| client           | emb                          | horario                 | espc        |
| royher@gmail.com | id: 23, desc:"barco grande" | 20 julio: 12:00 - 17:00 | con capitán |
| elsawong@gmail.com | id: 12, desc:"barco pequeño" | 21 julio: 11:00 - 13:00 | sin capitán |

Scenario: Registro de quien creo el alquiler
	Given el administrador <admin> crea un nuevo alquiler
	When se crea un nuevo alquiler
	Then se crea un nuevo alquiler en base de datos
	And se registra que el usuario <admin> creó el alquiler de id:<alq>

| admin          | alq |
| caty@gmail.com | 134 |
| orlando@gmail.com | 135 |
| andres@gmail.com | 136 |
| mohamed@gmail.com | 137 |

Scenario: Registro de alquiler con una embarcación no disponible
	Given la embarcación seleccionada no tiene fechas disponibles
	When se selecciona una embarcación no disponible
	Then se notifica que la embarcación no está disponible para esa fecha
