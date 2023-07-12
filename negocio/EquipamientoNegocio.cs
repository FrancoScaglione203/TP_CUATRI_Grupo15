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
    public class EquipamientoNegocio
    {
        public List<Equipamiento> listar()
        {
            List<Equipamiento> lista = new List<Equipamiento>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select EQUIPAMIENTO.Id,Nombre,Precio,Climatizador,SensorEstacionamiento,Computadora,ControlCrucero,Alarma,EQUIPAMIENTO.IdProducto,MIN(Imagenes.ImagenUrl) as ImagenUrl from EQUIPAMIENTO\r\ninner join Imagenes on Imagenes.IdProducto=EQUIPAMIENTO.IdProducto\r\ngroup by EQUIPAMIENTO.Id,Nombre,Precio,Climatizador,SensorEstacionamiento,Computadora,ControlCrucero,Alarma,EQUIPAMIENTO.IdProducto");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Equipamiento aux = new Equipamiento();

                        aux.Id = (int)datos.Lector["Id"];
                        aux.Nombre = (string)datos.Lector["Nombre"];
                        aux.Precio = (decimal)datos.Lector["Precio"];
                        aux.Climatizador = (bool)datos.Lector["Climatizador"];
                        aux.SensorEstacionamiento = (bool)datos.Lector["SensorEstacionamiento"];
                        aux.Computadora = (bool)datos.Lector["Computadora"];
                        aux.ControlCrucero = (bool)datos.Lector["ControlCrucero"];
                        aux.Alarma = (bool)datos.Lector["Alarma"];
                        aux.IdProducto = (int)datos.Lector["IdProducto"];
                        if (!(datos.Lector["ImagenUrl"] is DBNull))
                        {
                            aux.Imagen = new Imagen();
                            aux.Imagen.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                        }
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

        public List<Equipamiento> listarUnModelo(int idModelo)
        {
            List<Equipamiento> lista = new List<Equipamiento>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select id,Nombre,Precio,Climatizador,SensorEstacionamiento,Computadora,ControlCrucero,Alarma,IdProducto from equipamiento where IdProducto = " + idModelo);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Equipamiento aux = new Equipamiento();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Precio = (decimal)datos.Lector["Precio"]; 
                    aux.Climatizador = (bool)datos.Lector["Climatizador"];
                    aux.SensorEstacionamiento = (bool)datos.Lector["SensorEstacionamiento"];
                    aux.Computadora = (bool)datos.Lector["Computadora"];
                    aux.ControlCrucero = (bool)datos.Lector["ControlCrucero"];
                    aux.Alarma = (bool)datos.Lector["Alarma"];
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

        public decimal getPrecioAuto(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select precio from Equipamiento where id = " + id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    decimal precio = (decimal)datos.Lector["precio"];
                    return precio;
                }
                else
                {
                    return 0;
                }
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

        public void agregar(Equipamiento nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into EQUIPAMIENTO(Nombre,Precio,Climatizador,SensorEstacionamiento,Computadora,ControlCrucero,Alarma,IdProducto)values(@Nombre, @Precio, @Climatizador, @SensorEstacionamiento,@Computadora,@ControlCrucero,@Alarma,@IdProducto)");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Precio", nuevo.Precio);
                datos.setearParametro("@Climatizador", nuevo.Climatizador);
                datos.setearParametro("@SensorEstacionamiento", nuevo.SensorEstacionamiento);
                datos.setearParametro("@Computadora", nuevo.Computadora);
                datos.setearParametro("@ControlCrucero", nuevo.ControlCrucero);
                datos.setearParametro("@Alarma", nuevo.Alarma);
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

        public void modificar(Equipamiento mod)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update EQUIPAMIENTO set Nombre = @Nombre ,Precio = @Precio,Climatizador = @Climatizador,@SensorEstacionamiento=SensorEstacionamiento,@Computadora=Computadora,@ControlCrucero=ControlCrucero,@Alarma=Alarma WHERE IdProducto = @idProducto");
                datos.setearParametro("@Nombre", mod.Nombre);
                datos.setearParametro("@Precio", mod.Precio);
                datos.setearParametro("@Climatizador", mod.Climatizador);
                datos.setearParametro("@SensorEstacionamiento", mod.SensorEstacionamiento);
                datos.setearParametro("@Computadora", mod.Computadora);
                datos.setearParametro("@ControlCrucero", mod.ControlCrucero);
                datos.setearParametro("@Alarma", mod.Alarma);
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