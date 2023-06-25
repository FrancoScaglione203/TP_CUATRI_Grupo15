using negocio;
using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concesionaria_autos
{
    public partial class ListaFichaTecnica : System.Web.UI.Page
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
                FichaTecnicaNegocio negocio = new FichaTecnicaNegocio();
                Session.Add("listaFT", negocio.listar());
                dgvFT.DataSource = Session["listaFT"];
                dgvFT.DataBind();
            }
        }

        protected void dgvFT_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvFT.PageIndex = e.NewPageIndex;
            dgvFT.DataBind();
        }

        protected void dgvFT_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvFT.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioAuto.aspx?id=" + id);
        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<FichaTecnica> lista = (List<FichaTecnica>)Session["listaFT"];
            //List<FichaTecnica> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            //dgvFT.DataSource = listaFiltrada;
            dgvFT.DataBind();
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
                dgvFT.DataSource = negocio.filtrar(
                    ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text,
                    ddlEstado.SelectedItem.ToString());
                dgvFT.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    } 
}