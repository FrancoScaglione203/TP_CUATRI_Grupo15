﻿using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace concesionaria_autos
{
	public partial class Ventas : System.Web.UI.Page
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
            //if (!Seguridad.esAdmin(Session["trainee"]))
            //{
            //    Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
            //    Response.Redirect("Error.aspx");
            //}


            UpdateFiltroAvanzadoAppearance();

            if (!IsPostBack)
            {
                VentaNegocio negocio = new VentaNegocio();
                Session.Add("listaVentas", negocio.listar());
                dgvVentas.DataSource = Session["listaVentas"];
                dgvVentas.DataBind();
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

        protected void dgvVentas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvVentas.PageIndex = e.NewPageIndex;
            dgvVentas.DataBind();
        }

        protected void dgvVentas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvVentas.SelectedDataKey.Value.ToString();
            Response.Redirect("DetalleVenta.aspx?id=" + id);
        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Venta> lista = (List<Venta>)Session["listaVentas"];
            List<Venta> listaFiltrada = lista;
                //.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvVentas.DataSource = listaFiltrada;
            dgvVentas.DataBind();
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
                dgvVentas.DataSource = negocio.filtrar(
                    ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text,
                    ddlEstado.SelectedItem.ToString());
                dgvVentas.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
                Session.Add("error", ex);
                throw;
            }
        }
    }
}