using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class FinanciacionNegocio
    {
        public List<Financiacion> listar()
        {
            List<Financiacion> lista = new List<Financiacion>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select * from Financiacion");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Financiacion aux = new Financiacion();

                    aux.CantCuotas = (int)datos.Lector["cantidadCuotas"];
                    aux.DsCuotas = (decimal)datos.Lector["DsCuotas"];
                    aux.GastoEntrega = (decimal)datos.Lector["GastoEntrega"];
                    aux.GastoAdministrativo = (decimal)datos.Lector["GastoAdministrativo"];
                    aux.Cuota1A20 = (decimal)datos.Lector["Cuotas1A20"];
                    aux.Cuota21A40 = (decimal)datos.Lector["Cuotas21A40"];
                    aux.Cuota41A60 = (decimal)datos.Lector["Cuotas41A60"];
                    aux.Cuota61A80 = (decimal)datos.Lector["Cuotas61A80"];
                    aux.Cuota81A100 = (decimal)datos.Lector["Cuotas81A100"];

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
