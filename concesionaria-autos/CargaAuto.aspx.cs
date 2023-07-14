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
    public partial class CargaAuto : System.Web.UI.Page
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
                    //Autos
                    txtId.Text = id;
                    txtNombre.Text = seleccionado.Nombre;
                    txtPrecio.Text = seleccionado.Precio.ToString();
                    txtImagenUrl.Text = seleccionado.Imagen.ImagenUrl;
                    txtImagenUrl_TextChanged(sender, e);
                    //Ficha Técnica
                    txtAncho.Text = seleccionado.FichaTecnica.Ancho.ToString();
                    ddlCajaManual.SelectedValue = seleccionado.FichaTecnica.CajaManual.ToString() != "True" ? "0" : "1";
                    ddlCajaAutomatica.SelectedValue = seleccionado.FichaTecnica.CajaAutomatica.ToString() != "True" ? "0" : "1";
                    txtEjes.Text = seleccionado.FichaTecnica.Ejes.ToString();
                    txtLongitud.Text = seleccionado.FichaTecnica.Longitud.ToString();
                    ddlNafta.SelectedValue = seleccionado.FichaTecnica.Nafta.ToString() != "True" ? "0" : "1";
                    txtPlazas.Text = seleccionado.FichaTecnica.Plazas.ToString();
                    //Descripcion1
                    txtTitulo1.Text = seleccionado.Descripcion.Titulo.ToString();
                    txtDescripcion1.Text = seleccionado.Descripcion.Bajada.ToString();
                    txtImagenDesc1.Text = seleccionado.Descripcion.ImagenUrl.ToString();
                    txtImagenDesc1_TextChanged(sender, e);
                    //Descripcion2
                    txtTitulo2.Text = seleccionado.Descripcion.Titulo.ToString();
                    txtDescripcion2.Text = seleccionado.Descripcion.Bajada.ToString();
                    txtImagenDesc2.Text = seleccionado.Descripcion.ImagenUrl.ToString();
                    txtImagenDesc2_TextChanged(sender, e);
                    //Descripcion3
                    txtTitulo3.Text = seleccionado.Descripcion.Titulo.ToString();
                    txtDescripcion3.Text = seleccionado.Descripcion.Bajada.ToString();
                    txtImagenDesc3.Text = seleccionado.Descripcion.ImagenUrl.ToString();
                    txtImagenDesc3_TextChanged(sender, e);
                    //Equipamiento
                    
                    txtVersion.Text = seleccionado.Equipamiento.Nombre.ToString(); ;
                    txtPrecioVersion.Text = seleccionado.Equipamiento.Precio.ToString(); ;
                    ddlClimatizador.SelectedValue = seleccionado.Equipamiento.Climatizador.ToString() != "True" ? "0" : "1";
                    ddlComputadora.SelectedValue = seleccionado.Equipamiento.Computadora.ToString() != "True" ? "0" : "1";
                    ddlSensorEstacionamiento.SelectedValue = seleccionado.Equipamiento.SensorEstacionamiento.ToString() != "True" ? "0" : "1";
                    ddlControlCrucero.SelectedValue = seleccionado.Equipamiento.ControlCrucero.ToString() != "True" ? "0" : "1";
                    ddlAlarma.SelectedValue = seleccionado.Equipamiento.Alarma.ToString() != "True" ? "0" : "1";
                    //Color
                    txtColor.Text = seleccionado.Colores.Nombre.ToString();
                    txtImagenMuestraColor.Text = seleccionado.Colores.Muestra.ToString();
                    txtImagenColor.Text = seleccionado.Colores.ImagenUrl.ToString();
                    txtImagenColor_TextChanged(sender, e);
                    //Tapizado
                    txtTapizado.Text = seleccionado.Tapizado.Nombre.ToString();
                    txtImagenMuestraTapizado.Text = seleccionado.Tapizado.Muestra.ToString();
                    txtImagenTapizado.Text = seleccionado.Tapizado.ImagenUrl.ToString();
                    txtPrecioTapizado.Text = seleccionado.Tapizado.Precio.ToString();
                    txtImagenTapizado_TextChanged(sender, e);


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
                    Session.Add("IdAutoExistente", idAuto);
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
                    Response.Redirect("Autos.aspx", false);
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
                Descripcion descripcion1 = new Descripcion();
                Descripcion descripcion2 = new Descripcion();
                Descripcion descripcion3 = new Descripcion();
                DescripcionNegocio descripcionNegocio = new DescripcionNegocio();

                descripcion1.Titulo = txtTitulo1.Text;
                descripcion1.Bajada = txtDescripcion1.Text;
                descripcion1.ImagenUrl = txtImagenDesc1.Text;
                descripcion2.Titulo = txtTitulo2.Text;
                descripcion2.Bajada = txtDescripcion2.Text;
                descripcion2.ImagenUrl = txtImagenDesc2.Text;
                descripcion3.Titulo = txtTitulo3.Text;
                descripcion3.Bajada = txtDescripcion3.Text;
                descripcion3.ImagenUrl = txtImagenDesc3.Text;

                if (Request.QueryString["id"] != null)
                {
                    descripcion1.IdProducto = (int)Session["IdAutoExistente"];
                    descripcionNegocio.modificar(descripcion1);
                    descripcion2.IdProducto = (int)Session["IdAutoExistente"];
                    descripcionNegocio.modificar(descripcion2);
                    descripcion3.IdProducto = (int)Session["IdAutoExistente"];
                    descripcionNegocio.modificar(descripcion3);
                }
                else
                {
                    descripcion1.IdProducto = (int)Session["IdAutoNuevo"];
                    descripcionNegocio.agregar(descripcion1);
                    descripcion2.IdProducto = (int)Session["IdAutoNuevo"];
                    descripcionNegocio.agregar(descripcion2);
                    descripcion3.IdProducto = (int)Session["IdAutoNuevo"];
                    descripcionNegocio.agregar(descripcion3);
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
                equipamiento.SensorEstacionamiento = ddlSensorEstacionamiento.SelectedValue != "0" ? true : false;
                equipamiento.Computadora = ddlComputadora.SelectedValue != "0" ? true : false;
                equipamiento.ControlCrucero = ddlControlCrucero.SelectedValue != "0" ? true : false;
                equipamiento.Alarma = ddlAlarma.SelectedValue != "0" ? true : false;
                equipamiento.Climatizador = ddlClimatizador.SelectedValue != "0" ? true : false;


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
                color.ImagenUrl = txtImagenColor.Text;


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
        protected void cargarTarjeta()
        {

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

                string Tarjtapizado = CrearTarjetaTapizado(tapizado);
                contenedorTapizado.InnerHtml = Tarjtapizado;


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

                //Response.Redirect("Autos.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagenDesc1_TextChanged(object sender, EventArgs e)
        {
            imagenDesc1.ImageUrl = txtImagenDesc1.Text;
        }protected void txtImagenDesc2_TextChanged(object sender, EventArgs e)
        {
            imagenDesc2.ImageUrl = txtImagenDesc2.Text;
        }protected void txtImagenDesc3_TextChanged(object sender, EventArgs e)
        {
            imagenDesc3.ImageUrl = txtImagenDesc3.Text;
        }

        protected void txtImagenColor_TextChanged(object sender, EventArgs e)
        {
            imagenColor.ImageUrl = txtImagenColor.Text;
        }

        protected void txtImagenTapizado_TextChanged(object sender, EventArgs e)
        {
            imagenTapizado.ImageUrl = txtImagenTapizado.Text;
        }

        private string CrearTarjetaTapizado(Tapizado tapizado)
        {
            // Aquí puedes generar el código HTML de la tarjeta para mostrar la cuota
            // con sus respectivos datos, como el monto, la fecha de vencimiento, etc.
            // Retorna una cadena con el código HTML de la tarjeta.

            // Ejemplo:
            string tarjeta = $@"
                <div class='card'>
                    <div class='card-body'>
                        <h5 class='card-title'>Cuota {tapizado.Nombre}</h5>
                        <p class='card-text'>Monto: ${tapizado.Precio}</p>
                        <p class='card-text'>Estado: {tapizado.Muestra}</p>
                    </div>
                </div>";


            return tarjeta;
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            alertaExitosa.Visible = true;
        }



        //    <div class="card py-4" style="width: 50em;">
        //    <div class="d-flex justify-content-center align-items-center">
        //        <div class="col-xl-7 col-lg-7 col-md-7 col-sm-12 col-xs-12 ">
        //            <img src = "#" class="card-img" alt="un auto">
        //        </div>
        //        <div class="card-body col-xl-5 col-lg-5 col-md-5 col-sm-12 col-xs-12">
        //            <h4 class="card-title fw-bold">TITULO</h4>
        //            <p class="card-text">BAJADA</p>
        //        </div>
        //    </div>
        //</div>

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
