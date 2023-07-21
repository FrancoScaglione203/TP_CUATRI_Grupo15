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
    public partial class confirElimAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            string idUsuario =(Request.QueryString["id"].ToString());
            negocio.bajaFisica(idUsuario);

            Response.Redirect("Usuarios.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }
    }
}