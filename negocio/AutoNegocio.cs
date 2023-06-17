using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

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

    }
}
