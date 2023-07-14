using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concesionaria_autos
{
    public partial class confirmar_pago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                decimal montoPago = (decimal)Session["montoPago"];
                string referenciaPago = (string)Session["referenciaPago"];

                lblMontoPago.Text = montoPago.ToString("N", new System.Globalization.CultureInfo("es-AR"));
                lblReferenciaPago.Text = referenciaPago;
            }
        }
    }
}