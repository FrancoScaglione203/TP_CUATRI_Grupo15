using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concesionaria_autos
{
    public partial class DetalleVenta : System.Web.UI.Page
    {
        protected List<Cuota> ListaCuotas
        {
            get { return (List<Cuota>)Session["listaCuotas"]; }
            set { Session["listaCuotas"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                CargarCuotas(id);
                BindGridView();
            }
        }

        protected void CargarCuotas(int idVenta)
        {
            CuotaNegocio negocio = new CuotaNegocio();
            ListaCuotas = negocio.listar().FindAll(x => x.IDVenta == idVenta);
        }

        protected void BindGridView()
        {
            dgvCuotas.DataSource = ListaCuotas;
            dgvCuotas.DataBind();
        }

        protected void dgvCuotas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvCuotas.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void dgvCuotas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvCuotas.SelectedDataKey.Value.ToString();
            Response.Redirect("DetalleVenta.aspx?id=" + id);
        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Cuota> listaFiltrada = ListaCuotas;
            // .FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvCuotas.DataSource = listaFiltrada;
            dgvCuotas.DataBind();
        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            txtFiltro.Enabled = !chkAvanzado.Checked;
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Número")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                dgvCuotas.DataSource = negocio.filtrar(
                    ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text,
                    ddlEstado.SelectedItem.ToString());
                dgvCuotas.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void dgvCuotas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ConfirmarCancelarPago")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = dgvCuotas.Rows[rowIndex];
                int cuotaId = Convert.ToInt32(dgvCuotas.DataKeys[row.RowIndex].Value);

                // Llamar al método PagarCancelarVenta para modificar el estado de la cuota
                PagarCancelarVenta(cuotaId);

                VentaNegocio negocioVenta = new VentaNegocio();
                int ventaId = Convert.ToInt32(Request.QueryString["id"]);
                negocioVenta.ActualizarCantidadCuotasPagadas(ventaId);

                // Redirigir nuevamente a la página actual para actualizar los datos
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        protected void dgvCuotas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnConfirmarPago = (Button)e.Row.FindControl("btnConfirmarPago");
                if (btnConfirmarPago != null)
                {
                    bool pagada = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "Pagada"));

                    btnConfirmarPago.Text = pagada ? "Cancelar Pago" : "Confirmar Pago";
                    btnConfirmarPago.CommandName = "ConfirmarCancelarPago";
                    btnConfirmarPago.CommandArgument = e.Row.RowIndex.ToString();
                }
            }
        }

        protected void PagarCancelarVenta(int cuotaId)
        {
            // Aquí debes implementar la lógica para modificar el estado de la cuota
            // utilizando el cuotaId y la capa de negocio correspondiente
            // Por ejemplo:
            VentaNegocio negocio = new VentaNegocio();
            Cuota cuota = ListaCuotas.FirstOrDefault(x => x.ID == cuotaId);
            if (cuota != null)
            {
                cuota.Pagada = !cuota.Pagada; // Cambiar el estado de pagada
                negocio.PagarCancelarVenta(cuota.ID); // Llamar a la función para modificar la cuota en la capa de negocio
            }
        }
    }
}
