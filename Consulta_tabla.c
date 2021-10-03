//programa en C para consultar los datos de la base de datos
//Incluir esta libreria para poder hacer las llamadas en shiva2.upc.es
//#include <my_global.h>
#include <mysql.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
int main(int argc, char **argv)
{
	MYSQL *conn;
	char err[80];
	// Estructura especial para almacenar resultados de consultas 
	MYSQL_RES *resultado;
	MYSQL_ROW row;
	char Jugador[20];
	char consulta[80];
	int idP;
	//Creamos una conexion al servidor MYSQL 
	conn = mysql_init(NULL);
	if (conn==NULL) {
		printf ("Error al crear la conexion: %u %s\n", 
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	//inicializar la conexion
	conn = mysql_real_connect (conn, "localhost","user", "mysql", "Tablas",0, NULL, 0);
	if (conn==NULL) {
		printf ("Error al inicializar la conexion: %u %s\n", 
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	// consulta SQL para obtener una tabla con todos los datos
	// de la base de datos
	
	printf ("Dame el id de la partida sobre la que quieres informacion\n"); 
	scanf ("%d", idP);
	strcpy (consulta,"SELECT Jugador.Nombre FROM (Historial, Jugador, Partida) WHERE Historial.idP = Partida.idP AND Historial.idJ = Jugador.idJ"); 
	strcat (consulta, idP);
	strcpy (err, mysql_query (conn, consulta));
	
	strcpy(err, mysql_query (conn, "SELECT Jugador.Nombre FROM (Historial, Jugador, Partida) WHERE Historial.idP = Partida.idP AND Historial.idJ = Jugador.idJ"));
	if (err==NULL) {
		printf ("Error al consultar datos de la base %u %s\n",
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	//recogemos el resultado de la consulta. El resultado de la
	//consulta se devuelve en una variable del tipo puntero a
	//MYSQL_RES tal y como hemos declarado anteriormente.
	//Se trata de una tabla virtual en memoria que es la copia
	//de la tabla real en disco.
	resultado = mysql_store_result (conn);
	// El resultado es una estructura matricial en memoria
	// en la que cada fila contiene los datos de una persona.
	// Ahora obtenemos la primera fila que se almacena en una
	// variable de tipo MYSQL_ROW
	row = mysql_fetch_row (resultado);
	if (row == NULL)
		printf ("No se han obtenido datos en la consulta\n");
	else
		while (row !=NULL) {
			printf("Jugador:%s\n", row[1]);
			// obtenemos la siguiente fila
			row = mysql_fetch_row (resultado);
	}	
		// cerrar la conexion con el servidor MYSQL 
		mysql_close (conn);
		exit(0);	
}

