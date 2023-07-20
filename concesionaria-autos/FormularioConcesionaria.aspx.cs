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

            Concesionaria concesionaria = new Concesionaria();

            ConcesionariaNegocio concesionariaNegocio = new ConcesionariaNegocio();
            //ImagenNegocio imagenNegocio = new ImagenNegocio();

            if (Request.QueryString["id"] != null && !IsPostBack)
            {
                int idConcesionaria = int.Parse(Request.QueryString["id"]);
                concesionaria.Id = idConcesionaria;
                //concesionaria = concesionariaNegocio.mostrar(idConcesionaria);

                concesionaria = concesionariaNegocio.listar(idConcesionaria);


                txtNombre.Text = concesionaria.Nombre;
                txtCalle.Text = concesionaria.Calle;
                txtAltura.Text = concesionaria.Altura.ToString();
                txtLocalidad.Text = concesionaria.Localidad;
                txtProvincia.Text = concesionaria.Provincia;
                txtDescripcion.Text = concesionaria.Descripcion;
                txtUrlMaps.Text = concesionaria.MapsUrl;
                txtImagenUrl.Text = concesionaria.ImagenUrl.ToString();
                txtImagenUrl_TextChanged(sender, e);

                txtHorarioV1.Text = concesionaria.SemanaAbre.ToString();
                txtHorarioV2.Text = concesionaria.SemanaCierra.ToString();
                txtHorarioS1.Text = concesionaria.SabadoAbre.ToString();
                txtHorarioS2.Text = concesionaria.SabadoCierra.ToString();

            }


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

                if (Request.QueryString["valid"] == null) 
                {
                    concesionaria.Nombre = txtNombre.Text;
                    concesionaria.Calle = txtCalle.Text;
                    concesionaria.Altura = int.Parse(txtAltura.Text);
                    concesionaria.Localidad = txtLocalidad.Text;
                    concesionaria.Provincia = txtProvincia.Text;
                    concesionaria.Descripcion = txtDescripcion.Text;
                    concesionaria.MapsUrl = txtUrlMaps.Text;
                    concesionaria.ImagenUrl = txtImagenUrl.Text;

                    string valorHorarioV1 = txtHorarioV1.Text;
                    concesionaria.SemanaAbre = decimal.Parse(valorHorarioV1);

                    string valorHorarioV2 = txtHorarioV2.Text;
                    concesionaria.SemanaCierra = decimal.Parse(valorHorarioV2) ;
             
                    string valorHorarioS1 = txtHorarioS1.Text;
                    concesionaria.SabadoAbre = decimal.Parse(valorHorarioS1);

                    string valorHorarioS2 = txtHorarioS2.Text;
                    concesionaria.SabadoCierra = decimal.Parse(valorHorarioS2);

                    concesionariaNegocio.InsertarNuevo(concesionaria);
                    Response.Redirect("ConcesionariasAdmin.aspx", false);
                }
                else
                {
                    int idConcesionaria = int.Parse(Request.QueryString["id"]);
                    concesionaria.Id = idConcesionaria;
                    concesionariaNegocio.ModificarConcesionaria(concesionaria, idConcesionaria);
                    //concesionariaNegocio.modificar(concesionaria);
                    Response.Redirect("ConcesionariasAdmin.aspx", false);
                }



                

             }
             catch (Exception ex)
             {
                 Session.Add("error", ex.ToString());
                 Response.Redirect("Error.aspx");
             }
             
        }


    }
}