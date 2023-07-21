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
    public partial class Usuarios : System.Web.UI.Page
    {
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
                UsuarioNegocio negocio = new UsuarioNegocio();
                Session.Add("listaUsuarios", negocio.listarUsuarios());
                dgvUsuarios.DataSource = Session["listaUsuarios"];
                dgvUsuarios.DataBind();
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

        protected void dgvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvUsuarios.PageIndex = e.NewPageIndex;
            dgvUsuarios.DataBind();
        }

        protected void dgvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvUsuarios.SelectedDataKey.Value.ToString();

            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario usuario = new Usuario();
            int ID= int.Parse(id);
            usuario = negocio.ObtenerUsuarioPorId(ID);

            if (usuario.Activo == true)
            {
                Response.Redirect("FormularioUsuario.aspx?id=" + id);
            }
            else
            {
                Response.Redirect("FormularioUsuario.aspx?id=" + id + "&activo=" + usuario.Activo);
            }

            


        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Usuario> lista = (List<Usuario>)Session["listaUsuarios"];
            List<Usuario> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvUsuarios.DataSource = listaFiltrada;
            dgvUsuarios.DataBind();
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
                dgvUsuarios.DataSource = negocio.filtrar(
                    ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text,
                    ddlEstado.SelectedItem.ToString());
                    dgvUsuarios.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
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
    }
}
