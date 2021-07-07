
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

/*
 Descripción de la relación: Predicado que selecciona un usuario por su nombre.
 Entrada: list(usuarios) x str x variable
 Salida: variable (usuario) ó bool
 set_usuario(Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro, Usuario_generado) :-
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



% ///////////////// socialNetworkRegister /////////////////


/*
 Descripción de la relación: Predicado que permite consultar el valor que torna socialNetwork al ocurrir el registro de un nuevo usuario 
 Entrada: socialNetwork x str x str x socialNetwork2
 Salida: bool
 date(24,5,2021,D), socialNetwork([[],[],[[]], "failbok",D], Sn1),date(25,5,2021,Du1) , socialNetworkRegister(Sn1, "mmental", "asdf", Du1, Sn2),date(25,5,2021,Du2) , socialNetworkRegister(Sn2, "mmmental", "asdf", Du2, Sn3).
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




% ///////////////// Consulta socialNetworkLogin /////////////////	

/*
 Descripción de la relación: Predicado que permite logear a un usuario registrado.
 Entrada: socialNetwork x str x str x socialNetwork
 Salida: bool
 date(24,5,2021,D), socialNetwork([[],[],[[]], "failbok",D], Sn1),date(25,5,2021,Du1) , socialNetworkRegister(Sn1, "mmental", "asdf", Du1, Sn2),date(25,5,2021,Du2) , socialNetworkRegister(Sn2, "mmmental", "asdf", Du2, Sn3), socialNetworkLogin(Sn3, "mmental", "asdf", Sn4).
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
 Entrada: socialNetwork x fecha x str x str list x socialNetwork2      
 Salida: variable(socialNetwork) ó bool
 set_usuario(Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro, Usuario_generado) :-
 set_post(Id_post, Contenido_post, Autor_post, Fecha_post, Post_generado) :-
 socialNetwork([Usuarios, Posts, Usuario_activo, Name, Date], SOut) :-
 date(24,5,2021,D), socialNetwork([[],[],[[]], "failbok",D], Sn1),date(25,5,2021,Du1) , socialNetworkRegister(Sn1, "mmental", "asdf", Du1, Sn2),date(25,5,2021,Du2) , socialNetworkRegister(Sn2, "mmmental", "asdf", Du2, Sn3), socialNetworkLogin(Sn3, "mmental", "asdf", Sn4), date(25,5,2021,Dp1), socialNetworkPost(Sn4, Dp1, "Primer post", Sn5).
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
 set_usuario(Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro, Usuario_generado) :-
 set_post(Id_post, Contenido_post, Autor_post, Fecha_post, Post_generado) :-
 socialNetwork([Usuarios, Posts, Usuario_activo, Name, Date], SOut) :-
 date(24,5,2021,D), socialNetwork([[],[],[[]], "failbok",D], Sn1),date(25,5,2021,Du1) , socialNetworkRegister(Sn1, "mmental", "asdf", Du1, Sn2),date(25,5,2021,Du2) , socialNetworkRegister(Sn2, "mmmental", "asdf", Du2, Sn3), socialNetworkLogin(Sn3, "mmental", "asdf", Sn4), date(25,5,2021,Dp1), socialNetworkPost(Sn4, Dp1, "Primer post", Sn5).
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
 Entrada: socialNetwork x str x socialNetwork2      
 Salida: variable(socialNetwork) ó bool
 set_usuario(Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro, Usuario_generado) :-
 set_post(Id_post, Contenido_post, Autor_post, Fecha_post, Post_generado) :-
 socialNetwork([Usuarios, Posts, Usuario_activo, Name, Date], SOut) :-
 date(24,5,2021,D), socialNetwork([[],[],[[]], "failbok",D], Sn1),date(25,5,2021,Du1) , socialNetworkRegister(Sn1, "mmental", "asdf", Du1, Sn2),date(25,5,2021,Du2) , socialNetworkRegister(Sn2, "mmmental", "asdf", Du2, Sn3), socialNetworkLogin(Sn3, "mmental", "asdf", Sn4), date(25,5,2021,Dp1), socialNetworkPost(Sn4, Dp1, "Primer post", Sn5).
*/
socialNetworkShare([H|[T1|[[T2|_]|[T3|[T4|_]]]]], Fecha, PostId, Nombre, SocialNetwork2) :-
	/* Se verifica que el socialNetwork cuenta con un usuario activo */
	([T2] == [], !, fail);

	es_socialNetwork([H|[T1|[[T2|_]|[T3|[T4|_]]]]]), /* Se verifica que corresponda a un socialNetwork */
	string(Nombre), /* Se verifica que corresponda a un nombre */
	es_lista_enteros(Fecha), /* Se verifica que corresponda a una fecha */
	integer(PostId),
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