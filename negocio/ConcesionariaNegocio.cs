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
                datos.setearConsulta("Select Id,Nombre,Calle,Altura,Descripcion,ImagenUrl,MapsUrl,SemanaAbre,SemanaCierra,SabadoAbre,SabadoCierra,Localidad,Provincia from CONCESIONARIAS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Concesionaria aux = new Concesionaria();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Calle = (string)datos.Lector["Calle"];
                    aux.Altura = (int)datos.Lector["Altura"];
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

        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update CONCECIONARIAS set Estado = 0 WHERE Id = @id");
                datos.setearParametro("@id", id);
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

        public void modificar(Concesionaria concesionaria)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update CONCESIONARIAS set Nombre = '" + concesionaria.Nombre + "' ,Calle = '" + concesionaria.Calle + "' ,Altura = "+ concesionaria.Altura + " ,Descripcion = '" + concesionaria.Descripcion + "' ,ImagenUrl = '" + concesionaria.ImagenUrl + "' ,MapsUrl = '" + concesionaria.MapsUrl + "' ,Localidad = '" + concesionaria.Localidad + "' ,Provincia = '" + concesionaria.Provincia + "' ,Estado = 1 WHERE id = " + concesionaria.Id + "  ");
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

        public int agregar(Concesionaria concesionaria)
        {
            int id = 0;
            AccesoDatos datos = new AccesoDatos();
            try
            { 
                datos.setearConsulta("insert into CONCESIONARIAS(Nombre, Calle, Altura, Descripcion, ImagenUrl, MapsUrl, SemanaAbre, SemanaCierra, Localidad, Provincia, Estado) Values('" + concesionaria.Nombre + "', '"+concesionaria.Calle+"', "+concesionaria.Altura+", '"+concesionaria.Descripcion+"', '"+concesionaria.ImagenUrl+"', '"+concesionaria.MapsUrl+"', 10, 10, '"+concesionaria.Localidad+"', '"+concesionaria.Provincia+"', 1)");
                
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



        public List<Concesionaria> FiltrarAutosAvanzado(string campo, string criterio, string filtro, string estado)
        {
            List<Concesionaria> lista = listar();

            List<Concesionaria> listaFiltrada = lista;

            if (!string.IsNullOrEmpty(filtro))
            {
                if (campo == "Nombre")
                {
                    if (criterio == "Contiene")
                        listaFiltrada = listaFiltrada.Where(a => a.Nombre.Contains(filtro)).ToList();
                    else if (criterio == "Comienza con")
                        listaFiltrada = listaFiltrada.Where(a => a.Nombre.StartsWith(filtro)).ToList();
                    else if (criterio == "Termina con")
                        listaFiltrada = listaFiltrada.Where(a => a.Nombre.EndsWith(filtro)).ToList();
                }
                else if (campo == "Precio")
                {

                }
            }

            if (estado != "Todos")
            {
                bool estadoActivo = (estado == "Activo");
                listaFiltrada = listaFiltrada.Where(a => a.Estado == estadoActivo).ToList();
            }

            return listaFiltrada;
        }

    }
}
