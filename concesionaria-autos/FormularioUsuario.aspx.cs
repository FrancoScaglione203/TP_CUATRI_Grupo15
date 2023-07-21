using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concesionaria_autos
{
    public partial class FormularioUsuario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                Usuario usuario;
                UsuarioNegocio negocio = new UsuarioNegocio();
                int idUsuario = int.Parse(Request.QueryString["id"]);

                List<Usuario> lista = negocio.listarConSP();
                usuario = lista.Find(c => c.Id == idUsuario);

                string NombreApellido = usuario.Nombre + " " + usuario.Apellido;

                Session["usuarioNomApell"] = NombreApellido;



                txtApellido.Text = usuario.Apellido;
                txtNombre.Text = usuario.Nombre;
                txtProvincia.Text = usuario.Provincia;
                txtLocalidad.Text = usuario.Localidad;
                txtEmail.Text = usuario.Email;
                txtClave.Text = usuario.clave;
                ddlTipoUsuario.SelectedIndex = (int)usuario.tipoUsuario;
                /*
                if (usuario.tipoUsuario == TipoUsuario.ADMIN)
                {
                    ddlTipoUsuario.SelectedValue = "Admin";
                }
                else if (usuario.tipoUsuario == TipoUsuario.NORMAL)
                {
                    ddlTipoUsuario.SelectedValue = "Normal";
                }
                */



                Session["usuarioModif"] = usuario;
            }
        }


        public String dni()
        {

            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            int idUsuario = int.Parse(Request.QueryString["id"]);
            usuario = negocio.ObtenerUsuarioPorId(idUsuario);
            //usuario = (Usuario)Session["usuarioModif"];
            string dni = usuario.Dni;
            return dni;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {

            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            if (Request.QueryString["id"] != null)
            {
                usuario = Session["usuarioModif"] as Usuario;
            }
            else
            {
                if (Session["usuarioNuev"] == null) 
                {
                    usuario.Dni = txtDni.Text.ToString();
                }
                else 
                {
                    usuario = Session["usuarioNuev"] as Usuario;
                    usuario.Dni = txtDni.Text.ToString();
                }
                
            }


            usuario.Apellido = txtApellido.Text;
            usuario.Nombre = txtNombre.Text;
            usuario.Provincia = txtProvincia.Text.ToString();
            usuario.Localidad = txtLocalidad.Text.ToString();
            usuario.Email = txtEmail.Text.ToString();
            usuario.clave = txtClave.Text.ToString();
            //usuario.tipoUsuario = (TipoUsuario)ddlTipoUsuario.SelectedIndex;

            if (Request.QueryString["id"] != null)
            {
                negocio.ModificarPerfil(usuario);
                Response.Redirect("Usuarios.aspx", false);
            }
            else
            {
                negocio.agregar(usuario);
                Response.Redirect("Usuarios.aspx", false);
            }
            Session.Remove("usuarioNomApell");
            Session.Remove("usuarioModif");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
            Session.Remove("usuarioNomApell");
            Session.Remove("usuarioModif");
        }


        protected void btnEliminarFisic_Click(object sender, EventArgs e)
        {
            int idUsuario = int.Parse(Request.QueryString["id"]);
            Session.Remove("usuarioNomApell");
            Session.Remove("usuarioModif");
            Response.Redirect("confirElimAdmin.aspx?id=" + idUsuario);

        }

        protected void btnEliminarLog_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            int idUsuario = int.Parse(Request.QueryString["id"]);
            negocio.BajaLogica(idUsuario);
            Session.Remove("usuarioNomApell");
            Session.Remove("usuarioModif");
            Response.Redirect("Usuarios.aspx");

        }

        protected void btnActivarLog_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            int idUsuario = int.Parse(Request.QueryString["id"]);
            negocio.alta(idUsuario);
            Session.Remove("usuarioNomApell");
            Session.Remove("usuarioModif");
            Response.Redirect("Usuarios.aspx");
        }

        protected void ddlTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["usuarioModif"] != null)
            {
                Usuario usuario = Session["usuarioModif"] as Usuario;

                int valorSeleccionado = int.Parse(ddlTipoUsuario.SelectedValue);

                // Verificamos el valor seleccionado y asignamos el TipoUsuario correspondiente al objeto Usuario
                if (valorSeleccionado == 1)
                {
                    usuario.tipoUsuario = TipoUsuario.ADMIN;
                }
                else if (valorSeleccionado == 2)
                {
                    usuario.tipoUsuario = TipoUsuario.NORMAL;
                }

                Session["usuarioModif"] = usuario;
            }
            else
            {
                Usuario us = new Usuario();

                string valorSeleccionado = ddlTipoUsuario.SelectedValue;
                int valorEntero;

                if (int.TryParse(valorSeleccionado, out valorEntero))
                {
                    if (Enum.IsDefined(typeof(TipoUsuario), valorEntero))
                    {
                        us.tipoUsuario = (TipoUsuario)valorEntero;
                    }
                }
                Session["usuarioNuev"] = us;

            }
        }
    }
}