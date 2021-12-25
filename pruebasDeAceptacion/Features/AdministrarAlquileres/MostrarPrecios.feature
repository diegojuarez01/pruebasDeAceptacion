Feature: Mostrar Precios

Scenario: Se revisa el precio de alquiler de una embarcación
	Given La embarcación tiene un precio de <precioEmbarcacionDB> EUR
	When Se accede a la embarcación
	Then Se muestra la embarcación con el precio <precioEmbarcacion> EUR

Scenario: Se revisa el precio de alquiler de una embarcación con un precio sin decimales
	Given La embarcación tiene un precio de alquiler sin decimales
	When Se accede a la embarcación
	Then Se muestra el precio de alquiler de la embarcación con dos lugares decimales (.00)

Scenario: Se revisa el precio de alquiler de una embarcación en un horario pico
	Given La embarcación tiene una tarifa de alquiler de <precioEmbarcacionDB> * 2 desde las 20:00 hasta las 22:00
	When Se revisa el precio de la embarcación desde las 18:00 hasta las 22:00
	Then Se muestra el precio <precioEmbarcacionHoraPico>

| precioEmbarcacionDB | precioEmbarcacion | precioEmbarcacionHoraPico |
| 20                  | 20.00             | 120.00                    |
| 23.35               | 23.35             | 140.10                    |
| 17.65               | 17.65             | 105.90                    |
| 30                  | 30.00             | 180.00                    |