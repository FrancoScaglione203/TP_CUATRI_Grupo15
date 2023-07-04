using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
                txtEmail.Text = usuarioCargado.Email;
                txtEmail.Enabled = false;
                txtDni.Text = usuarioCargado.Dni;
                txtDni.Enabled = false;
            }

            try
            {
                if (!IsPostBack)
                {
                    AutoNeogocio negocio = new AutoNeogocio();
                    List<Auto> lista = negocio.listar();
                    FinanciacionNegocio financiacionNegocio = new FinanciacionNegocio();
                    List<Financiacion> listaFinanciacion = financiacionNegocio.listar();

                    ddlModelo.DataSource = lista;
                    ddlModelo.DataValueField = "Id";
                    ddlModelo.DataTextField = "Nombre";
                    ddlModelo.DataBind();

                    ddlCuotas.DataSource = listaFinanciacion;
                    ddlCuotas.DataValueField = "CantCuotas";
                    ddlCuotas.DataTextField = "CantCuotas";
                    ddlCuotas.DataBind();

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

        protected void ddlCuotas_DataBound(object sender, EventArgs e)
        {
            ddlVersion.Items.Insert(0, new ListItem("Selecciona la cantidad de cuotas", ""));
            ddlVersion.Items[0].Attributes.Add("disabled", "disabled");
        }
        protected void btnCargarVenta_Click(object sender, EventArgs e)
        {
            
            string versionAuto = ddlVersion.SelectedItem.Text;
            string modeloAuto = ddlModelo.SelectedItem.Text;
            int cantidadCuotas = int.Parse(ddlCuotas.SelectedValue);
            string dni = txtDni.Text;
            int IdVersionAuto = int.Parse(ddlVersion.SelectedValue);
            int IdModeloAuto = int.Parse(ddlModelo.SelectedValue);

                try
                {
                    VentaNegocio negocio = new VentaNegocio();
                    Venta venta = new Venta();

                    FinanciacionNegocio financiacionNegocio = new FinanciacionNegocio();
                    Financiacion financiacion = new Financiacion();
                    //financiacion = financiacionNegocio.buscarFinanciacion(cantidadCuotas);
                    
                    CuotaNegocio cuotaNegocio = new CuotaNegocio();
                    List<Cuota> listaCuotas = new List<Cuota>();
                    
                    for (int i = 1; i <= cantidadCuotas; i++)
                    {
                            Cuota cuota = new Cuota();
                            cuota.IDVenta = venta.IDVenta;
                            cuota.Numero = i;
                            cuota.Monto = 0;
                            cuota.FechaVencimiento = DateTime.Now.AddMonths(i);
                            cuota.Pagada = false;
                            listaCuotas.Add(cuota);
                    }
                    //Usuario usuarioCargado = Session["usuarioVenta"] as Usuario;
                    venta.idVersion = IdVersionAuto;
                    venta.DNIComprador = dni;
                    venta.VersionAuto = versionAuto;
                    venta.CantidadCuotas = cantidadCuotas;
                    venta.idModelo = IdModeloAuto; 
                    venta.ModeloAuto = modeloAuto;
                    Session.Add("VentaDatos", venta);

                    

                    negocio.agregar(venta);
                    Response.Redirect("ventaCargada.aspx");
                }
                catch (Exception ex)
                {
                    throw ex;
                    Session.Add("Error", ex.ToString());
                    Response.Redirect("Error.aspx");
                }
           
            

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