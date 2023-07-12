using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using dominio;
using System.Configuration;
using static System.Net.Mime.MediaTypeNames;

namespace negocio
{
    public class DescripcionNegocio
    {
        public List<Descripcion> listar()
        {
            List<Descripcion> lista = new List<Descripcion>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id,Titulo,Descripcion,ImagenUrl,IdProducto from DESCRIPCION");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Descripcion aux = new Descripcion();

                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                    {
                        aux.Id = (int)datos.Lector["Id"];
                        aux.Titulo = (string)datos.Lector["Titulo"];
                        aux.Bajada = (string)datos.Lector["Descripcion"];
                        aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                        aux.IdProducto = (int)datos.Lector["IdProducto"];
                        lista.Add(aux);
                    }
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

        public void agregar(Descripcion nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into DESCRIPCION(Titulo,Descripcion,ImagenUrl,IdProducto)values(@Titulo, @Plazas, @Descripcion, @IdProducto)");
                datos.setearParametro("@Titulo", nuevo.Titulo);
                datos.setearParametro("@Descripcion", nuevo.Bajada);
                datos.setearParametro("@ImagenUrl", nuevo.ImagenUrl);
                datos.setearParametro("@IdProducto", nuevo.IdProducto);
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

        public void modificar(Descripcion mod)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update DESCRIPCION set Titulo = @Titulo ,Descripcion = @Descripcion,ImagenUrl = @ImagenUrl WHERE IdProducto = @idProducto");
                datos.setearParametro("@Titulo", mod.Titulo);
                datos.setearParametro("@Descripcion", mod.Bajada);
                datos.setearParametro("@ImagenUrl", mod.ImagenUrl);
                datos.setearParametro("@idProducto", mod.IdProducto);
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