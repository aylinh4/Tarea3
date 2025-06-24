
% Base de datos de alimentos
entrada(paella, 200).
entrada(gazpacho, 150).
entrada(pasta, 300).
entrada(ensalada_cesar, 180).
entrada(sopa_de_verduras, 120).

principal(filete_de_cerdo, 400).
principal(pollo_asado, 280).
principal(bisteck_a_lo_pobre, 500).
principal(trucha, 160).
principal(bacalao, 300).
principal(salmon_a_la_plancha, 350).
principal(lasagna, 450).

postre(flan, 200).
postre(naranja, 50).
postre(nueces, 500).
postre(yogurt, 100).
postre(helado, 250).



% Sistema de calculos de calorias
principal :-
  write("-----------------------------"), nl,
  write("BIENVENIDO A MI MEJOR COMIDA"), nl,
  write("-----------------------------"), nl,
  menu.

% Menu 
menu :-
  repeat,
  (
    write("1. Calcular calorías de un menú específico"), nl,
    write("2. Mostrar combinaciones bajas en calorías"), nl,
    write("3. Salir"), nl,
    write("Seleccione una opción(1-3): "),
    read(Opcion),
    (
      Opcion == 1 -> calcular_menu, fail;
      Opcion == 2 -> mostrar_opciones, fail;
      Opcion == 3 -> write("Saliendo del sistema..."), nl, !;
      write("Intente nuevamente. Escriba 1, 2 o 3"), nl, fail
    )
  ).


% Opcion 1 (Calcular menu)
calcular_menu :-
  write("Ingrese el nombre de la entrada(ej:ensalada_cesar): "), read(Entrada),
  write("Ingrese el nombre del plato principal(ej:bisteck_a_lo_pobre): "), read(PlatoP),
  write("Ingrese el nombre del postre(ej:flan): "), read(Postre),
  total_calorias(Entrada, PlatoP, Postre, Total),
  mostrar_resultado(Total).

% Opcion 2 (Mostrar menus bajo limite de calorias)
mostrar_opciones :-
  write("--- MENÚS BAJOS EN CALORÍAS ---"), nl,
  write("Ingrese el máximo de calorías deseado (330-1300): "), read(LimiteCal),
  write("Menus posibles bajo el limite de calorias:"), nl,
  (opciones_limite_cal(LimiteCal) -> true; write("No se encontraron más combinaciones válidas"), nl).



% Regla para calcular calorias totales de un menu
total_calorias(Entrada, Principal, Postre, Total) :-
    entrada(Entrada, Cal_Entrada),
    principal(Principal, Cal_Principal),
    postre(Postre, Cal_Postre),
    Total is Cal_Entrada + Cal_Principal + Cal_Postre.

% Regla para mostrar opciones bajo limite de calorias ingresado (op2)
opciones_limite_cal(LimiteCal) :-
    entrada(Entrada, Cal_Entrada),
    principal(Principal, Cal_Principal),
    postre(Postre, Cal_Postre),
    Total is Cal_Entrada + Cal_Principal + Cal_Postre,
    Total =< LimiteCal,
    write("Entrada: "), write(Entrada),nl,
    write("Principal: "), write(Principal),nl,
    write("Postre: "), write(Postre),nl,
    write("Total calorías: "), write(Total), nl,
    write("-----------------------------"), nl,
    fail.


% Mostrar resultado de calorias
mostrar_resultado(Total) :-
  write("Calorías totales del menú: "), write(Total), nl,
  write("-----------------------------"), nl.
