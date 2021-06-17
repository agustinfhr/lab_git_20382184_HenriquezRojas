


 //////////////REPRESENTACION //////////////
/*

USUARIO => [nombre, contrasena, [id_post]]

post => [post_id, contenido_post, autor_post, fecha_post]

socialNetwork => [[Usuario1, Usuario2, ...], [Post1, Post2, ...], [Usuario_activo]]


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
 Entrada: list usuarios x list preguntas x list respuestas x variable
 Salida: variable list (usuarios, post)) ó bool
*/
socialNetwork([Name, Date, Usuarios, Posts, Usuario_activo], SOut) :-
	es_socialNetwork([Name, Date, Usuarios, Posts, Usuario_activo]),
	append([], SOut, [Name, Date, Usuarios, Posts, Usuario_activo]).



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
get_fecha([Nombre|[Contrasenia|[Fecha|T]]], Fecha_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|T]]]),
	append([], Fecha_s, Fecha).


/*
 Descripción de la relación: Predicado selector de los seguidores del usuario.
 Entrada: list x variable
 Salida: variable (lista de enteros) ó bool
*/
get_seguidores([Nombre|[Contrasenia|[Fecha|[Seguidores|T]]]], Seguidores_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|T]]]]),
	append([], Seguidores_s, Seguidores).


/*
 Descripción de la relación: Predicado selector de los ids de publicaciones del usuario.
 Entrada: list x variable
 Salida: variable (lista de strings) ó bool
*/
get_Id_publicaciones([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|T]]]]], Id_publicaciones_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|T]]]]]),
	append([], Id_publicaciones_s, Id_publicaciones).


/*
 Descripción de la relación: Predicado selector de las publicaciones compartidas del usuario.
 Entrada: list x variable
 Salida: variable (lista de strings) ó bool
*/
get_P_compartidas_yo([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|[P_compartidas_yo|T]]]]]], P_compartidas_yo_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|[P_compartidas_yo|T]]]]]),
	append([], P_compartidas_yo_s, P_compartidas_yo).


/*
 Descripción de la relación: Predicado selector de las publicaciones que le han compartido al usuario.
 Entrada: list x variable
 Salida: variable (lista de strings) ó bool
*/
get_P_compartidas_otro([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|[P_compartidas_yo|[P_compartidas_otro|T]]]]]]], P_compartidas_otro_s) :-
	es_usuario([Nombre|[Contrasenia|[Fecha|[Seguidores|[Id_publicaciones|[P_compartidas_yo|[P_compartidas_otro|T]]]]]),
	append([], P_compartidas_otro_s, P_compartidas_otro).


%TDA PREGUNTA


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




% //////////// Pertenencia ////////////

/*
 Descripción de la relación: Predicado que verifica si corresponde a un usuario.
 Entrada: list (usuario)
 Salida: bool
*/
es_usuario([Nombre, Contrasenia, Fecha, Seguidores, Seguidos, Id_publicaciones, P_compartidas_yo, P_compartidas_otro, Usuario_generado]) :-
	string(Nombre),
	string(Contrasenia),
	

/*
 Descripción de la relación: Predicado que verifica si corresponde a una publicacion.
 Entrada: list (publicacion)
 Salida: bool
*/
es_post([Id_post, Contenido_post, Autor_post, Fecha_post]) :-
	integer(Id_p),


