


 //////////////REPRESENTACION //////////////
/*

USUARIO => [nombre, contrasena, [id_post]]

post => [post_id, contenido_post, autor_post, fecha_post]

socialNetwork => [[Usuario1, Usuario2, ...], [Post1, Post2, ...], [Usuario_activo]]


*/


/*
  Constructores 
*/

socialNetwork(Name, Date, OUTsocialNetwork, UsuarioActivo).


set_usuario(Nombre, Contrasena, Id_post).


set_post(Post_id,  Contenido_post, Autor_post, Fecha_post).


////TDA USUARIO///

get_nombre([Nombre|T]).

get_contrasenia([Nombre|[Contrasena|T]]).

get_Id_preguntas([Nombre|[Contrasena|[Id_post|T]]]).


