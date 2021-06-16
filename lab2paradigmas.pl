


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














