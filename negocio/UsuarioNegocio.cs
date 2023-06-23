﻿using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> listarConSP()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "select id,clave,tipousuario,nombre,apellido,dni,provincia,localidad from usuarios";
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
                    //aux.usuario = (string)datos.Lector["Usuario"];
                    //aux.Admin = (bool)datos.Lector["Admin"];
                    //aux.Activo = bool.Parse(datos.Lector["Activo"].ToString());

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
                datos.setearConsulta("select Id, TipoUsuario, Nombre, Apellido, Email, Provincia, Localidad from USUARIOS where USUARIOS.Dni = @dni and USUARIOS.Clave = @clave ");
                datos.setearParametro("@dni", usuario.Dni);
                datos.setearParametro("@clave", usuario.clave);
                datos.ejecutarLectura();
                
                while(datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.tipoUsuario = (int)(datos.Lector["TipoUsuario"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
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

    }

}
