using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace concesionaria_autos
{
    public partial class ventaCargada : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Venta venta = Session["VentaDatos"] as Venta;
                string dniComprador = venta.DNIComprador;
                string modeloAuto = venta.ModeloAuto;
                string versionAuto = venta.VersionAuto;
                int cantidadCuotas = venta.CantidadCuotas;
                string tapizado = venta.Tapizado;
                string color = venta.ColorAuto;

                // Asignar los valores a los controles de la página
                lblDNIComprador.Text = dniComprador;
                lblModeloAuto.Text = modeloAuto;
                lblVersionAuto.Text = versionAuto;
                lblCantidadCuotas.Text = cantidadCuotas.ToString();
                lblTapizado.Text = tapizado;
                lblColor.Text = color;
            }
        }

            protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}