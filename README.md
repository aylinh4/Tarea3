# Tarea3
El sistema tiene tres tipos de alimentos, cada uno definido con su nombre y cantidad de calorías.

Menú ofrece tres opciones:
Opción 1: calcular las calorías de un menú elegido por el usuario.
Opción 2: mostrar todas las combinaciones posibles bajo un límite de calorías que ingresa el usuario.
Opción 3: salir del sistema.
Un repeat para se repita hasta que el usuario seleccione "Salir"


Opcion1: calcular_menu:
Aquí el usuario ingresa los nombres exactos de una entrada, plato principal y postre.
Luego el sistema llama a:
total_calorias(Entrada, Principal, Postre, Total)
Esta regla busca las calorías individuales y las suma, luego se muestra el total.

Opcion2: mostrar_opciones:
Esta opción le pide al usuario un valor límite de calorías, Luego el sistema recorre todas las combinaciones posibles de entrada, plato principal y postre. Luego imprime solo las opciones que no excedan el límite de calorías en: Total =< LimiteCal.
El fail obliga a Prolog a seguir buscando más combinaciones válidas.


Mostrar resultado: 
Muestra de forma simple el número total de calorías calculadas para el menú personalizado por el usuario.
