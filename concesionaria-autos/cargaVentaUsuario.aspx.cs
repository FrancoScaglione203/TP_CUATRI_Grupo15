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

                    ddlTapizado.SelectedIndex = -1;



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
            VentaNegocio negocio = new VentaNegocio();
            Venta venta = new Venta();

            FinanciacionNegocio financiacionNegocio = new FinanciacionNegocio();
            Financiacion financiacion = new Financiacion();

            CuotaNegocio cuotaNegocio = new CuotaNegocio();
            List<Cuota> listaCuotas = new List<Cuota>();

            EquipamientoNegocio equipamientoNeogocio = new EquipamientoNegocio();


            string versionAuto = ddlVersion.SelectedItem.Text;
            string modeloAuto = ddlModelo.SelectedItem.Text;
            int cantidadCuotas = int.Parse(ddlCuotas.SelectedValue);
            string dni = txtDni.Text;
            int IdVersionAuto = int.Parse(ddlVersion.SelectedValue);
            int IdModeloAuto = int.Parse(ddlModelo.SelectedValue);
            decimal precioAuto = equipamientoNeogocio.getPrecioAuto(IdModeloAuto);
            decimal porcentajeInteres = 0;
            int idColor = int.Parse(ddlColor.SelectedValue);
            string colorAuto = ddlColor.SelectedItem.Text;
            string tapizadoAuto = ddlTapizado.SelectedItem.Text;

                try
                {
                    
                    financiacion = financiacionNegocio.buscarFinanciacion(cantidadCuotas);
                    
                    //Usuario usuarioCargado = Session["usuarioVenta"] as Usuario;
                    venta.idVersion = IdVersionAuto;
                    venta.DNIComprador = dni;
                    venta.VersionAuto = versionAuto;
                    venta.CantidadCuotas = cantidadCuotas;
                    venta.idModelo = IdModeloAuto; 
                    venta.ModeloAuto = modeloAuto;
                    venta.idColor = idColor;
                    venta.ColorAuto = colorAuto;
                    venta.Tapizado = tapizadoAuto;
                    Session.Add("VentaDatos", venta);

                    int idVenta = negocio.agregar(venta);

                    for (int i = 1; i <= cantidadCuotas; i++)
                    {
                        Cuota cuota = new Cuota();
                        cuota.NumeroCuota = i;
                        switch (i)
                        {
                            case int n when n >= 1 && n <= 20:
                                porcentajeInteres = financiacion.Cuota1A20;
                                break;
                            case int n when n >= 21 && n <= 40:
                                porcentajeInteres = financiacion.Cuota21A40;
                                break;
                            case int n when n >= 41 && n <= 60:
                                porcentajeInteres = financiacion.Cuota41A60;
                                break;
                            case int n when n >= 61 && n <= 80:
                                porcentajeInteres = financiacion.Cuota61A80;
                                break;
                            case int n when n >= 81 && n <= 100:
                                porcentajeInteres = financiacion.Cuota81A100;
                                break;
                        }
                        cuota.Monto = precioAuto * porcentajeInteres;
                        cuota.FechaVencimiento = DateTime.Now.AddMonths(i);
                        cuota.Pagada = false;
                        cuota.IDVenta = idVenta;
                        listaCuotas.Add(cuota);
                    }
                    foreach (Cuota cuota in listaCuotas)
                    {
                        cuotaNegocio.agregar(cuota);
                    }

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

        protected void ddlColor_DataBound(object sender, EventArgs e)
        {
            ddlColor.Items.Insert(0, new ListItem("Selecciona un color", ""));
            ddlColor.Items[0].Attributes.Add("disabled", "disabled");
        }

        protected void ddlVersion_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                ddlColor.Enabled = true;

                ColorNegocio colorNegocio = new ColorNegocio();
                List<Color> listaColores = colorNegocio.listar().FindAll(x => x.IdProducto == Convert.ToInt32(ddlModelo.SelectedValue));



                ddlColor.DataSource = listaColores;
                ddlColor.DataValueField = "Id";
                ddlColor.DataTextField = "Nombre";
                ddlColor.DataBind();





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