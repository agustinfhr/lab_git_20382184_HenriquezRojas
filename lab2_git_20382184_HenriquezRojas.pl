
%Los ejemplos de las funcionalidades se encuentran al final del codigo 


%////////////// REPRESENTACION //////////////
/*
usuario => [nombre, contrasenia, fecha, [seguidores], [seguidos], [id_publicaciones], [p_compartidas_yo], [p_compartidas_otro]]

post => [id_post, contenido_post, autor_post, fecha_post]

socialNetwork => [[Usuario1, Usuario2, ...], [Post1, Post2, ...], [Usuario_activo], Name, Date]
*/


% Dominios 


%  ////// USUARIO //////
/*
Nombre = string representa el nombre de usuario
Contrasenia = string que representa la contraseña del usuario
Fecha = lista de enteros que representa la fecha de registro del usuario 
Seguidores = lista de strings que contiene a los seguidores del usuario 
Seguidos = lista de strings que contiene a los seguidos por el usuario  
Id_publicaciones = lista de enteros que contiene los ids de las publcaciones que ha realizado el usuario
P_compartidas_yo = lista que contiene las publicaciones que el usuario ha compartido 
P_compartidas_otro = lista que contiene las publicaciones que le han compartio al usuario 
*/
%  ////// PUBLICACIONES(Post) //////
/*
Id_post = entero que representa el id de la publicacion
Contenido_post = string que representa el contenido de la publicacion 
Autor_post = string que representa el autor de la publicacion 
Fecha_post = lista de enteros que contiene la fecha de la publicacion 
*/
% ////// SOCIALNETWORK //////
/*
Usuarios = lista que contiene los usuarios de la socialnetwork 
Posts = lista que contiene las publicaciones de la socialnetwork 
Usuario_activo = lista que contiene al usuario activo
Name = string que representa el nombre de la socialNetrwork 
Date = lista de enteros que contiene la fecha de creacion de la socialnetwork 
*/

% /////// FECHA ///////
/*
 DD = entero que representa el dia de la fecha
 MM = entero que representa el mes de la fecha
 YYYY = entero que representa el año de la fecha
*/



% Predicados


% ////// Constructores ///////
/*
set_usuario(Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro, Usuario_generado)
set_post(Id_post, Contenido_post, Autor_post, Fecha_post, Post_generado)
socialNetwork([Usuarios, Posts, Usuario_activo, Name, Date], SOut)
date(DD, MM, YYYY, Date)
*/
% ////// Selectores //////
/*
---- Usuario ----
get_nombre([Nombre|T], Nombre_s)
get_contrasenia([Nombre|[Contrasenia|T]], Contra_s)
get_fecha_user([Nombre|[Contrasenia|[Fecha|T]]], Fecha_s)
get_seguidores([Nombre|[Contrasenia|[Fecha|[Seguidores|T]]]], Seguidores_s)
get_seguidos([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|T]]]]], Seguidos_s)
get_Id_publicaciones([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|[Id_publicaciones|T]]]]]], Id_publicaciones_s)
get_P_compartidas_yo([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|[Id_publicaciones|[P_compartidas_yo|T]]]]]]], P_compartidas_yo_s)
get_P_compartidas_otro([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|[Id_publicaciones|[P_compartidas_yo|[P_compartidas_otro|T]]]]]]]], P_compartidas_otro_s) 


---- Publicacion ----
get_Id_post([Id_post|T], Id_post_s)
get_Contenido_post([Id_post|[Contenido_post|T]], Contenido_post_s)
get_Autor_post([Id_post|[Contenido_post|[Autor_post|T]]], Autor_post_s)
get_Fecha_post([Id_post|[Contenido_post|[Autor_post|[Fecha_post|T]]]], Fecha_post_s)


---- Otros ----
get_usuario([[H|T1]|T2], Nombre, Usuario_encontrado)
*/

% ////// Pertenencia //////
/*
es_usuario([Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro])
es_post([Id_post, Contenido_post, Autor_post, Fecha_post])
es_lista_enteros([H|T])
es_lista_strings([H|T])
es_lista_usuarios([H|T])
es_lista_usuario_activo([H|T])
es_lista_post([H|T])
es_socialNetwork([Usuarios, Publicaciones, Usuario_activo, Name, Date])
es_nombre_disponible([[H|T1]|T2], Nombre)
es_usuario_registrado([[H|T1]|T2], Nombre, Contrasenia)
*/


% ////// Otros predicados //////
/*
remover(Elemento, [Elemento|T], T)
eliminar_usuario([H|T], Nombre, Resultado)
nuevoId([_|L], C)
usuarioTostring([Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro], UsuarioStr)
usuarioStostring([H|T], Auxiliar, UsuariosString)
postTostring([Id_post, Contenido_post, Autor_post, Fecha_post], PostStr)
postStostring([H|T], Auxiliar, PostsString)
usuarioactivoTostring([Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro], Usuario_activo)



 ---- Register ----

socialNetworkRegister([H|[T1|[T2|[T3|[T4|_]]]]], Nombre, Contrasenia, Date, SocialNetwork2)


 ---- Login ----

socialNetworkLogin([H|[T1|[T2|[T3|[T4|_]]]]], Nombre, Contrasenia, SocialNetwork2)


 ---- Post ----

socialNetworkPost([H|[T1|[[T2|_]|[T3|[T4|_]]]]], Fecha, Texto, SocialNetwork2)


 ---- Follow ----

socialNetworkFollow([H|[T1|[[T2|_]|[T3|[T4|_]]]]], Nombre, SocialNetwork2)


 ---- Share ----

socialNetworkShare([H|[T1|[[T2|_]|[T3|[T4|_]]]]], Fecha, PostId, Nombre, SocialNetwork2)


 ---- SocialNetworkToString ----

socialNetworkToString( [H|[T1|[[T2|_]|[T3|[T4|_]]]]], SocialNetworkStr)

*/





% METAS !!!!!!!!!!!!!!!!!!


% Principales:
/*
socialNetworkRegister
socialNetworkLogin
socialNetworkPost
socialNetworkFollow
socialNetworkShare
socialNetworkToString
socialNetwork
date
*/
  
%  Secundarias:
/*
set_usuario
set_post

get_nombre
get_contrasenia
get_fecha_user
get_seguidores
get_seguidos
get_Id_publicaciones
get_P_compartidas_yo
get_P_compartidas_otro

get_Id_post
get_Contenido_post
get_Autor_post
get_Fecha_post

get_usuario

es_usuario
es_post
es_lista_enteros
es_lista_strings
es_lista_usuarios
es_lista_usuario_activo
es_lista_post
es_socialNetwork
es_nombre_disponible
es_usuario_registrado

remover
eliminar_usuario
nuevoId
usuarioTostring
usuarioStostring
postTostring
postStostring
usuarioactivoTostring
*/


% REGLAS Y HECHOS 


% ///////////// Constructores ///////// 

/*
 Descripción de la relación: Constructor de un usuario.
 Entrada: str x str x list x list x list x list x list x list x variable
 Salida: variable list (usuario) ó bool 
*/
set_usuario(Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro, Usuario_generado) :-
	es_usuario([Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro]),
	append([], Usuario_generado, [Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro]).


/*
 Descripción de la relación: Constructor de una publicacion.
 Entrada: int x str x str x list x variable
 Salida: variable list (post) ó bool
*/
set_post(Id_post, Contenido_post, Autor_post, Fecha_post, Post_generado) :-
	es_post([Id_post, Contenido_post, Autor_post, Fecha_post]),
	append([], Post_generado, [Id_post, Contenido_post, Autor_post, Fecha_post]).

/*
 Descripción de la relación: Constructor de socialnetwork.
 Entrada: list x variable 
 Salida: variable list (usuarios, post) ó bool
*/
socialNetwork([Usuarios, Posts, Usuario_activo, Name, Date], SOut) :-
	es_socialNetwork([Usuarios, Posts, Usuario_activo, Name, Date]),
	append([], SOut, [Usuarios, Posts, Usuario_activo, Name, Date]).

/*
 Descripción de la relación: Constructor de date(fecha).
 Entrada: int x int x int 
 Salida: variable list 
*/
date(DD, MM, YYYY, Date) :-
	integer(DD),
	integer(MM),
	integer(YYYY),
	DD =< 31,
	DD > 0,
	MM =< 12,
	MM > 0,
	YYYY >= 2021,
	YYYY < 2050,
	append([], Date, [DD, MM, YYYY]).


% //////////// Selectores ///////////


%        TDA USUARIO

/*
 Descripción de la relación: Predicado selector del nombre de usuario.
 Entrada: list x variable
 Salida: variable (str) ó bool
*/
get_nombre([Nombre|T], Nombre_s) :-
	es_usuario([Nombre|T]),
	append([], Nombre_s, Nombre).


/*
 Descripción de la relación: Predicado selector de la contraseña del usuario.
 Entrada: list x variable
 Salida: variable (str) ó bool
*/
get_contrasenia([Nombre|[Contrasenia|T]], Contra_s) :-
	es_usuario([Nombre|[Contrasenia|T]]),
	append([], Contra_s, Contrasenia).


/*
 Descripción de la relación: Predicado selector de la fecha del usuario.
 Entrada: list x variable
 Salida: variable (int) ó bool
*/
get_fecha_user([Nombre|[Contrasenia|[Fecha|T]]], Fecha_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|T]]]),
	append([], Fecha_s, Fecha).


/*
 Descripción de la relación: Predicado selector de los seguidores del usuario.
 Entrada: list x variable
 Salida: variable (lista de str) ó bool
*/
get_seguidores([Nombre|[Contrasenia|[Fecha|[Seguidores|T]]]], Seguidores_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|T]]]]),
	append([], Seguidores_s, Seguidores).


/*
 Descripción de la relación: Predicado selector de los seguidos por el usuario.
 Entrada: list x variable
 Salida: variable (lista de str) ó bool
*/
get_seguidos([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|T]]]]], Seguidos_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|T]]]]]),
	append([], Seguidos_s, Seguidos).


/*
 Descripción de la relación: Predicado selector de los ids de publicaciones del usuario.
 Entrada: list x variable
 Salida: variable (lista de int) ó bool
*/
get_Id_publicaciones([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|[Id_publicaciones|T]]]]]], Id_publicaciones_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|[Id_publicaciones|T]]]]]]),
	append([], Id_publicaciones_s, Id_publicaciones).


/*
 Descripción de la relación: Predicado selector de las publicaciones compartidas del usuario.
 Entrada: list x variable
 Salida: variable (lista de int) ó bool
*/
get_P_compartidas_yo([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|[Id_publicaciones|[P_compartidas_yo|T]]]]]]], P_compartidas_yo_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|[Id_publicaciones|[P_compartidas_yo|T]]]]]]]),
	append([], P_compartidas_yo_s, P_compartidas_yo).


/*
 Descripción de la relación: Predicado selector de las publicaciones que le han compartido al usuario.
 Entrada: list x variable
 Salida: variable (lista de int) ó bool
*/
get_P_compartidas_otro([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|[Id_publicaciones|[P_compartidas_yo|[P_compartidas_otro|T]]]]]]]], P_compartidas_otro_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Seguidos|[Id_publicaciones|[P_compartidas_yo|[P_compartidas_otro|T]]]]]]]]),
	append([], P_compartidas_otro_s, P_compartidas_otro).



%              TDA PUBLICACION(POST)

/*
 Descripción de la relación: Predicado selector del id de la publicacion.
 Entrada: list x variable
 Salida: variable (int) ó bool
*/
get_Id_post([Id_post|T], Id_post_s) :-
	es_post([Id_post|T]),
	append([], Id_post_s, Id_post).


/*
 Descripción de la relación: Predicado selector del contenido de la publicacion.
 Entrada: list x variable
 Salida: variable (str) ó bool
*/
get_Contenido_post([Id_post|[Contenido_post|T]], Contenido_post_s) :-
	es_post([Id_post|[Contenido_post|T]]),
	append([], Contenido_post_s, Contenido_post).


/*
 Descripción de la relación: Predicado selector del autor de la publicacion.
 Entrada: list x variable
 Salida: variable (str) ó bool
*/
get_Autor_post([Id_post|[Contenido_post|[Autor_post|T]]], Autor_post_s) :-
	es_post([Id_post|[Contenido_post|[Autor_post|T]]]),
	append([], Autor_post_s, Autor_post).


/*
 Descripción de la relación: Predicado selector de la fecha de la publicacion.
 Entrada: list x variable
 Salida: variable (fecha) ó bool
*/
get_Fecha_post([Id_post|[Contenido_post|[Autor_post|[Fecha_post|T]]]], Fecha_post_s) :-
	es_post([Id_post|[Contenido_post|[Autor_post|[Fecha_post|T]]]]),
	append([], Fecha_post_s, Fecha_post).



%             Otros Selectores 

/*
 Descripción de la relación: Predicado que selecciona un usuario por su nombre.
 Entrada: list(usuarios) x str x variable
 Salida: variable (usuario) ó bool
*/
get_usuario([[H|T1]|T2], Nombre, Usuario_encontrado) :-
	es_lista_usuarios([[H|T1]|T2]),
	string(Nombre),

	(H == Nombre,
	get_nombre([H|T1], Nombre_nuevo),
	get_contrasenia([H|T1], Contra_nueva),
	get_fecha_user([H|T1], Fecha_nueva),
	get_seguidores([H|T1], Seguidores_nuevo),
	get_seguidos([H|T1], Seguidos_nuevo),
	get_Id_publicaciones([H|T1], Id_publicaciones_nuevo),
	get_P_compartidas_yo([H|T1], P_compartidas_yo_nuevo),
	get_P_compartidas_otro([H|T1], P_compartidas_otro_nuevo),
	set_usuario(Nombre_nuevo, Contra_nueva, Fecha_nueva, Seguidores_nuevo, Seguidos_nuevo, Id_publicaciones_nuevo, P_compartidas_yo_nuevo, P_compartidas_otro_nuevo, Nuevo_usuario),
	append([], Nuevo_usuario, Usuario_encontrado));

	get_usuario(T2, Nombre, Usuario_encontrado).




% //////////// Pertenencia ////////////


/*
 Descripción de la relación: Predicado que verifica si corresponde a un usuario.
 Entrada: list (usuario)
 Salida: bool
*/
es_usuario([Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro]) :-
	string(Nombre),
	string(Contrasenia),
	es_lista_enteros(Fecha),
	es_lista_strings(Seguidores),
	es_lista_strings(Seguidos),
	es_lista_enteros(Id_publicaciones),
	(P_compartidas_yo \= [[]]),
	(P_compartidas_otro \= [[]]).
	

/*
 Descripción de la relación: Predicado que verifica si corresponde a una publicacion.
 Entrada: list (publicacion)
 Salida: bool
*/
es_post([Id_post, Contenido_post, Autor_post, Fecha_post]) :-
	integer(Id_post),
	string(Contenido_post),
	string(Autor_post),
	es_lista_enteros(Fecha_post).


/*
 Descripción de la relación: Predicado que verifica si corresponde a una lista de enteros.
 Entrada: list
 Salida: bool
*/
es_lista_enteros([H|T]) :-
	integer(H),
	es_lista_enteros(T).
es_lista_enteros([]). % caso base


/*
 Descripción de la relación: Predicado que verifica si corresponde a una lista de strings.
 Entrada: list
 Salida: bool
*/
es_lista_strings([H|T]) :-
	string(H),
	es_lista_strings(T).
es_lista_strings([]). % caso base


/*
 Descripción de la relación: Predicado que verifica si corresponde a una lista con usuarios.
 Entrada: list (usuarios)
 Salida: bool
*/
es_lista_usuarios([H|T]) :-
	es_usuario(H),
	es_lista_usuarios(T).
es_lista_usuarios([]). % caso base


/*
 Descripción de la relación: Predicado que verifica si corresponde a una lista con usuario activo.
 Entrada: list (usuarios)
 Salida: bool
*/
es_lista_usuario_activo([H|T]) :-
	es_usuario(H),
	es_lista_usuario_activo(T).
es_lista_usuario_activo([]).
es_lista_usuario_activo([[]]). % caso base

/*
 Descripción de la relación: Predicado que verifica si corresponde a una lista con publicaciones.
 Entrada: list (publicaciones)
 Salida: bool
*/
es_lista_post([H|T]) :-
	es_post(H),
	es_lista_post(T).
es_lista_post([]).


/*
 Descripción de la relación: Predicado que verifica si corresponde a una socialNetwork.
 Entrada: list(usuarios, publicaciones,  )
 Salida: bool
*/
es_socialNetwork([Usuarios, Publicaciones, Usuario_activo, Name, Date]) :-
	es_lista_usuarios(Usuarios),
	es_lista_post(Publicaciones),
	es_lista_usuario_activo(Usuario_activo),
	string(Name),
	es_lista_enteros(Date).
es_socialNetwork([]). % caso base

/*
 Descripción de la relación: Predicado que verifica si el nombre consultado se encuentra disponible.
 Entrada: list(usuarios) x str
 Salida: bool
*/
es_nombre_disponible([[H|T1]|T2], Nombre) :-
	string(Nombre),
	es_lista_usuarios([[H|T1]|T2]),
	H \= Nombre,
	es_nombre_disponible(T2, Nombre).
 es_nombre_disponible([], _). 

/*
 Descripción de la relación: Predicado que verifica si el nombre y la contraseña se encuentran registrados en socialNetwork.
 Entrada: list(usuarios) x str x str
 Salida: bool
*/
es_usuario_registrado([[H|T1]|T2], Nombre, Contrasenia) :-
	string(Nombre),
	string(Contrasenia),
	es_lista_usuarios([[H|T1]|T2]),

	get_contrasenia([H|T1], C_s),

	(H == Nombre,
	C_s == Contrasenia);

	es_usuario_registrado(T2, Nombre, Contrasenia).


% Otros Predicados 


/*
 Descripción de la relación: Predicado que elimina un elemento de una lista.
 Entrada: list x list x variable
 Salida: variable ó bool
*/
remover(Elemento, [Elemento|T], T).
remover(Elemento, [H|T], [H|T2]) :- remover(Elemento, T, T2).


/*
 Descripción de la relación: Predicado que elimina un usuario de la lista según el nombre.
 Entrada: list(usuarios) x str x variable
 Salida: list(usuarios) ó bool
*/
eliminar_usuario([H|T], Nombre, Resultado) :-
	es_lista_usuarios([H|T]),
	string(Nombre),
	get_usuario([H|T], Nombre, Usuario_encontrado),
	remover(Usuario_encontrado, [H|T], Resultado).
eliminar_usuario([], _, _).


/*
 Descripción de la relación: Predicado que crea un nuevo id.
 Entrada: list x variable
 Salida: variable(integer) ó bool
*/
nuevoId([_|L], C) :- nuevoId(L, C_ant), C is C_ant+1.
nuevoId([], 1).



/*
 Descripción de la relación: Predicado que convierte un usuario a string.
 Entrada: list(usuario) x variable 
 Salida: variable(usuario) ó bool
*/
usuarioTostring([Nombre, _, _, _, Seguidos, _, _, _], UsuarioStr) :-
	

	atom_string(Nombre, Str0),
	string_concat(Str0, "\n", Str1),
	string_concat(Str1, "      Sigue a: ", Str2),
	atomics_to_string(Seguidos, ',', Seguidos_str),
	string_concat(Str2, Seguidos_str, Str3),
	string_concat(Str3, "\n", UsuarioStr).

usuarioTostring([], "[]").



/*
 Descripción de la relación: Predicado que convierte una lista de usuarios a string.
 Entrada: list(usuarios) x variable 
 Salida: variable(usuarios) ó bool
*/
usuarioStostring([H|T], Auxiliar, UsuariosString) :-
	usuarioTostring(H, UsuarioStr),
	string_concat(UsuarioStr, Auxiliar, Resultado_auxiliar),
	usuarioStostring(T, Resultado_auxiliar, UsuariosString).
usuarioStostring([], Auxiliar, Auxiliar).
	

/*
 Descripción de la relación: Predicado que convierte un post a string.
 Entrada: list(post) x variable 
 Salida: variable(post) ó bool
*/
postTostring([Id_post, Contenido_post, Autor_post, Fecha_post], PostStr) :-
	

	atom_string("\nID: ", Str0),
	string_concat(Str0, Id_post, Str1),
	string_concat(Str1, "\n", Str2),
	string_concat(Str2, "El dia ", Str3),
	atomics_to_string(Fecha_post, '/', Fecha_post_str),
	string_concat(Str3, Fecha_post_str, Str4),
	string_concat(Str4, " ", Str5),
	atom_string(Autor_post, Autor_post_str),
	string_concat(Str5, Autor_post_str, Str6),
	string_concat(Str6, " publico:", Str7),
	string_concat(Str7, "\n", Str8),
	string_concat(Str8, "      ", Str9),
	atom_string(Contenido_post, Contenido_post_str),
	string_concat(Str9, Contenido_post_str, PostStr).
	


postTostring([], "[]").


/*
 Descripción de la relación: Predicado que convierte una lista de publicaciones a string.
 Entrada: list(posts) x variable 
 Salida: variable(posts) ó bool
*/
postStostring([H|T], Auxiliar, PostsString) :-
	postTostring(H, PostStr),
	string_concat(PostStr, Auxiliar, Resultado_auxiliar),
	postStostring(T, Resultado_auxiliar, PostsString).
postStostring([], Auxiliar, Auxiliar).
	

/*
 Descripción de la relación: Predicado que convierte un usuario activo a string.
 Entrada: list x variable 
 Salida: variable ó bool
*/
usuarioactivoTostring([Nombre, _, _, _, Seguidos, Id_publicaciones, _, _], Usuario_activo) :-
	atom_string("\n*** Usuario con sesion iniciada ***\n", Str0),
	string_concat(Str0, Nombre, Str1),
	string_concat(Str1, "\n      Sigue a: ", Str2),
	atomics_to_string(Seguidos, ',', Seguidos_str),
	string_concat(Str2, Seguidos_str, Str3),
	string_concat(Str3,"\n--------------------",Str4),
	string_concat(Str4, "\n*** Publicaciones ***\n", Str5),
	atomics_to_string(Id_publicaciones, ',', Id_publicaciones_str),
	string_concat(Str5, Id_publicaciones_str, Str6),
	string_concat(Str6, "\n*** Fin publicaciones ***\n", Usuario_activo).
	



% ///////////////// socialNetworkRegister /////////////////


/*
 Descripción de la relación: Predicado que permite consultar el valor que torna socialNetwork al ocurrir el registro de un nuevo usuario 
 Entrada: socialNetwork x str x str x list x socialNetwork2
 Salida: bool
*/
socialNetworkRegister([H|[T1|[T2|[T3|[T4|_]]]]], Nombre, Contrasenia, Date, SocialNetwork2) :-
	/* Predicado de corte en caso de ya haber un usuario activo en socialNetwork, arroje falso de inmediato */
	(T2 \= [[]], !, fail);

	es_socialNetwork([H|[T1|[T2|[T3|[T4|_]]]]]), /* Se verifica que corresponda a una socialNetwork */
	string(Nombre), /* Se verifica que Nombre sea un string */
	string(Contrasenia), /* Se verifica que Contrasenia sea un string */
	es_lista_enteros(Date), /* Se verifica que corresponda a una fecha */

	/* Predicado que verifica si Nombre se encuentra disponible para registrar */
	es_nombre_disponible(H, Nombre),

	/* Se crea un nuevo usuario con el Nombre y Contrasenia ingresados */
	set_usuario(Nombre, Contrasenia, Date, [], [], [], [], [], Usuario_nuevo),

	/* Se actualiza la lista de usuarios */
	append(H, [Usuario_nuevo], Nueva_lista_usuarios),

	/* Se genera un nuevo socialNetwork */
	socialNetwork([Nueva_lista_usuarios, T1, [[]], T3, T4], SocialNetwork2).




% ///////////////// socialNetworkLogin /////////////////	

/*
 Descripción de la relación: Predicado que permite logear a un usuario registrado.
 Entrada: socialNetwork x str x str x socialNetwork2
 Salida: bool
*/
socialNetworkLogin([H|[T1|[T2|[T3|[T4|_]]]]], Nombre, Contrasenia, SocialNetwork2) :-
	/* Predicado de corte en caso de ya haber un usuario activo en socialNetwork, arroje falso de inmediato */
	(T2 \= [[]], !, fail);

 	es_socialNetwork([H|[T1|[T2|[T3|[T4|_]]]]]), /* Se verifica que corresponda a una socialNetwork */
	string(Nombre), /* Se verifica que Nombre sea un string */
	string(Contrasenia), /* Se verifica que Contrasenia sea un string */

	/* Predicado que verifica si el usuario se encuentra registrado */
	es_usuario_registrado(H, Nombre, Contrasenia),

	/* Se obtiene el usuario que iniciara sesion */
	get_usuario(H, Nombre, User_activo),

	/* Se elimina el usuario de la lista de usuarios, para que sólo esté como usuario activo */
	eliminar_usuario(H, Nombre, Resultado),

	/* Se genera un nuevo socialNetwork */
	socialNetwork([Resultado, T1, [User_activo], T3, T4], SocialNetwork2).




% ///////////////// socialNetworkPost /////////////////

/*
 Descripción de la relación: Predicado que permite a un usuario con sesión iniciada en la plataforma realizar una nueva publicacion.
 Entrada: socialNetwork x list x str x socialNetwork2      
 Salida: variable(socialNetwork) ó bool
*/
socialNetworkPost([H|[T1|[[T2|_]|[T3|[T4|_]]]]], Fecha, Texto, SocialNetwork2) :-
	/* Se verifica que el socialNetwork cuenta con un usuario activo */
	([T2] == [], !, fail);

	es_socialNetwork([H|[T1|[[T2|_]|[T3|[T4|_]]]]]), /* Se verifica que corresponda a un socialNetwork */
	es_lista_enteros(Fecha), /* Se verifica que corresponda a una fecha */
	string(Texto), /* Se verifica que Texto sea un string */
	%es_lista_strings(ListaUsernamesDest), /* Se verifica que ListaUsernamesDest sea una lista de strings */

	/* Se determina un nuevo Id para la publicacion a crear */
	nuevoId(T1, Id_p),

	/* Se obtiene el nombre del usuario activo */
	get_nombre(T2, Autor_post),

	/* Se obtiene el usuario activo */
	get_usuario([T2], Autor_post, Usuario_encontrado),

	/* Se obtienen los datos del usuario activo */
	get_nombre(Usuario_encontrado, Nombre_s),
	get_contrasenia(Usuario_encontrado, Contra_s),
	get_fecha_user(Usuario_encontrado, 	Fecha_s),
	get_seguidores(Usuario_encontrado, Seguidores_s),
	get_seguidos(Usuario_encontrado, Seguidos_s),
	get_Id_publicaciones(Usuario_encontrado, Id_p_s),
	get_P_compartidas_yo(Usuario_encontrado, P_compartidas_yo_s),
	get_P_compartidas_otro(Usuario_encontrado, P_compartidas_otro_s),

	/* Se actualiza la lista de Id's de publicaciones del usuario activo */
	append(Id_p_s, [Id_p], Id_p_s_nuevo),

	/* Se crea un nuevo usuario con los datos actualizados */
	set_usuario(Nombre_s, Contra_s, Fecha_s, Seguidores_s, Seguidos_s, Id_p_s_nuevo, P_compartidas_yo_s, P_compartidas_otro_s, Usuario_generado),

	/* Se crea una nueva publicacion */
	set_post(Id_p, Texto, Autor_post, Fecha, Post_nuevo),

	/* Se actualizan la lista de usuarios y la de publicaciones */
	append(H, [Usuario_generado], Nueva_lista_usuarios),
	append(T1, [Post_nuevo], Nueva_lista_post),

	/* Se genera un nuevo socialNetwork */
	socialNetwork([Nueva_lista_usuarios, Nueva_lista_post, [[]], T3, T4], SocialNetwork2).




% ///////////////// socialNetworkFollow /////////////////

/*
 Descripción de la relación: Predicado que permite a un usuario con sesión iniciada en la plataforma realizar un follow.
 Entrada: socialNetwork x str x socialNetwork2      
 Salida: variable(socialNetwork) ó bool
 */
socialNetworkFollow([H|[T1|[[T2|_]|[T3|[T4|_]]]]], Nombre, SocialNetwork2) :-
	/* Se verifica que el socialNetwork cuenta con un usuario activo */
	([T2] == [], !, fail);

	es_socialNetwork([H|[T1|[[T2|_]|[T3|[T4|_]]]]]), /* Se verifica que corresponda a un socialNetwork */
	string(Nombre), /* Se verifica que corresponda a un nombre */
	
	/* Se obtiene el nombre del usuario activo */
	get_nombre(T2, Autor_follow),
	
	/* Se obtiene el usuario activo */
	get_usuario([T2], Autor_follow, Usuario_encontrado_2),

	/* Se obtienen los datos del usuario activo */
	get_nombre(Usuario_encontrado_2, Nombre_s2),
	get_contrasenia(Usuario_encontrado_2, Contra_s2),
	get_fecha_user(Usuario_encontrado_2, Fecha_s2),
	get_seguidores(Usuario_encontrado_2, Seguidores_s2),
	get_seguidos(Usuario_encontrado_2, Seguidos_s2),
	get_Id_publicaciones(Usuario_encontrado_2, Id_p_s2),
	get_P_compartidas_yo(Usuario_encontrado_2, P_compartidas_yo_s2),
	get_P_compartidas_otro(Usuario_encontrado_2, P_compartidas_otro_s2),

	/* Se obtiene el usuario a Seguir */
	get_usuario(H, Nombre, Usuario_encontrado),

	/* Se obtienen los datos del usuario a Seguir */
	get_nombre(Usuario_encontrado, Nombre_s),
	get_contrasenia(Usuario_encontrado, Contra_s),
	get_fecha_user(Usuario_encontrado, 	Fecha_s),
	get_seguidores(Usuario_encontrado, Seguidores_s),
	get_seguidos(Usuario_encontrado, Seguidos_s),
	get_Id_publicaciones(Usuario_encontrado, Id_p_s),
	get_P_compartidas_yo(Usuario_encontrado, P_compartidas_yo_s),
	get_P_compartidas_otro(Usuario_encontrado, P_compartidas_otro_s),

	/* Se actualiza la lista de seguidores del usuario a Seguir */
	append(Seguidores_s, [Nombre_s2], Seguidores_s_nuevo),

	/* Se crea un nuevo usuario con los datos actualizados */
	set_usuario(Nombre_s, Contra_s, Fecha_s, Seguidores_s_nuevo, Seguidos_s, Id_p_s, P_compartidas_yo_s, P_compartidas_otro_s, Usuario_generado),

	/* Se elimina al usuario a Seguir de la lista de usuarios para actualizar sus datos */
	eliminar_usuario(H, Nombre, Resultado),

	/* Se actualizan la lista de usuarios con el usuario a Seguir con un nuevo seguidor */
	append(Resultado, [Usuario_generado], Nueva_lista_usuarios),
	
	
	/* Se actualiza la lista de los seguidos del usuario activo */
	append(Seguidos_s2, [Nombre_s], Seguidos_s2_nuevo),

	/* Se crea un nuevo usuario con los datos actualizados */
	set_usuario(Nombre_s2, Contra_s2, Fecha_s2, Seguidores_s2, Seguidos_s2_nuevo, Id_p_s2, P_compartidas_yo_s2, P_compartidas_otro_s2, Usuario_generado2),

	append(Nueva_lista_usuarios, [Usuario_generado2], Nueva_lista_usuarios2),


	/* Se genera un nuevo socialNetwork */
	socialNetwork([Nueva_lista_usuarios2, T1, [[]], T3, T4], SocialNetwork2).





% ///////////////// socialNetworkShare /////////////////

/*
 Descripción de la relación: Predicado que permite a un usuario con sesión iniciada en la plataforma realizar un Share.
 Entrada: socialNetwork x list x int x str x socialNetwork2      
 Salida: variable(socialNetwork) ó bool
*/
socialNetworkShare([H|[T1|[[T2|_]|[T3|[T4|_]]]]], Fecha, PostId, Nombre, SocialNetwork2) :-
	/* Se verifica que el socialNetwork cuenta con un usuario activo */
	([T2] == [], !, fail);

	es_socialNetwork([H|[T1|[[T2|_]|[T3|[T4|_]]]]]), /* Se verifica que corresponda a un socialNetwork */
	string(Nombre), /* Se verifica que corresponda a un nombre */
	es_lista_enteros(Fecha), /* Se verifica que corresponda a una fecha */
	integer(PostId), /* Se verifica que corresponda un entero */
	/* Se obtiene el nombre del usuario activo */
	get_nombre(T2, Autor_share),
	
	/* Se obtiene el usuario activo */
	get_usuario([T2], Autor_share, Usuario_encontrado_2),

	/* Se obtienen los datos del usuario activo */
	get_nombre(Usuario_encontrado_2, Nombre_s2),
	get_contrasenia(Usuario_encontrado_2, Contra_s2),
	get_fecha_user(Usuario_encontrado_2, Fecha_s2),
	get_seguidores(Usuario_encontrado_2, Seguidores_s2),
	get_seguidos(Usuario_encontrado_2, Seguidos_s2),
	get_Id_publicaciones(Usuario_encontrado_2, Id_p_s2),
	get_P_compartidas_yo(Usuario_encontrado_2, P_compartidas_yo_s2),
	get_P_compartidas_otro(Usuario_encontrado_2, P_compartidas_otro_s2),

	/* Se obtiene el usuario a compartir */
	get_usuario(H, Nombre, Usuario_encontrado),

	/* Se obtienen los datos del usuario a compartir */
	get_nombre(Usuario_encontrado, Nombre_s),
	get_contrasenia(Usuario_encontrado, Contra_s),
	get_fecha_user(Usuario_encontrado, 	Fecha_s),
	get_seguidores(Usuario_encontrado, Seguidores_s),
	get_seguidos(Usuario_encontrado, Seguidos_s),
	get_Id_publicaciones(Usuario_encontrado, Id_p_s),
	get_P_compartidas_yo(Usuario_encontrado, P_compartidas_yo_s),
	get_P_compartidas_otro(Usuario_encontrado, P_compartidas_otro_s),

	/* Se actualiza la lista de publicaciones compartidas del usuario a compartir*/
	append(P_compartidas_otro_s, [[Fecha,PostId,Nombre_s2]], P_compartidas_otro_s_nuevo),

	/* Se crea un nuevo usuario con los datos actualizados */
	set_usuario(Nombre_s, Contra_s, Fecha_s, Seguidores_s, Seguidos_s, Id_p_s, P_compartidas_yo_s, P_compartidas_otro_s_nuevo, Usuario_generado),

	/* Se elimina al usuario a compartir de la lista de usuarios para actualizar sus datos */
	eliminar_usuario(H, Nombre, Resultado),

	/* Se actualizan la lista de usuarios con el usuario a compartir con un nuevo post compartido */
	append(Resultado, [Usuario_generado], Nueva_lista_usuarios),
	
	/* Se actualiza la lista de los compartidos del usuario activo */
	append(P_compartidas_yo_s2, [Fecha,PostId,Nombre_s], P_compartidas_yo_s2_nuevo),

	/* Se crea un nuevo usuario con los datos actualizados */
	set_usuario(Nombre_s2, Contra_s2, Fecha_s2, Seguidores_s2, Seguidos_s2, Id_p_s2, P_compartidas_yo_s2_nuevo, P_compartidas_otro_s2, Usuario_generado2),

	append(Nueva_lista_usuarios, [Usuario_generado2], Nueva_lista_usuarios2),


	/* Se genera un nuevo socialNetwork */
	socialNetwork([Nueva_lista_usuarios2, T1, [[]], T3, T4], SocialNetwork2).




	


% ///////////////// socialNetworkToString /////////////////

/*
 Descripción de la relación: Predicado que permite mostrar en pantalla la socialNetwork.
 Entrada: socialNetwork x str   
 Salida: variable(socialNetwork) ó bool
*/
socialNetworkToString( [H|[T1|[[T2|_]|[T3|[T4|_]]]]], SocialNetworkStr) :-

	(T2 == [], /*Se verificara si no hay un usuario activo para mostrar la red social en general*/
	atom_string("\n\n####### Red social ", Sn0),
	string_concat(Sn0,T3,Sn1),
	string_concat(Sn1," ####### ",Sn2),
	string_concat(Sn2,"\n",Sn3),
	string_concat(Sn3,"Creada el dia ",Sn4),
	atomics_to_string(T4, '/', T4_str),
	string_concat(Sn4,T4_str,Sn5),
	string_concat(Sn5,"\n",Sn6),
	string_concat(Sn6,"*** Usuarios registrados ***",Sn7),
	string_concat(Sn7,"\n",Sn8),
	usuarioStostring(H,"\n",Resultado_auxiliar1),

	string_concat(Sn8,Resultado_auxiliar1,Sn9),
	string_concat(Sn9,"--------------------",Sn10),
	string_concat(Sn10,"\n",Sn11),
	string_concat(Sn11,"*** Publicaciones ***",Sn12),

	postStostring(T1,"\n",Resultado_auxiliar2),
	string_concat(Sn12,Resultado_auxiliar2,Sn13),
	string_concat(Sn13,"\n*** Fin publicaciones ***",SocialNetworkStr));

	(T2 \= [],  /*Se verificara si hay un usuario activo para mostrar la red social desde el perfil del usuario activo*/
	atom_string("\n\n####### Red social ", Sn0),
	string_concat(Sn0,T3,Sn1),
	string_concat(Sn1," ####### ",Sn2),
	string_concat(Sn2,"\n",Sn3),
	string_concat(Sn3,"Creada el dia ",Sn4),
	atomics_to_string(T4, '/', T4_str),
	string_concat(Sn4,T4_str,Sn5),
	string_concat(Sn5,"\n",Sn6),

	usuarioactivoTostring(T2, Usuario_activo),
	string_concat(Sn6, Usuario_activo, SocialNetworkStr)).

	

% ///////////////////// EJEMPLOS ///////////////////////////


% ///////////////// socialNetworkRegister /////////////////

/*  Ejemplo para un usuario 
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2).
	
    Ejemplo para 3 usuarios 
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4).

	Ejemplo para 6 usuarios 
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), date(5,1,2021,User4date) , socialNetworkRegister(Sn4, "user4", "pass4", User4date, Sn5), date(6,1,2021,User5date) , socialNetworkRegister(Sn5, "user5", "pass5", User5date, Sn6), date(6,1,2021,User6date) , socialNetworkRegister(Sn6, "user6", "pass6", User6date, Sn7). 

*/


% ///////////////// socialNetworkLogin /////////////////

/*  Ejemplo para usuario no logeado
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), date(5,1,2021,User4date) , socialNetworkRegister(Sn4, "user4", "pass4", User4date, Sn5), date(6,1,2021,User5date) , socialNetworkRegister(Sn5, "user5", "pass5", User5date, Sn6), date(6,1,2021,User6date) , socialNetworkRegister(Sn6, "user6", "pass6", User6date, Sn7), socialNetworkLogin(Sn7, "user1", "pass1", Sn8).

	Ejemplo para usuario con datos ingresados incorrectos, produce false
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), date(5,1,2021,User4date) , socialNetworkRegister(Sn4, "user4", "pass4", User4date, Sn5), date(6,1,2021,User5date) , socialNetworkRegister(Sn5, "user5", "pass5", User5date, Sn6), date(6,1,2021,User6date) , socialNetworkRegister(Sn6, "user6", "pass6", User6date, Sn7), socialNetworkLogin(Sn7, "user1", "pass4", Sn8).

	Ejemplo para usuario no registrado, produce false
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), date(5,1,2021,User4date) , socialNetworkRegister(Sn4, "user4", "pass4", User4date, Sn5), date(6,1,2021,User5date) , socialNetworkRegister(Sn5, "user5", "pass5", User5date, Sn6), date(6,1,2021,User6date) , socialNetworkRegister(Sn6, "user6", "pass6", User6date, Sn7), socialNetworkLogin(Sn7, "user?", "pass?", Sn8).

	Ejemplo con un usuario ya logeado, produce false
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), date(5,1,2021,User4date) , socialNetworkRegister(Sn4, "user4", "pass4", User4date, Sn5), date(6,1,2021,User5date) , socialNetworkRegister(Sn5, "user5", "pass5", User5date, Sn6), date(6,1,2021,User6date) , socialNetworkRegister(Sn6, "user6", "pass6", User6date, Sn7), socialNetworkLogin(Sn7, "user1", "pass1", Sn8), socialNetworkLogin(Sn8, "user2", "pass2", Sn9).

*/

% ///////////////// socialNetworkPost /////////////////

/*  Ejemplo para una publicacion 
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6).

	Ejemplo para varias publicaciones publicacion
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkLogin(Sn6, "user2", "pass2", Sn7), date(2,2,2021,Post2date), socialNetworkPost(Sn7, Post2date, "Foto de gatito", Sn8), socialNetworkLogin(Sn8, "user3", "pass3", Sn9), date(3,2,2021,Post3date), socialNetworkPost(Sn9, Post3date, "Alguien sabe usar Prolog?", Sn10), socialNetworkLogin(Sn10, "user2", "pass2", Sn11), date(3,2,2021,Post4date), socialNetworkPost(Sn11, Post4date, "Otra foto de gatito", Sn12).

	Ejemplo para una publicacion sin un login, produce false
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), date(1,2,2021,Post1date), socialNetworkPost(Sn4, Post1date, "Primer Post", Sn5).
*/

% ///////////////// socialNetworkFollow /////////////////

/*  Ejemplo para un Follow
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkLogin(Sn6, "user1", "pass1", Sn7), socialNetworkFollow(Sn7, "user2", Sn8).

	Ejemplo para varios Follow
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkLogin(Sn6, "user1", "pass1", Sn7), socialNetworkFollow(Sn7, "user2", Sn8), socialNetworkLogin(Sn8, "user1", "pass1", Sn9), socialNetworkFollow(Sn9, "user3", Sn10), socialNetworkLogin(Sn10, "user2", "pass2", Sn11), socialNetworkFollow(Sn11, "user1", Sn12).

	Ejemplo para un Follow sin un login, produce false
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkFollow(Sn6, "user2", Sn7).
*/

% ///////////////// socialNetworkShare /////////////////

/*  Ejemplo para un Share
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkLogin(Sn6, "user1", "pass1", Sn7), date(1,3,2021,Share1date), socialNetworkShare(Sn7, Share1date, 1, "user2", Sn8).

	Ejemplo para varios Share
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkLogin(Sn6, "user2", "pass2", Sn7), date(2,2,2021,Post2date), socialNetworkPost(Sn7, Post2date, "Foto de gatito", Sn8), socialNetworkLogin(Sn8, "user3", "pass3", Sn9), date(3,2,2021,Post3date), socialNetworkPost(Sn9, Post3date, "Alguien sabe usar Prolog?", Sn10), socialNetworkLogin(Sn10, "user2", "pass2", Sn11), date(3,2,2021,Post4date), socialNetworkPost(Sn11, Post4date, "Otra foto de gatito", Sn12), socialNetworkLogin(Sn12, "user1", "pass1", Sn13), date(1,3,2021,Share1date), socialNetworkShare(Sn13, Share1date, 1, "user2", Sn14), socialNetworkLogin(Sn14, "user1", "pass1", Sn15), date(2,3,2021,Share2date), socialNetworkShare(Sn15, Share2date, 2, "user3", Sn16), socialNetworkLogin(Sn16, "user2", "pass2", Sn17), date(2,4,2021,Share3date), socialNetworkShare(Sn17, Share3date, 3, "user3", Sn18). 

	Ejemplo para un Share sin un login, produce false
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), date(1,3,2021,Share1date), socialNetworkShare(Sn6, Share1date, 1, "user2", Sn7).


% ///////////////// socialNetworkToString /////////////////

/*  Ejemplo para 6 usuarios registrados sin usuario activo
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), date(5,1,2021,User4date) , socialNetworkRegister(Sn4, "user4", "pass4", User4date, Sn5), date(6,1,2021,User5date) , socialNetworkRegister(Sn5, "user5", "pass5", User5date, Sn6), date(6,1,2021,User6date) , socialNetworkRegister(Sn6, "user6", "pass6", User6date, Sn7), socialNetworkToString(Sn7, SnStr), write(SnStr). 

	Ejemplo para una publicacion sin usuario activo
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkToString(Sn6, SnStr), write(SnStr). 

	Ejemplo para varias publicaciones sin usuario activo
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkLogin(Sn6, "user2", "pass2", Sn7), date(2,2,2021,Post2date), socialNetworkPost(Sn7, Post2date, "Foto de gatito", Sn8), socialNetworkLogin(Sn8, "user3", "pass3", Sn9), date(3,2,2021,Post3date), socialNetworkPost(Sn9, Post3date, "Alguien sabe usar Prolog?", Sn10), socialNetworkLogin(Sn10, "user2", "pass2", Sn11), date(3,2,2021,Post4date), socialNetworkPost(Sn11, Post4date, "Otra foto de gatito", Sn12), socialNetworkToString(Sn12, SnStr), write(SnStr).

	Ejemplo para varios follow sin usuario activo
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkLogin(Sn6, "user1", "pass1", Sn7), socialNetworkFollow(Sn7, "user2", Sn8), socialNetworkLogin(Sn8, "user1", "pass1", Sn9), socialNetworkFollow(Sn9, "user3", Sn10), socialNetworkLogin(Sn10, "user2", "pass2", Sn11), socialNetworkFollow(Sn11, "user1", Sn12), socialNetworkToString(Sn12, SnStr), write(SnStr). 

	Ejemplo para varios Share con usuario activo	
	date(1,1,2021,SnDate), socialNetwork([[],[],[[]], "PrologGram",SnDate], Sn1),date(2,1,2021,User1date) , socialNetworkRegister(Sn1, "user1", "pass1", User1date, Sn2), date(3,1,2021,User2date) , socialNetworkRegister(Sn2, "user2", "pass2", User2date, Sn3), date(4,1,2021,User3date) , socialNetworkRegister(Sn3, "user3", "pass3", User3date, Sn4), socialNetworkLogin(Sn4, "user1", "pass1", Sn5), date(1,2,2021,Post1date), socialNetworkPost(Sn5, Post1date, "Primer Post", Sn6), socialNetworkLogin(Sn6, "user2", "pass2", Sn7), date(2,2,2021,Post2date), socialNetworkPost(Sn7, Post2date, "Foto de gatito", Sn8), socialNetworkLogin(Sn8, "user3", "pass3", Sn9), date(3,2,2021,Post3date), socialNetworkPost(Sn9, Post3date, "Alguien sabe usar Prolog?", Sn10), socialNetworkLogin(Sn10, "user2", "pass2", Sn11), date(3,2,2021,Post4date), socialNetworkPost(Sn11, Post4date, "Otra foto de gatito", Sn12), socialNetworkLogin(Sn12, "user1", "pass1", Sn13), date(1,3,2021,Share1date), socialNetworkShare(Sn13, Share1date, 1, "user2", Sn14), socialNetworkLogin(Sn14, "user1", "pass1", Sn15), date(2,3,2021,Share2date), socialNetworkShare(Sn15, Share2date, 2, "user3", Sn16), socialNetworkLogin(Sn16, "user2", "pass2", Sn17), date(2,4,2021,Share3date), socialNetworkShare(Sn17, Share3date, 3, "user3", Sn18), socialNetworkLogin(Sn18, "user1", "pass1", Sn19), socialNetworkToString(Sn19, SnStr), write(SnStr). 

*/