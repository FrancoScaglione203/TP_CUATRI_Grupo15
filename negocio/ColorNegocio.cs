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
    }
}
