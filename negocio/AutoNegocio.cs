using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using dominio;
using System.Configuration;

namespace negocio
{
    public class AutoNeogocio
    {
        public List<Auto> listar()
        {
            List<Auto> lista = new List<Auto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select Id,Nombre,IdMarca,Imagen,Stock from Productos");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Auto aux = new Auto();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    //aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.IdMarca = (int)datos.Lector["IdMarca"];
                    aux.Imagen = (string)datos.Lector["Imagen"];
                    aux.Stock = (int)datos.Lector["Stock"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        public int UltimoId()  //Funcion que muestra el Id de la nueva categoria a Agregar
        {
            int ultimoId = 0;
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IDENT_CURRENT('MARCAS') AS UltimoId");
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    ultimoId = Convert.ToInt32(datos.Lector["UltimoId"]);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return ultimoId;
        }


        public int numeroIdModificar(Marca marca)     //Funcion que devuelve el Id de Categoria que se selecciono  o 0 si no hay ninguna
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("select Id from MARCAS where Id = " + marca.Id + "");
                datos.ejecutarLectura();

                if (datos.Lector.HasRows)
                {
                    datos.Lector.Read();
                    int id = (int)datos.Lector["Id"];
                    return id;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        public void modificar(Marca marca)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("update MARCAS set Descripcion= '" + marca.Descripcion + "' where id = " + marca.Id + "");
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        public void agregar(Marca nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("insert into MARCAS (Descripcion) Values ('" + nuevo.Descripcion + "')");
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }


        public void eliminar(int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("delete from MARCAS where Id = " + id);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Auto> listar(string id = "")
        {
            List<Auto> lista = new List<Auto>();
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = ConfigurationManager.AppSettings["cadenaConexion"];
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "select Id,Nombre,IdMarca,Imagen,Stock from Productos";
                if (id != "")
                    comando.CommandText += " and P.Id = " + id;

                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Auto aux = new Auto();
                    aux.Id = (int)lector["Id"];
                    aux.Nombre = (string)lector["Nombre"];
                    //aux.Precio = (decimal)lector["Precio"];
                    aux.IdMarca = (int)lector["IdMarca"];
                    aux.Imagen = (string)lector["Imagen"];
                    aux.Stock = (int)lector["Stock"];

                    //if(!(lector.IsDBNull(lector.GetOrdinal("UrlImagen"))))
                    //    aux.UrlImagen = (string)lector["UrlImagen"];
                    //if (!(lector["UrlImagen"] is DBNull))
                    //    aux.UrlImagen = (string)lector["UrlImagen"];

                    //aux.Tipo = new Elemento();
                    //aux.Tipo.Id = (int)lector["IdTipo"];
                    //aux.Tipo.Descripcion = (string)lector["Tipo"];
                    //aux.Debilidad = new Elemento();
                    //aux.Debilidad.Id = (int)lector["IdDebilidad"];
                    //aux.Debilidad.Descripcion = (string)lector["Debilidad"];

                    //aux.Activo = bool.Parse(lector["Activo"].ToString());

                    lista.Add(aux);
                }

                conexion.Close();
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void modificarConSP(Auto auto)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //datos.setearProcedimiento("storedModificarPokemon");
                //datos.setearParametro("@numero", poke.Numero);
                datos.setearParametro("@nombre", auto.Nombre);
                //datos.setearParametro("@desc", poke.Descripcion);
                //datos.setearParametro("@img", poke.UrlImagen);
                //datos.setearParametro("@idTipo", poke.Tipo.Id);
                //datos.setearParametro("@idDebilidad", poke.Debilidad.Id);
                //datos.setearParametro("@id", poke.Id);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void agregarConSP(Auto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedAltaPokemon");
                //datos.setearParametro("@numero", nuevo.Numero);
                datos.setearParametro("@nombre", nuevo.Nombre);
                //datos.setearParametro("@desc", nuevo.Descripcion);
                //datos.setearParametro("@img", nuevo.UrlImagen);
                //datos.setearParametro("@idTipo", nuevo.Tipo.Id);
                //datos.setearParametro("@idDebilidad", nuevo.Debilidad.Id);
                //datos.setearParametro("@idEvolucion", null);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }


}
