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
    public partial class Contactanos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviarConsulta_Click(object sender, EventArgs e)
        {
            try
            {
                string asunto,consulta;
                
                asunto=txtAsunto.Text;
                consulta = txtConsulta.Text;

                //ENVIAR MAIL
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("ErrorLog.aspx");
            }
        }
    }
}