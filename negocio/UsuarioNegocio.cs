using dominio;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace negocio
{
    public class UsuarioNegocio
    {



        public List<Usuario> listarUsuarios()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "select Id,Clave,TipoUsuario,Nombre,Apellido,Dni,Email,Provincia,Localidad,Estado from usuarios";
                datos.setearConsulta(consulta);
                //datos.setearProcedimiento("storedListar");

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.clave = (string)datos.Lector["Clave"];
                    aux.tipoUsuario = (TipoUsuario)(int)datos.Lector["TipoUsuario"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Provincia = (string)datos.Lector["Provincia"];
                    aux.Localidad = (string)(datos.Lector["Localidad"]);
                    aux.Activo = (bool)(datos.Lector["Estado"]);

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ValidacionDniEmail(string dni, string email)
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            lista = listarUsuarios();

            Usuario userdni = lista.Find(u => u.Dni == dni);
            Usuario useremail = lista.Find(u => u.Email == email);

            if(userdni == null && useremail == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        public List<Usuario> listarConSP()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "select Id,Clave,TipoUsuario,Nombre,Apellido,Dni,Provincia,Localidad, Email from usuarios";
                datos.setearConsulta(consulta);
                //datos.setearProcedimiento("storedListar");

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.clave = (string)datos.Lector["Clave"];
                    aux.Provincia = (string)datos.Lector["Provincia"];
                    aux.Localidad = (string)datos.Lector["Localidad"];
                    aux.tipoUsuario = (TipoUsuario)datos.Lector["TipoUsuario"];


                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Usuario> filtrar(string campo, string criterio, string filtro, string estado)
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "select id,usuario,clave,tipousuario,nombre,apellido,dni,provincia,localidad from usuarios";
                if (campo == "Número")
                {
                    switch (criterio)
                    {
                        case "Mayor a":
                            consulta += "Numero > " + filtro;
                            break;
                        case "Menor a":
                            consulta += "Numero < " + filtro;
                            break;
                        default:
                            consulta += "Numero = " + filtro;
                            break;
                    }
                }
                else if (campo == "Nombre")
                {
                    switch (criterio)
                    {
                        case "Comienza con":
                            consulta += "Nombre like '" + filtro + "%' ";
                            break;
                        case "Termina con":
                            consulta += "Nombre like '%" + filtro + "'";
                            break;
                        default:
                            consulta += "Nombre like '%" + filtro + "%'";
                            break;
                    }
                }
                else
                {
                    switch (criterio)
                    {
                        case "Comienza con":
                            consulta += "E.Descripcion like '" + filtro + "%' ";
                            break;
                        case "Termina con":
                            consulta += "E.Descripcion like '%" + filtro + "'";
                            break;
                        default:
                            consulta += "E.Descripcion like '%" + filtro + "%'";
                            break;
                    }
                }
                       if (estado == "Activo")
                    consulta += " and P.Activo = 1";
                else if (estado == "Inactivo")
                    consulta += " and P.Activo = 0";
                       datos.setearConsulta(consulta);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                  aux.Dni = (string)datos.Lector["Dni"];
                    aux.Admin = (bool)datos.Lector["Admin"];
                    aux.Activo = bool.Parse(datos.Lector["Activo"].ToString());
                           lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id, TipoUsuario, Nombre, Apellido, Email, Provincia, Localidad, Estado from USUARIOS where USUARIOS.Dni = @dni and USUARIOS.Clave = @clave and Estado = 1 ");
                datos.setearParametro("@dni", usuario.Dni);
                datos.setearParametro("@clave", usuario.clave);
                datos.ejecutarLectura();


                
                while(datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.tipoUsuario = (int)(datos.Lector["TipoUsuario"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    usuario.Nombre = datos.Lector["Nombre"].ToString();
                    usuario.Apellido = datos.Lector["Apellido"].ToString();
                    usuario.Provincia = datos.Lector["Provincia"].ToString();
                    usuario.Localidad = datos.Lector["Localidad"].ToString();
                    usuario.Email = datos.Lector["Email"].ToString();

                    return true;
                }
                return false;
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

        public void InsertarNuevoDesdeAdmin(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("insertarNuevoDesdeAdmin");
                datos.setearParametro("@clave", nuevo.clave);
                datos.setearParametro("@TipoUsuario", nuevo.tipoUsuario);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Dni", nuevo.Dni);
                datos.setearParametro("@Email", nuevo.Email);
                datos.setearParametro("@Provincia", nuevo.Provincia);
                datos.setearParametro("@Localidad", nuevo.Localidad);         

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

        public int InsertarNuevo(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("insertarNuevo");
                datos.setearParametro("@clave", nuevo.clave);
                datos.setearParametro("@TipoUsuario", nuevo.tipoUsuario);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Dni", nuevo.Dni);
                datos.setearParametro("@Email", nuevo.Email);
                datos.setearParametro("@Provincia", nuevo.Provincia);
                datos.setearParametro("@Localidad", nuevo.Localidad);
                return datos.ejecutarAccionScalar();



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

        public void ModificarPerfil(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("ModificarPerfil");
                datos.setearParametro("@id", nuevo.Id);
                datos.setearParametro("@clave", nuevo.clave);
                datos.setearParametro("@TipoUsuario", nuevo.tipoUsuario);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Email", nuevo.Email);
                datos.setearParametro("@Provincia", nuevo.Provincia);
                datos.setearParametro("@Localidad", nuevo.Localidad);
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

        public void BajaLogica(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("BajaLogica");
                datos.setearParametro("@Id", id);
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

        public void alta(int id)
        {
          
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update USUARIOS set estado = 1 where id="+id+"");
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


        public Usuario ObtenerUsuarioPorId(int usuarioId)
        {
            Usuario usuario = null;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT Id, Clave, TipoUsuario, Nombre, Apellido, Dni, Email, Provincia, Localidad, Estado FROM usuarios WHERE Id = @UsuarioId";
                datos.setearConsulta(consulta);
                datos.setearParametro("@UsuarioId", usuarioId);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario = new Usuario();
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.clave = (string)datos.Lector["Clave"];
                    usuario.tipoUsuario = (TipoUsuario)(int)datos.Lector["TipoUsuario"];
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Apellido = (string)datos.Lector["Apellido"];
                    usuario.Dni = (string)datos.Lector["Dni"];
                    usuario.Email = (string)datos.Lector["Email"];
                    usuario.Provincia = (string)datos.Lector["Provincia"];
                    usuario.Localidad = (string)datos.Lector["Localidad"];
                    usuario.Activo = (bool)datos.Lector["Estado"];
                }

                return usuario;
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

        public Usuario BuscarUsuarioPorDNI(int dni)
        {
            Usuario usuario = null;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT Id, Clave, TipoUsuario, Nombre, Apellido, Dni, Email, Provincia, Localidad, Estado FROM usuarios WHERE Dni = @dni";
                datos.setearConsulta(consulta);
                datos.setearParametro("@dni", dni);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario = new Usuario();
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.clave = (string)datos.Lector["Clave"];
                    usuario.tipoUsuario = (TipoUsuario)(int)datos.Lector["TipoUsuario"];
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Apellido = (string)datos.Lector["Apellido"];
                    usuario.Dni = (string)datos.Lector["Dni"];
                    usuario.Email = (string)datos.Lector["Email"];
                    usuario.Provincia = (string)datos.Lector["Provincia"];
                    usuario.Localidad = (string)datos.Lector["Localidad"];
                    usuario.Activo = (bool)datos.Lector["Estado"];
                }

                return usuario;
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

        public void CambiarClave(string dni, string clave)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("ModificarClave");
                datos.setearParametro("@dni", dni);
                datos.setearParametro("@clave", clave);
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

        public void agregar(Usuario usuario)
        {
            
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("insert into USUARIOS(Clave, TipoUsuario, Nombre, Apellido,Dni, Email,Provincia,Localidad,Estado) Values ('"+usuario.clave+"',"+(int)usuario.tipoUsuario+",'"+usuario.Nombre+"','"+usuario.Apellido+"','"+usuario.Dni+"','"+usuario.Email+"','"+usuario.Provincia+"','"+usuario.Localidad+"', 1)");
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

        public void bajaFisica(string id)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from USUARIOS where id = "+id+"");
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

    }

}
