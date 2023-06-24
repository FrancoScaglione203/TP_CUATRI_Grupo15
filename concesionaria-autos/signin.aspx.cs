using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace concesionaria_autos
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = new Usuario();
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                user.clave = txtClave.Text;
                user.tipoUsuario = TipoUsuario.NORMAL;
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.Dni = txtDni.Text;
                user.Email = txtEmail.Text;
                user.Provincia = txtProvincia.Text;
                user.Localidad = txtLocalidad.Text;
                user.Activo = true;
                int id = usuarioNegocio.InsertarNuevo(user);
                Response.Redirect("default.aspx");
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }

        }
    }
}