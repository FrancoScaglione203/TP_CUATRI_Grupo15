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
                datos.setearConsulta("Select Id,Nombre,Calle,Altura,Descripcion,ImagenUrl,MapsUrl,SemanaAbre,SemanaCierra,SabadoAbre,SabadoCierra,Localidad,Provincia from CONCESIONARIAS where Estado=1");
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

        public Concesionaria listar(int id)
        {
            List<Concesionaria> lista = new List<Concesionaria>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id,Nombre,Calle,Altura,Descripcion,ImagenUrl,MapsUrl,SemanaAbre,SemanaCierra,SabadoAbre,SabadoCierra,Localidad,Provincia from CONCESIONARIAS where Estado=1");
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
                Concesionaria concesionariaEncontrada = lista.FirstOrDefault(c => c.Id == id);
                int ahre = concesionariaEncontrada.Altura;
                return concesionariaEncontrada;
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
                datos.setearConsulta("update CONCESIONARIAS set Estado = 0 WHERE Id = @id");
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

        public Concesionaria mostrar(int id)
        {
            Concesionaria concesionaria = new Concesionaria();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Nombre, Calle,Altura,Descripcion, ImagenUrl, MapsUrl,SemanaAbre,SemanaCierra,SabadoAbre,SabadoCierra,Localidad,Provincia,Estado From CONCESIONARIAS where id="+id+"");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    concesionaria.Nombre = (string)datos.Lector["Nombre"];
                    concesionaria.Calle = (string)datos.Lector["Calle"];
                    concesionaria.Altura = (int)datos.Lector["Altura"];
                    concesionaria.Descripcion = (string)datos.Lector["Descripcion"];
                    concesionaria.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    concesionaria.MapsUrl = (string)datos.Lector["MapsUrl"];
                    concesionaria.SemanaAbre = (decimal)datos.Lector["SemanaAbre"];
                    concesionaria.SemanaCierra = (decimal)datos.Lector["SemanaCierra"];
                    concesionaria.SabadoAbre = (decimal)datos.Lector["SabadoAbre"];
                    concesionaria.SabadoCierra = (decimal)datos.Lector["SabadoCierra"];
                    concesionaria.Localidad = (string)datos.Lector["Localidad"];
                    concesionaria.Provincia = (string)datos.Lector["Provincia"];
                }


                return concesionaria;
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
                datos.setearConsulta("update CONCESIONARIAS set Nombre = '" + concesionaria.Nombre + "' ,Calle = '" + concesionaria.Calle + "' ,Altura = "+ concesionaria.Altura + " ,Descripcion = '" + concesionaria.Descripcion + "' ,ImagenUrl = '" + concesionaria.ImagenUrl + "' ,MapsUrl = '" + concesionaria.MapsUrl + "' ,Localidad = '" + concesionaria.Localidad + "' ,Provincia = '" + concesionaria.Provincia + "' , SemanaAbre = " + concesionaria.SemanaAbre + ", SemanaCierra = " + concesionaria.SemanaCierra + ", SabadoAbre = " + concesionaria.SabadoAbre + ", SabadoCierra = " + concesionaria.SabadoCierra + ",Estado = 1 WHERE id = " + concesionaria.Id + "  ");
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

        public void agregar(Concesionaria concesionaria)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            { 
                datos.setearConsulta("insert into CONCESIONARIAS(Nombre, Calle, Altura, Descripcion, ImagenUrl, MapsUrl, SemanaAbre, SemanaCierra, SabadoAbre, SabadoCierra, Localidad, Provincia, Estado) Values('" + concesionaria.Nombre + "', '"+concesionaria.Calle+"', "+concesionaria.Altura+", '"+concesionaria.Descripcion+"', '"+concesionaria.ImagenUrl+"', '"+concesionaria.MapsUrl+"', "+concesionaria.SemanaAbre+ ","+concesionaria.SemanaCierra+ ","+concesionaria.SabadoAbre+ ","+concesionaria.SabadoCierra+", '" + concesionaria.Localidad+"', '"+concesionaria.Provincia+"', 1)");
                datos.ejecutarAccion();
                return;
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
        public void ModificarConcesionaria(Concesionaria nuevo, int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("ModificarConcesionaria");
                datos.setearParametro("@Id", id);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Calle", nuevo.Calle);
                datos.setearParametro("@Altura", nuevo.Altura);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@ImagenUrl", nuevo.ImagenUrl);
                datos.setearParametro("@MapsUrl", nuevo.MapsUrl);
                datos.setearParametro("@SemanaAbre", nuevo.SemanaAbre);
                datos.setearParametro("@SemanaCierra", nuevo.SemanaCierra);
                datos.setearParametro("@SabadoAbre", nuevo.SabadoAbre);
                datos.setearParametro("@SabadoCierra", nuevo.SabadoCierra);
                datos.setearParametro("@Localidad", nuevo.Localidad);
                datos.setearParametro("@Provincia", nuevo.Provincia);
                datos.ejecutarAccion();
                return;
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
        public void InsertarNuevo(Concesionaria nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("insertarConcesionaria");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Calle", nuevo.Calle);
                datos.setearParametro("@Altura", nuevo.Altura);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@ImagenUrl", nuevo.ImagenUrl);
                datos.setearParametro("@MapsUrl", nuevo.MapsUrl);
                datos.setearParametro("@SemanaAbre", nuevo.SemanaAbre);
                datos.setearParametro("@SemanaCierra", nuevo.SemanaCierra);
                datos.setearParametro("@SabadoAbre", nuevo.SabadoAbre);
                datos.setearParametro("@SabadoCierra", nuevo.SabadoCierra);
                datos.setearParametro("@Localidad", nuevo.Localidad);
                datos.setearParametro("@Provincia", nuevo.Provincia);
                datos.ejecutarAccion();
                return;



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
