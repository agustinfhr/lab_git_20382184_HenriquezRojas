
/*

////////////// REPRESENTACION //////////////


usuario => [nombre, contrasenia, fecha, [seguidores], [seguidos], [id_publicaciones], [p_compartidas_yo], [p_compartidas_otro]]

post => [post_id, contenido_post, autor_post, fecha_post]

socialNetwork => [[Usuario1, Usuario2, ...], [Post1, Post2, ...], [Usuario_activo], Name, Date]


*/


%/////////////Constructores///////// 



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
 Salida: variable list ó bool
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


%////////////Selectores///////////


%TDA USUARIO

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
 Descripción de la relación: Predicado selector de los ids de publicaciones del usuario.
 Entrada: list x variable
 Salida: variable (lista de int) ó bool
*/
get_Id_publicaciones([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|T]]]]], Id_publicaciones_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|T]]]]]),
	append([], Id_publicaciones_s, Id_publicaciones).


/*
 Descripción de la relación: Predicado selector de las publicaciones compartidas del usuario.
 Entrada: list x variable
 Salida: variable (lista de int) ó bool
*/
get_P_compartidas_yo([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|[P_compartidas_yo|T]]]]]], P_compartidas_yo_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|[P_compartidas_yo|T]]]]]]),
	append([], P_compartidas_yo_s, P_compartidas_yo).


/*
 Descripción de la relación: Predicado selector de las publicaciones que le han compartido al usuario.
 Entrada: list x variable
 Salida: variable (lista de int) ó bool
*/
get_P_compartidas_otro([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|[P_compartidas_yo|[P_compartidas_otro|T]]]]]]], P_compartidas_otro_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|[P_compartidas_yo|[P_compartidas_otro|T]]]]]]]),
	append([], P_compartidas_otro_s, P_compartidas_otro).


%TDA POST


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



% Otros Selectores 



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
	es_lista_enteros(P_compartidas_yo),
	es_lista_enteros(P_compartidas_otro).
	

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
 Descripción de la relación: Predicado que verifica si corresponde a una lista con usuarios.
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
 Entrada: list(usuarios, publicaciones)
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



% ///////////////// socialNetworkRegister /////////////////


/*
 Descripción de la relación: Predicado que permite consultar el valor que torna socialNetwork al ocurrir el registro de un nuevo usuario 
 Entrada: socialNetwork x str x str x socialNetwork2
 Salida: bool
*/
socialNetworkRegister([H|[T1|[T2|[T3|[T4|_]]]]], Nombre, Contrasenia, Date, SocialNetwork2) :-
	/* Predicado de corte en caso de ya haber un usuario activo en socialNetwork, arroje falso de inmediato */
	(T2 \= [[]], !, fail);

	es_socialNetwork([H|[T1|[T2|[T3|[T4|_]]]]]), /* Se verifica que corresponda a una socialNetwork */
	string(Nombre), /* Se verifica que Nombre sea un string */
	string(Contrasenia), /* Se verifica que Contrasenia sea un string */
	es_lista_enteros(Date),

	/* Predicado que verifica si Nombre se encuentra disponible para registrar */
	es_nombre_disponible(H, Nombre),

	/* Se crea un nuevo usuario con el Nombre y Contrasenia ingresados */
	set_usuario(Nombre, Contrasenia, Date, [], [], [], [], [], Usuario_nuevo),

	/* Se actualiza la lista de usuarios */
	append(H, [Usuario_nuevo], Nueva_lista_usuarios),

	/* Se genera un nuevo socialNetwork */
	socialNetwork([Nueva_lista_usuarios, T1, [[]], T3, T4], SocialNetwork2).


