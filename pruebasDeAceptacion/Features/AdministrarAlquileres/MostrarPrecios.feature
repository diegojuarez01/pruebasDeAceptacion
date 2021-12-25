Feature: Mostrar Precios

Scenario: Se revisa el precio de un alquiler
	Given El alquiler tiene un precio de <precioAlquilerDB> EUR
	When Se accede a la embarcación
	Then Se muestra la embarcación con el precio <precioAlquiler> EUR

Scenario: Se revisa el precio de alquiler con un precio sin decimales
	Given El alquiler tiene un precio sin decimales
	When Se accede al alquiler
	Then Se muestra el precio de un alquiler con dos lugares decimales (.00)

Scenario: Se revisa el alquiler de una embarcación en un horario pico
	Given La embarcación tiene una tarifa de alquiler de <precioAlquilerDB> * 2 desde las 20:00 hasta las 22:00
	When Se revisa el precio de la embarcación desde las 18:00 hasta las 22:00
	Then Se muestra el precio <precioAlquilerHoraPico>

| precioAlquilerDB | precioAlquiler | precioAlquilerHoraPico |
| 20                  | 20.00             | 120.00                    |
| 23.35               | 23.35             | 140.10                    |
| 17.65               | 17.65             | 105.90                    |
| 30                  | 30.00             | 180.00                    |