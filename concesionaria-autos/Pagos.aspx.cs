using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;


namespace concesionaria_autos
{
    public partial class Pagos : System.Web.UI.Page
    {
        public List<Cuota> ListaCuotas { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CuotaNegocio cuotaNegocio = new CuotaNegocio();
            try
            {
                if (!IsPostBack)
                {
                    ListaCuotas = cuotaNegocio.listar();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}