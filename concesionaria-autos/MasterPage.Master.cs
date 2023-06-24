using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concesionaria_autos
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (Session["usuario"] != null)
            {
                string nombreUsuario = Session["nombreUsuario"].ToString();
                lblIngresar.Text = nombreUsuario;
            }
            else
            {
                lblIngresar.Text = "Ingresar";
            }




        }

        protected void btnLoginSingin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}