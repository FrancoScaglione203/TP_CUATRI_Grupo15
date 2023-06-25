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
    public partial class ModificarPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario;
                UsuarioNegocio negocio = new UsuarioNegocio();

                usuario = (Usuario)Session["usuario"];

                txtApellido.Text = usuario.Apellido;
                txtNombre.Text = usuario.Nombre;
                txtProvincia.Text = usuario.Provincia;
                txtLocalidad.Text = usuario.Localidad;
                txtEmail.Text = usuario.Email;
                txtClave.Text = usuario.clave;
            }
        }


        public String dni()
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            usuario = (Usuario)Session["usuario"];
            string dni = usuario.Dni;
            return dni;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();
           

            usuario = (Usuario)Session["usuario"];


         
            usuario.Apellido = txtApellido.Text.ToString();
            usuario.Nombre = txtNombre.Text.ToString();
            usuario.Provincia = txtProvincia.Text.ToString();
            usuario.Localidad = txtLocalidad.Text.ToString();
            usuario.Email = txtEmail.Text.ToString();
            usuario.clave = txtClave.Text.ToString();

            negocio.ModificarPerfil(usuario);
            Session["usuario"] = (Usuario)usuario; 
            Response.Redirect("login.aspx");

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfirElimin.aspx");
        }
    }
}