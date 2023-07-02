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
    public partial class Autos : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Seguridad.esAdmin(Session["trainee"]))
            //{
            //    Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
            //    Response.Redirect("Error.aspx");
            //}


            FiltroAvanzado = chkAvanzado.Checked;
            if (!IsPostBack)
            {
                AutoNeogocio negocio = new AutoNeogocio();
                Session.Add("listaAutos", negocio.listar());
                dgvAutos.DataSource = Session["listaAutos"];
                dgvAutos.DataBind();
            }
        }

        protected void dgvAutos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvAutos.PageIndex = e.NewPageIndex;
            dgvAutos.DataBind();
        }

        protected void dgvAutos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvAutos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioAuto.aspx?id=" + id);
        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Auto> lista = (List<Auto>)Session["listaAutos"];
            List<Auto> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvAutos.DataSource = listaFiltrada;
            dgvAutos.DataBind();
        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            txtFiltro.Enabled = !FiltroAvanzado;
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
                dgvAutos.DataSource = negocio.filtrar(
                    ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text,
                    ddlEstado.SelectedItem.ToString());
                dgvAutos.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}