using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using negocio;
using dominio;

namespace concesionaria_autos
{
    public partial class FormularioAuto : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            ConfirmaEliminacion = false;
            try
            {
                //configuración inicial de la pantalla.
                if (!IsPostBack)
                {
                //    ElementoNegocio negocio = new ElementoNegocio();
                //    List<Elemento> lista = negocio.listar();

                //    ddlTipo.DataSource = lista;
                //    ddlTipo.DataValueField = "Id";
                //    ddlTipo.DataTextField = "Descripcion";
                //    ddlTipo.DataBind();

                //    ddlDebilidad.DataSource = lista;
                //    ddlDebilidad.DataValueField = "Id";
                //    ddlDebilidad.DataTextField = "Descripcion";
                //    ddlDebilidad.DataBind();
                }

                //configuración si estamos modificando.
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    AutoNeogocio negocio = new AutoNeogocio();
                    List<Auto> lista = negocio.listar(id);
                    Auto seleccionado = (negocio.listar(id))[0];

                    //guardo auto seleccionado en session
                    Session.Add("autoSeleccionado", seleccionado);

                    //pre cargar todos los campos...
                    txtId.Text = id;
                    txtNombre.Text = seleccionado.Nombre;
                    txtPrecio.Text = seleccionado.Precio.ToString();
                    txtImagenUrl.Text = seleccionado.Imagen.ImagenUrl;
                    txtAncho.Text = seleccionado.FichaTecnica.Ancho.ToString();
                    ddlCajaManual.SelectedValue = seleccionado.FichaTecnica.CajaManual.ToString() != "True" ? "0" : "1";
                    ddlCajaAutomatica.SelectedValue = seleccionado.FichaTecnica.CajaAutomatica.ToString() != "True" ? "0" : "1";
                    txtEjes.Text = seleccionado.FichaTecnica.Ejes.ToString();
                    txtLongitud.Text = seleccionado.FichaTecnica.Longitud.ToString();
                    ddlNafta.SelectedValue = seleccionado.FichaTecnica.Nafta.ToString() != "True" ? "0" : "1";
                    txtPlazas.Text = seleccionado.FichaTecnica.Plazas.ToString();

                    txtImagenUrl_TextChanged(sender, e);

                    //configurar acciones
                    //if (!seleccionado.Activo)
                    //    btnInactivar.Text = "Reactivar";
                }

            }
            catch (Exception ex)
            {
                throw ex;
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Auto auto = new Auto();
                Imagen imagen = new Imagen();
                FichaTecnica fichaTecnica = new FichaTecnica();

                AutoNeogocio autoNegocio = new AutoNeogocio();
                ImagenNegocio imagenNegocio = new ImagenNegocio();
                FichaTecnicaNegocio fichaTecnicaNegocio = new FichaTecnicaNegocio();

                
                auto.Nombre = txtNombre.Text;
                auto.Precio = decimal.Parse(txtPrecio.Text);
                auto.Color = 1;
                auto.Estado = true;
                imagen.ImagenUrl = txtImagenUrl.Text;
                
                fichaTecnica.Ancho = int.Parse(txtAncho.Text);
                fichaTecnica.Longitud = int.Parse(txtLongitud.Text);
                fichaTecnica.Plazas = int.Parse(txtPlazas.Text);
                fichaTecnica.Ejes = int.Parse(txtEjes.Text);
                fichaTecnica.CajaAutomatica = ddlCajaAutomatica.SelectedValue != "0" ? true : false;
                fichaTecnica.CajaManual = ddlCajaManual.SelectedValue != "0" ? true : false;
                fichaTecnica.Nafta = ddlNafta.SelectedValue != "0" ? true : false;


                if (Request.QueryString["id"] != null)
                {
                    int idAuto = int.Parse(txtId.Text);
                    imagen.IdProducto = idAuto;
                    fichaTecnica.IdProducto = idAuto;
                    auto.Id = int.Parse(txtId.Text);
                    autoNegocio.modificarConSP(auto);
                    imagenNegocio.modificar(imagen);
                    fichaTecnicaNegocio.modificar(fichaTecnica);
                }
                else
                {
                    int idArt = autoNegocio.agregar(auto);
                    imagen.IdProducto = idArt;
                    fichaTecnica.IdProducto = idArt;
                    imagenNegocio.agregar(imagen);
                    fichaTecnicaNegocio.agregar(fichaTecnica);
                }


                Response.Redirect("Autos.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgPokemon.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmaEliminacion.Checked)
                {
                    AutoNeogocio negocio = new AutoNeogocio();
                    FichaTecnicaNegocio ftnegocio = new FichaTecnicaNegocio();
                    ImagenNegocio imagenNegocio = new ImagenNegocio();
                    imagenNegocio.eliminar(int.Parse(txtId.Text));
                    ftnegocio.eliminar(int.Parse(txtId.Text));
                    gitnegocio.eliminar(int.Parse(txtId.Text));
                    Response.Redirect("Autos.aspx",false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        //protected void btnInactivar_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        AutoNeogocio negocio = new AutoNeogocio();
        //        Auto seleccionado = (Auto)Session["autoSeleccionado"];

        //        negocio.eliminarLogico(seleccionado.Id);
        //        Response.Redirect("Autos.aspx");
        //    }
        //    catch (Exception ex)
        //    {
        //        Session.Add("error", ex.ToString());
        //        Response.Redirect("Error.aspx");
        //    }
        //}

       
    }
}