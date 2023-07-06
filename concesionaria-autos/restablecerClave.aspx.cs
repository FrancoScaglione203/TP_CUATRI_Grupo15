using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concesionaria_autos
{
    public partial class restablecerClave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            string dni = Request.QueryString["dni"].ToString();
            string clave1 = txtClave1.Text;
            string clave2 = txtClave2.Text;

            //FALTA VALIDACION POR SI NO SON IGUALES
            
            int validacion;

            if (clave1 != clave2)
            {
               validacion = 1;
               Session["validacionClave"] = validacion;
            }
            else
            {
                negocio.CambiarClave(dni, clave1);
                Response.Redirect("default.aspx", false);
            }
            return;
        }
    }
}