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
                datos.setearConsulta("Select EQUIPAMIENTO.Id,Nombre,Precio,Climatizador,SensorEstacionamiento,Computadora,ControlCrucero,Alarma,EQUIPAMIENTO.IdProducto,MAX(Imagenes.ImagenUrl) as ImagenUrl from EQUIPAMIENTO\r\ninner join Imagenes on Imagenes.IdProducto=EQUIPAMIENTO.IdProducto\r\ngroup by EQUIPAMIENTO.Id,Nombre,Precio,Climatizador,SensorEstacionamiento,Computadora,ControlCrucero,Alarma,EQUIPAMIENTO.IdProducto");
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


    }
}