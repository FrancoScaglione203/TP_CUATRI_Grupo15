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
    public class ConcesionariaNegocio
    {
        public List<Concesionaria> listar()
        {
            List<Concesionaria> lista = new List<Concesionaria>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id,Nombre,Descripcion,ImagenUrl,MapsUrl,SemanaAbre,SemanaCierra,SabadoAbre,SabadoCierra,Localidad,Provincia from CONCESIONARIAS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Concesionaria aux = new Concesionaria();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    aux.MapsUrl = (string)datos.Lector["MapsUrl"];
                    aux.SemanaAbre = (decimal)datos.Lector["SemanaAbre"];
                    aux.SemanaCierra = (decimal)datos.Lector["SemanaCierra"];
                    aux.SabadoAbre = (decimal)datos.Lector["SabadoAbre"];
                    aux.SabadoCierra = (decimal)datos.Lector["SabadoCierra"];
                    aux.Localidad = (string)datos.Lector["Localidad"];
                    aux.Provincia = (string)datos.Lector["Provincia"];
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
