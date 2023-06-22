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
    public class FichaTecnicaNegocio
    {
        public List<FichaTecnica> listar()
        {
            List<FichaTecnica> lista = new List<FichaTecnica>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id,Plazas,Longitud,Ancho,Ejes,CajaManual,CajaAutomatica,Nafta,IdProducto from Fichatecnica");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    FichaTecnica aux = new FichaTecnica();

                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                    {
                        aux.Id = (int)datos.Lector["Id"];
                        aux.Plazas = (int)datos.Lector["Plazas"];
                        aux.Longitud = (int)datos.Lector["Longitud"];
                        aux.Ancho = (int)datos.Lector["Ancho"];
                        aux.Ejes = (int)datos.Lector["Ejes"];
                        aux.CajaManual = (bool)datos.Lector["CajaManual"];
                        aux.CajaAutomatica = (bool)datos.Lector["CajaAutomatica"];
                        aux.Nafta = (bool)datos.Lector["Nafta"];
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
    }
}