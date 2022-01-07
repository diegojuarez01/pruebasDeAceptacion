Feature: obtener_resultados_de_busqueda_alquileres

Scenario: Buscar alquileres con costo menor de un número
	Given en la base de datos hay <cantAlq> alquileres con costo menor de <maxCost>
	When se filtra por los alquileres con menor costo de <maxCosto>
	Then se muestran <cantAlq> alquileres

| cantAlq | maxCosto |
| 5       | 50       |
| 3       | 30       |
| 7       | 100      |

Scenario: Buscar alquileres pendientes de aprobar
	Given en la base de datos hay <cantAlq> alquileres pendientes de aprobar
	When se filtra por los alquileres pendientes de aprobar
	Then se muestran <cantAlq> alquileres

	| cantAlq |
	| 5       |
	| 10      |
	| 12      |
	| 3       |

Scenario: Buscar alquileres cuando no hay
	Given el cliente <client> no tiene alquileres
	When se buscan los alquileres reservados por el cliente <client>
	Then se muestra un cartel indicando que no hay alquileres con esas características

Scenario: Buscar alquileres de un cliente específico
	Given el cliente <client> tiene <cantAlq> alquileres
	When se piden todos los alquileres del cliente <client>
	Then se muestran <cantAlq>

| client              | cantAlq |
| ernn@gmail.com      | 3       |
| bclopez@gmail.com   | 5       |
| wenztifani@yahoo.es | 1       |

Scenario: Hay mas alquileres que lo permitido para ver por el paginado
	Given hay un paginado por defecto de <limit>
	When se buscan alquileres con unas condiciones específicas que <cantAlq> alquileres cumplen con las condiciones
	Then se muestran <limit> alquileres
	And se indican que hay <pagPend> páginas de alquileres

| cantAlq | limit | pagPend |
| 23      | 20    | 2       |
| 21      | 10    | 3       |
| 35      | 10    | 4       |
| 56      | 20    | 3       |