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
                // Activar los validadores del front-end
                Page.Validate();

                // Verificar si la página es válida
                if (!Page.IsValid)
                {
                    return;
                }

                Auto auto = new Auto();
                Imagen imagen = new Imagen();
                //FichaTecnica fichaTecnica = new FichaTecnica();
  
                AutoNeogocio autoNegocio = new AutoNeogocio();
                ImagenNegocio imagenNegocio = new ImagenNegocio();
                //FichaTecnicaNegocio fichaTecnicaNegocio = new FichaTecnicaNegocio();

                auto.Nombre = txtNombre.Text;
                auto.Precio = decimal.Parse(txtPrecio.Text);
                auto.Color = 1;
                auto.Estado = true;
                imagen.ImagenUrl = txtImagenUrl.Text;

                //fichaTecnica.Ancho = int.Parse(txtAncho.Text);
                //fichaTecnica.Longitud = int.Parse(txtLongitud.Text);
                //fichaTecnica.Plazas = int.Parse(txtPlazas.Text);
                //fichaTecnica.Ejes = int.Parse(txtEjes.Text);
                //fichaTecnica.CajaAutomatica = ddlCajaAutomatica.SelectedValue != "0" ? true : false;
                //fichaTecnica.CajaManual = ddlCajaManual.SelectedValue != "0" ? true : false;
                //fichaTecnica.Nafta = ddlNafta.SelectedValue != "0" ? true : false;

                if (Request.QueryString["id"] != null)
                {
                    int idAuto = int.Parse(txtId.Text);
                    imagen.IdProducto = idAuto;
                    //fichaTecnica.IdProducto = idAuto;
                    auto.Id = int.Parse(txtId.Text);
                    autoNegocio.modificarConSP(auto);
                    imagenNegocio.modificar(imagen);
                    //fichaTecnicaNegocio.modificar(fichaTecnica);
                    //ID AUTO EXISTENTE
                    Session.Add("IdAutoExistente",idAuto);
                }
                else
                {
                    int idArt = autoNegocio.agregar(auto);
                    imagen.IdProducto = idArt;
                    //fichaTecnica.IdProducto = idArt;
                    imagenNegocio.agregar(imagen);
                    //fichaTecnicaNegocio.agregar(fichaTecnica);
                    //ID AUTO NUEVO
                    Session.Add("IdAutoNuevo", idArt);
                }

                contenido1.Visible = false;
                contenido2.Visible = true;


            }
            catch (Exception ex)
            {
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
                    negocio.eliminar(int.Parse(txtId.Text));
                    Response.Redirect("Autos.aspx",false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptarFichaTecnica_Click(object sender, EventArgs e)
        {
            try
            {
                // Activar los validadores del front-end
                Page.Validate();

                // Verificar si la página es válida
                if (!Page.IsValid)
                {
                    return;
                }
                FichaTecnica fichaTecnica = new FichaTecnica();
                FichaTecnicaNegocio fichaTecnicaNegocio = new FichaTecnicaNegocio();

                fichaTecnica.Ancho = int.Parse(txtAncho.Text);
                fichaTecnica.Longitud = int.Parse(txtLongitud.Text);
                fichaTecnica.Plazas = int.Parse(txtPlazas.Text);
                fichaTecnica.Ejes = int.Parse(txtEjes.Text);
                fichaTecnica.CajaAutomatica = ddlCajaAutomatica.SelectedValue != "0" ? true : false;
                fichaTecnica.CajaManual = ddlCajaManual.SelectedValue != "0" ? true : false;
                fichaTecnica.Nafta = ddlNafta.SelectedValue != "0" ? true : false;

                if (Request.QueryString["id"] != null)
                {
                    //fichaTecnica.IdProducto = idAuto;
                    fichaTecnica.IdProducto = (int)Session["IdAutoExistente"];
                    fichaTecnicaNegocio.modificar(fichaTecnica);
                }
                else
                {
                    fichaTecnica.IdProducto = (int)Session["IdAutoNuevo"];
                    fichaTecnicaNegocio.agregar(fichaTecnica);
                }

                contenido2.Visible = false;
                contenido3.Visible = true;

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptarDescripcion_Click(object sender, EventArgs e)
        {
            try
            {
                // Activar los validadores del front-end
                Page.Validate();

                // Verificar si la página es válida
                if (!Page.IsValid)
                {
                    return;
                }
                Descripcion descripcion = new Descripcion();
                DescripcionNegocio descripcionNegocio = new DescripcionNegocio();

                descripcion.Titulo = txtTitulo.Text;
                descripcion.Bajada = txtDescripcion.Text;
                descripcion.ImagenUrl = txtImagenDesc.Text;
       
                if (Request.QueryString["id"] != null)
                {
                    descripcion.IdProducto = (int)Session["IdAutoExistente"];
                    descripcionNegocio.modificar(descripcion);
                }
                else
                {
                    descripcion.IdProducto = (int)Session["IdAutoNuevo"];
                    descripcionNegocio.agregar(descripcion);
                }

                contenido3.Visible = false;
                contenido4.Visible = true;

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void btnAceptarEquipamiento_Click(object sender, EventArgs e)
        {
            try
            {
                // Activar los validadores del front-end
                Page.Validate();

                // Verificar si la página es válida
                if (!Page.IsValid)
                {
                    return;
                }
                Equipamiento equipamiento = new Equipamiento();
                EquipamientoNegocio equipamientoNegocio = new EquipamientoNegocio();

                equipamiento.Nombre = txtVersion.Text;
                equipamiento.Precio = decimal.Parse(txtPrecioVersion.Text);
                equipamiento.Climatizador = ddlClimatizador.SelectedValue != "0" ? true : false;
                equipamiento.Computadora = ddlComputadora.SelectedValue != "0" ? true : false;
                equipamiento.SensorEstacionamiento = ddlSensorEstacionamiento.SelectedValue != "0" ? true : false;
                equipamiento.ControlCrucero = ddlControlCrucero.SelectedValue != "0" ? true : false;
                equipamiento.Alarma = ddlAlarma.SelectedValue != "0" ? true : false;


                if (Request.QueryString["id"] != null)
                {
                    equipamiento.IdProducto = (int)Session["IdAutoExistente"];
                    equipamientoNegocio.modificar(equipamiento);
                }
                else
                {
                    equipamiento.IdProducto = (int)Session["IdAutoNuevo"];
                    equipamientoNegocio.agregar(equipamiento);
                }

                contenido4.Visible = false;
                contenido5.Visible = true;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptarColor_Click(object sender, EventArgs e)
        {
            try
            {
                // Activar los validadores del front-end
                Page.Validate();

                // Verificar si la página es válida
                if (!Page.IsValid)
                {
                    return;
                }
                Color color = new Color();
                ColorNegocio colorNegocio = new ColorNegocio();

                color.Nombre = txtColor.Text;
                color.Muestra = txtImagenMuestraColor.Text;
                color.ImagenUrl= txtImagenColor.Text;
                
    
                if (Request.QueryString["id"] != null)
                {
                    color.IdProducto = (int)Session["IdAutoExistente"];
                    colorNegocio.modificar(color);
                }
                else
                {
                    color.IdProducto = (int)Session["IdAutoNuevo"];
                    colorNegocio.agregar(color);
                }

                contenido5.Visible = false;
                contenido6.Visible = true;

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptarTapizado_Click(object sender, EventArgs e)
        {
            try
            {
                // Activar los validadores del front-end
                Page.Validate();

                // Verificar si la página es válida
                if (!Page.IsValid)
                {
                    return;
                }
                Tapizado tapizado = new Tapizado();
                TapizadoNegocio tapizadoNegocio = new TapizadoNegocio();

                tapizado.Nombre = txtTapizado.Text;
                tapizado.Muestra = txtImagenMuestraTapizado.Text;
                tapizado.ImagenUrl = txtImagenTapizado.Text;
                tapizado.Precio = decimal.Parse(txtPrecioTapizado.Text);


                if (Request.QueryString["id"] != null)
                {
                    tapizado.IdProducto = (int)Session["IdAutoExistente"];
                    tapizadoNegocio.modificar(tapizado);
                }
                else
                {
                    tapizado.IdProducto = (int)Session["IdAutoNuevo"];
                    tapizadoNegocio.agregar(tapizado);
                }

                Response.Redirect("Autos.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagenDesc_TextChanged(object sender, EventArgs e)
        {
            imagenDesc.ImageUrl = txtImagenDesc.Text;
        }

        protected void txtImagenColor_TextChanged(object sender, EventArgs e)
        {
            imagenColor.ImageUrl = txtImagenColor.Text;
        }

        protected void txtImagenTapizado_TextChanged(object sender, EventArgs e)
        {
            imagenTapizado.ImageUrl = txtImagenTapizado.Text;
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