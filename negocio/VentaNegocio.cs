using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class VentaNegocio
    {
        public List<Venta> listar()
        {
            List<Venta> lista = new List<Venta>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select DNIComprador,ModeloAuto,VersionAuto,CantidadCuotas,CuotasPagadas from venta");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Venta aux = new Venta();

                    aux.IDVenta = (int)datos.Lector["IDVenta"];
                    aux.DNIComprador = (string)datos.Lector["DNIComprador"];
                    aux.ModeloAuto = (string)datos.Lector["ModeloAuto"];
                    aux.VersionAuto = (string)datos.Lector["VersionAuto"];
                    aux.CantidadCuotas = (int)datos.Lector["CantidadCuotas"];
                    aux.CuotasPagadas = (int)datos.Lector["CuotasPagadas"];
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

        public void agregar(Venta nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = "values('" + nuevo.DNIComprador + "','" + nuevo.ModeloAuto + "','" + nuevo.VersionAuto + "'," + nuevo.CantidadCuotas + ",0)";
                datos.setearConsulta("insert into venta (DNIComprador,ModeloAuto,VersionAuto,CantidadCuotas,CuotasPagadas)" + valores);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }   
    }
}
