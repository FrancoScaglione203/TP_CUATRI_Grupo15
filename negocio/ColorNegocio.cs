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
    public class ColorNegocio
    {
        public List<Color> listar()
        {
            List<Color> lista = new List<Color>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id,Nombre,Muestra,ImagenUrl,IdProducto from COLORES");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Color aux = new Color();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Muestra = (string)datos.Lector["Muestra"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];
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

        public List<Color> BuscarImagenPorIdAuto(int idAuto)
        {
            List<Color> lista = new List<Color>();
            lista = listar().FindAll(x => x.IdProducto == idAuto);

            return lista;
        }

        public void agregar(Color nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into COLORES(Nombre,Muestra,ImagenUrl,IdProducto)values(@Nombre, @Muestra, @ImagenUrl, @IdProducto)");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Muestra", nuevo.Muestra);
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

        public void modificar(Color mod)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update DESCRIPCION set Nombre = @Nombre ,Muestra = @Muestra,ImagenUrl = @ImagenUrl WHERE IdProducto = @idProducto");
                datos.setearParametro("@Nombre", mod.Nombre);
                datos.setearParametro("@Muestra", mod.Muestra);
                datos.setearParametro("@ImagenUrl", mod.ImagenUrl);
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
