using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace concesionaria_autos
{
    public partial class cargaVentaUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioCargado = Session["usuarioVenta"] as Usuario;
            if (usuarioCargado != null)
            {
                txtNombre.Text = usuarioCargado.Nombre;
                txtNombre.Enabled = false;
                txtApellido.Text = usuarioCargado.Apellido;
                txtApellido.Enabled = false;
                txtEmail.Text = usuarioCargado.Dni;
                txtEmail.Enabled = false;
                txtDni.Text = usuarioCargado.Email;
                txtDni.Enabled = false;
            }

            try
            {
                if (!IsPostBack)
                {
                    AutoNeogocio negocio = new AutoNeogocio();
                    List<Auto> lista = negocio.listar();

                    ddlModelo.DataSource = lista;
                    ddlModelo.DataValueField = "Id";
                    ddlModelo.DataTextField = "Nombre";
                    ddlModelo.DataBind();

                    //ddlVersion.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
            
        }

        protected void ddlModelo_DataBound(object sender, EventArgs e)
        {
            ddlModelo.Items.Insert(0, new ListItem("Selecciona un modelo", ""));
            ddlModelo.Items[0].Attributes.Add("disabled", "disabled");
        }
        protected void btnCargarVenta_Click(object sender, EventArgs e)
        {
            // Obtener los valores ingresados por el usuario
            string versionAuto = ddlVersion.SelectedValue;
            string modeloAuto = ddlModelo.SelectedValue;
            int cantidadCuotas = Convert.ToInt32(txtCuotas.Text);
            decimal montoCuota = Convert.ToDecimal(txtMontoCuota.Text);

            // Realizar las acciones necesarias para cargar la venta y los detalles de financiación
            // ...

            // Redirigir a la página de confirmación o mostrar un mensaje de éxito
            Response.Redirect("ConfirmacionVenta.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            // Lógica para cancelar la carga de venta
            // Puedes redirigir al usuario a la página anterior o realizar otras acciones necesarias
            Response.Redirect("PaginaAnterior.aspx");
        }

        protected void ddlModelo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                    ddlVersion.Enabled = true;

                    EquipamientoNegocio negocio = new EquipamientoNegocio();
                    List<Equipamiento> lista = negocio.listarUnModelo(Convert.ToInt32(ddlModelo.SelectedValue));

                    ddlVersion.DataSource = lista;
                    ddlVersion.DataValueField = "Id";
                    ddlVersion.DataTextField = "Nombre";
                    ddlVersion.DataBind();


                


            }
            catch (Exception ex)
            {
                throw ex;
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }   
    }
}