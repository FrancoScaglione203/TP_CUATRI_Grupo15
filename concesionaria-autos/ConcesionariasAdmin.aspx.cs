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
    public partial class ConcesionariasAdmin : System.Web.UI.Page
   {

        protected void dgvConcesionarias_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvConcesionarias.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioConcesionaria.aspx?id=" + id);
        }

        public bool FiltroAvanzado
        {
            get
            {
                if (Session["FiltroAvanzado"] != null)
                    return (bool)Session["FiltroAvanzado"];
                else
                    return false; // Valor predeterminado si no se encuentra en la sesión
            }
            set
            {
                Session["FiltroAvanzado"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
                UpdateFiltroAvanzadoAppearance();

            if (!IsPostBack)
            {
                //FiltroAvanzado = false;
                ConcesionariaNegocio negocio = new ConcesionariaNegocio();
                Session.Add("listaConcesionarias", negocio.listar());
                dgvConcesionarias.DataSource = Session["listaConcesionarias"];
                dgvConcesionarias.DataBind();
            }
        }

        protected void dgvConcesionarias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvConcesionarias.PageIndex = e.NewPageIndex;
            dgvConcesionarias.DataBind();
        }


        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Concesionaria> lista = (List<Concesionaria>)Session["listaConcesionarias"];
            List<Concesionaria> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvConcesionarias.DataSource = listaFiltrada;
            dgvConcesionarias.DataBind();
        }

        protected void btnFiltroAvanzado_Click(object sender, EventArgs e)
        {
            FiltroAvanzado = !FiltroAvanzado;

            if (FiltroAvanzado)
            {
                btnFiltroAvanzado.Text = "Filtro Avanzado: Activado";
                btnFiltroAvanzado.CssClass = "btn btn-primary active";
                txtFiltro.Enabled = false;
            }
            else
            {
                btnFiltroAvanzado.Text = "Filtro Avanzado: Desactivado";
                btnFiltroAvanzado.CssClass = "btn btn-primary";
                txtFiltro.Enabled = true;
            }
        }

        protected void UpdateFiltroAvanzadoAppearance()
        {
            if (FiltroAvanzado)
            {
                btnFiltroAvanzado.CssClass = "btn btn-primary active";
                btnFiltroAvanzado.Text = "Filtro Avanzado: Activado";
            }
            else
            {
                btnFiltroAvanzado.CssClass = "btn btn-primary";
                btnFiltroAvanzado.Text = "Filtro Avanzado: Desactivado";
            }
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
                ConcesionariaNegocio negocio = new ConcesionariaNegocio();
                List<Concesionaria> listaFiltrada = negocio.FiltrarAutosAvanzado(
                    ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text,
                    ddlEstado.SelectedItem.ToString());

                dgvConcesionarias.DataSource = listaFiltrada;
                dgvConcesionarias.DataBind();
            }
            catch (Exception ex)
            {
                // Manejar la excepción apropiadamente
                Session.Add("error", ex);
                throw;
            }
        }

        protected void dgvConcesionarias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvConcesionarias.Rows[rowIndex];
            int id = Convert.ToInt32(dgvConcesionarias.DataKeys[row.RowIndex].Value);

            if (e.CommandName == "Eliminar")
            { 
                ConcesionariaNegocio concesionariaNeogocio = new ConcesionariaNegocio();
                concesionariaNeogocio.eliminar(id);
            }
        }
    }
}