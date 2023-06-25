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
    public partial class ConfirElimin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();


            usuario = (Usuario)Session["usuario"];
            negocio.BajaLogica(usuario.Id);
            Session.RemoveAll();
            Response.Redirect("default.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarPerfil.aspx");
        }
    }
}