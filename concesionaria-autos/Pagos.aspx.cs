using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace concesionaria_autos
{
    public partial class Pagos : System.Web.UI.Page
    {
        public List<Cuota> ListaCuotas { get; set; }
        public decimal MontoPago { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CuotaNegocio cuotaNegocio = new CuotaNegocio();
            int idVenta = Convert.ToInt32(Session["idVenta"]);

            try
            {
                if (!IsPostBack)
                {
                    ListaCuotas = cuotaNegocio.listar();
                    ListaCuotas = ListaCuotas.FindAll(x => x.IDVenta == idVenta);

                    rptCuotas.DataSource = ListaCuotas;
                    rptCuotas.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void rptCuotas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Cuota cuota = e.Item.DataItem as Cuota;

                if (cuota != null)
                {
                    CheckBox chkCuota = e.Item.FindControl("chkCuota") as CheckBox;

                    if (chkCuota != null)
                    {
                        chkCuota.Attributes.Add("data-monto", cuota.Monto.ToString());
                    }
                }
            }
        }

        protected void chkCuota_CheckedChanged(object sender, EventArgs e)
        {
            CalcularMontoPago();
            lblMontoPago.Text = MontoPago.ToString("N", new System.Globalization.CultureInfo("es-AR"));
        }

        protected void CalcularMontoPago()
        {
            MontoPago = 0;

            foreach (RepeaterItem item in rptCuotas.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chkCuota = item.FindControl("chkCuota") as CheckBox;

                    if (chkCuota != null && chkCuota.Checked)
                    {
                        decimal monto = decimal.Parse(chkCuota.Attributes["data-monto"]);
                        MontoPago += monto;
                    }
                }
            }
        }
    }
}
