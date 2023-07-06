using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public  class CuotaNegocio
    {
        public void agregar(Cuota cuota)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {

                    datos.setearConsulta("insert into Cuota (IdVenta,NumeroCuota,Monto,FechaVencimiento,Pagada) values (@IdVenta,@NumeroCuota,@Monto,@FechaVencimiento,@Pagada)");
                    datos.setearParametro("@IdVenta", cuota.IDVenta);
                    datos.setearParametro("@NumeroCuota", cuota.NumeroCuota);
                    datos.setearParametro("@Monto", cuota.Monto);
                    datos.setearParametro("@FechaVencimiento", cuota.FechaVencimiento);
                    datos.setearParametro("@Pagada", cuota.Pagada);
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

        public List<Cuota> listar()
        {

            List<Cuota> lista = new List<Cuota>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id,IdVenta,NumeroCuota,Monto,FechaVencimiento,Pagada from Cuota");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cuota aux = new Cuota();
                    aux.ID = datos.Lector.GetInt32(0);
                    aux.IDVenta = datos.Lector.GetInt32(1);
                    aux.NumeroCuota = datos.Lector.GetInt32(2);
                    aux.Monto = datos.Lector.GetDecimal(3);
                    aux.FechaVencimiento = datos.Lector.GetDateTime(4);
                    aux.Pagada = datos.Lector.GetBoolean(5);
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
