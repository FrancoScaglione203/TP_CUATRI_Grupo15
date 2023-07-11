using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
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
                datos.setearConsulta("  Select IDVenta,DNIComprador,p.Nombre as 'Modelo' ,e.Nombre as 'Version' ,c.Nombre as 'Color',c.ImagenUrl as 'Imagen',tapizado,CantidadCuotas,CuotasPagadas from venta v inner join productos p on p.Id = v.idModelo inner join EQUIPAMIENTO e on e.Id = v.idVersion inner join COLORES c on c.Id = v.idColor");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Venta aux = new Venta();

                    aux.IDVenta = (int)datos.Lector["IDVenta"];
                    aux.DNIComprador = (string)datos.Lector["DNIComprador"];
                    aux.ModeloAuto = (string)datos.Lector["Modelo"];
                    aux.VersionAuto = (string)datos.Lector["Version"];
                    aux.ColorAuto = (string)datos.Lector["Color"];
                    aux.UrlImagen = (string)datos.Lector["Imagen"];
                    aux.Tapizado = (string)datos.Lector["Tapizado"];
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

        public int agregar(Venta nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            int id = 0;
            try
            {
                string valores = "values('" + nuevo.DNIComprador + "','" + nuevo.idModelo + "','" + nuevo.idVersion + "', '" + nuevo.idColor + "', '" + nuevo.Tapizado + "', '" + nuevo.CantidadCuotas + "', 0); SELECT SCOPE_IDENTITY()";


                datos.setearConsulta("insert into venta (DNIComprador,idModelo,idVersion,idColor,Tapizado,CantidadCuotas,CuotasPagadas)" + valores);
                id = datos.leerIdUltimoCreado();

                return id;
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

        public void PagarCancelarVenta(int cuotaId)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Cuota SET Pagada = ~Pagada WHERE ID = @CuotaId");
                datos.setearParametro("@CuotaId", cuotaId);
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

        public void ActualizarCantidadCuotasPagadas(int ventaId)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Venta SET CuotasPagadas = (SELECT COUNT(*) FROM Cuota WHERE IDVenta = @VentaId AND Pagada = 1) WHERE IDVenta = @VentaId");
                datos.setearParametro("@VentaId", ventaId);
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

        public void ActualizarVenta(Venta venta)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Venta SET CuotasPagadas = @CuotasPagadas WHERE IDVenta = @VentaId");
                datos.setearParametro("@CuotasPagadas", venta.CuotasPagadas);
                datos.setearParametro("@VentaId", venta.IDVenta);
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
