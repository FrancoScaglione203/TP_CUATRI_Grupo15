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
    public partial class FormularioConcesionaria : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ConfirmaEliminacion = false;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgPokemon.ImageUrl = txtImagenUrl.Text;
        }



        protected void btnAceptar_Click(object sender, EventArgs e)
        {
             try
             {



                 Concesionaria concesionaria = new Concesionaria();

                 ConcesionariaNegocio concesionariaNegocio = new ConcesionariaNegocio();
                 ImagenNegocio imagenNegocio = new ImagenNegocio();
                 //Tengo que hacer una funcion que dependiendo si es NUEVO aparezcan vacios los campos y grave un nuevo registro
                 //o MODIFICAR que busca si hay un id por url y con id llena los campos


                 concesionaria.Nombre = txtNombre.Text;
                 concesionaria.Calle = txtCalle.Text;
                 concesionaria.Altura = int.Parse(txtAltura.Text);
                 concesionaria.Localidad = txtLocalidad.Text;
                 concesionaria.Provincia = txtProvincia.Text;
                 concesionaria.Descripcion = txtDescripcion.Text;
                 concesionaria.MapsUrl = txtUrlMaps.Text;
                 concesionaria.ImagenUrl = txtImagenUrl.Text;

                 if (Request.QueryString["id"] != null)
                 {
                     int idConcesionaria = int.Parse(Request.QueryString["id"]);              
                     concesionaria.Id = idConcesionaria;
                     concesionariaNegocio.modificar(concesionaria);

                     Session.Add("IdAutoExistente", idConcesionaria); // ver si me sirve
                 }
                 else
                 {
                     concesionariaNegocio.agregar(concesionaria);

                     //Session.Add("IdAutoNuevo", idArt); // ver si me sirve
                }

                 //contenido1.Visible = false;
                 //contenido2.Visible = true;


             }
             catch (Exception ex)
             {
                 Session.Add("error", ex.ToString());
                 Response.Redirect("Error.aspx");
             }
             
        }


    }
}