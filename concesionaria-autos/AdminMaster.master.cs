    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using Microsoft.Win32;

namespace concesionaria_autos
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {

        Usuario usuario = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!Seguridad.esAdmin(Session["usuario"]))
            //{
            //    Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
            //    Response.Redirect("Error.aspx");
            //}
        }
    }
}