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
    public class TapizadoNegocio
    {
        public List<Tapizado> listar()
        {
            List<Tapizado> lista = new List<Tapizado>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id,Nombre,Muestra,ImagenUrl,Precio,IdProducto from TAPIZADOS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Tapizado aux = new Tapizado();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Muestra = (string)datos.Lector["Muestra"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.IdProducto = (int)datos.Lector["IdProducto"];
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

        public void agregar(Tapizado nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into TAPIZADOS(Nombre,Muestra,ImagenUrl,Precio,IdProducto)values(@Nombre, @Muestra, @ImagenUrl,@Precio, @IdProducto)");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Muestra", nuevo.Muestra);
                datos.setearParametro("@ImagenUrl", nuevo.ImagenUrl);
                datos.setearParametro("@Precio", nuevo.Precio);
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

        public void modificar(Tapizado mod)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update TAPIZADOS set Nombre = @Nombre ,Muestra = @Muestra,ImagenUrl = @ImagenUrl,Precio=@Precio WHERE IdProducto = @idProducto");
                datos.setearParametro("@Nombre", mod.Nombre);
                datos.setearParametro("@Muestra", mod.Muestra);
                datos.setearParametro("@ImagenUrl", mod.ImagenUrl);
                datos.setearParametro("@Precio", mod.Precio);
                datos.setearParametro("@IdProducto", mod.IdProducto);
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
