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
using System.Text.RegularExpressions;
using System.Reflection;

namespace negocio
{
    public class AutoNeogocio
    {
        public List<Auto> listar()
        {
            List<Auto> lista = new List<Auto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT PRODUCTOS.Id, Nombre, Precio, Color, Estado, MIN(IMAGENES.ImagenUrl) AS ImagenUrl FROM PRODUCTOS\r\nINNER JOIN IMAGENES ON IMAGENES.IdProducto = PRODUCTOS.Id\r\nwhere PRODUCTOS.Estado=1\r\nGROUP BY PRODUCTOS.Id, Nombre, Precio, Color, Estado;");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Auto aux = new Auto();
 
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Precio = (decimal)datos.Lector["Precio"]; 
                    aux.Color = (int)datos.Lector["Color"];
                    aux.Estado = (bool)datos.Lector["Estado"];
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

        public List<Auto> listarFinanciados()
        {
            List<Auto> lista = new List<Auto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT PRODUCTOS.Id, Nombre, Precio, Color, Estado, MIN(IMAGENES.ImagenUrl) AS ImagenUrl\r\nFROM PRODUCTOS\r\nINNER JOIN IMAGENES ON IMAGENES.IdProducto = PRODUCTOS.Id\r\nGROUP BY PRODUCTOS.Id, Nombre, Precio, Color, Estado;");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Auto aux = new Auto();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.Color = (int)datos.Lector["Color"];
                    aux.Estado = (bool)datos.Lector["Estado"];
                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                    {
                        aux.Imagen = new Imagen();
                        aux.Imagen.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    }
                    aux.Financiacion();

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

        public int UltimoId()  //Funcion que muestra el Id de la nueva categoria a Agregar
        {
            int ultimoId = 0;
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IDENT_CURRENT('MARCAS') AS UltimoId");
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    ultimoId = Convert.ToInt32(datos.Lector["UltimoId"]);
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

            return ultimoId;
        }


        public int numeroIdModificar(Marca marca)     //Funcion que devuelve el Id de Categoria que se selecciono  o 0 si no hay ninguna
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("select Id from MARCAS where Id = " + marca.Id + "");
                datos.ejecutarLectura();

                if (datos.Lector.HasRows)
                {
                    datos.Lector.Read();
                    int id = (int)datos.Lector["Id"];
                    return id;
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


        public void modificar(Auto mod)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("update PRODUCTOS set Nombre = @Nombre ,Precio = @Precio,@Color = Color WHERE Id = @Id");
                datos.setearParametro("@Nombre", mod.Nombre);
                datos.setearParametro("@Precio", mod.Precio);
                datos.setearParametro("@Color", mod.Color);
                datos.setearParametro("@Id", mod.Id);
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


        public int agregar(Auto auto)
        {
            int id = 0;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("insert into PRODUCTOS (Nombre,Precio,Color) Values ('" + auto.Nombre + "','" + auto.Precio + "','" + auto.Color + "'); SELECT SCOPE_IDENTITY()");
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


        public void eliminar(int id)
        {
                AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update PRODUCTOS set Estado = 0 WHERE Id = @id");
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

        public List<Auto> listar(string id = "")
        {
            List<Auto> lista = new List<Auto>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select top 1 p.id, p.nombre,p.precio,i.idproducto, i.ImagenUrl, f.ancho, f.CajaManual,f.CajaAutomatica,f.Ejes,f.Longitud,f.Nafta,f.Plazas from productos p inner join imagenes i on p.id = i.idProducto inner join fichatecnica f on p.id = f.id where P.id ="+ id);
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Auto aux = new Auto();

                    aux.Id = (int)datos.Lector["id"];
                    aux.Nombre = (string)datos.Lector["nombre"];
                    aux.Precio = (decimal)datos.Lector["precio"];
                    aux.Imagen.IdProducto = (int)datos.Lector["idproducto"];
                    aux.Imagen.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    aux.FichaTecnica.Ancho = (int)datos.Lector["ancho"];
                    aux.FichaTecnica.CajaManual = (bool)datos.Lector["CajaManual"];
                    aux.FichaTecnica.CajaAutomatica = (bool)datos.Lector["CajaAutomatica"];
                    aux.FichaTecnica.Ejes = (int)datos.Lector["Ejes"];
                    aux.FichaTecnica.Longitud = (int)datos.Lector["Longitud"];
                    aux.FichaTecnica.Nafta = (bool)datos.Lector["Nafta"];
                    aux.FichaTecnica.Plazas = (int)datos.Lector["Plazas"];


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

        public void modificarConSP(Auto auto)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update Productos set Nombre = '" + auto.Nombre + "' ,Precio = '" + auto.Precio + "' WHERE id = '" + auto.Id + "'");
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

        public void agregarConSP(Auto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("storedAltaPokemon");
                //datos.setearParametro("@numero", nuevo.Numero);
                datos.setearParametro("@nombre", nuevo.Nombre);
                //datos.setearParametro("@desc", nuevo.Descripcion);
                //datos.setearParametro("@img", nuevo.UrlImagen);
                //datos.setearParametro("@idTipo", nuevo.Tipo.Id);
                //datos.setearParametro("@idDebilidad", nuevo.Debilidad.Id);
                //datos.setearParametro("@idEvolucion", null);
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
