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

        public void agregar(FichaTecnica nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into FICHATECNICA(IdProducto,Plazas,Longitud,Ancho,Ejes,CajaManual,CajaAutomatica,Nafta)values(@IdProducto, @Plazas, @Longitud, @Ancho, @Ejes, @CajaManual, @CajaAutomatica, @Nafta)");
                datos.setearParametro("@IdProducto", nuevo.IdProducto);
                datos.setearParametro("@Plazas", nuevo.Plazas);
                datos.setearParametro("@Longitud", nuevo.Longitud);
                datos.setearParametro("@Ancho", nuevo.Ancho);
                datos.setearParametro("@Ejes", nuevo.Ejes);
                datos.setearParametro("@CajaManual", nuevo.CajaManual);
                datos.setearParametro("@CajaAutomatica", nuevo.CajaAutomatica);
                datos.setearParametro("@Nafta", nuevo.Nafta);
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

        public void modificar(FichaTecnica ft)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update FICHATECNICA set Plazas = @Plazas ,Longitud = @Longitud,Ancho = @Ancho,Ejes = @Ejes,CajaManual = @CajaManual,CajaAutomatica = @CajaAutomatica,Nafta = @Nafta WHERE IdProducto = @id");
                datos.setearParametro("@Plazas", ft.Plazas);
                datos.setearParametro("@Longitud", ft.Longitud);
                datos.setearParametro("@Ancho", ft.Ancho);
                datos.setearParametro("@Ejes", ft.Ejes);
                datos.setearParametro("@CajaManual", ft.CajaManual);
                datos.setearParametro("@CajaAutomatica", ft.CajaAutomatica);
                datos.setearParametro("@Nafta", ft.Nafta);
                datos.setearParametro("@id", ft.IdProducto);
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
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Delete from FichaTecnica Where IdProducto =" + id);
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