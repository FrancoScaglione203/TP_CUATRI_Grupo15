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
    public partial class Compras : System.Web.UI.Page
    {
        public List<Venta> ListaCompras { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();
            Usuario user = new Usuario();
            try


            {
                if (!IsPostBack)
                {
                    user = (Usuario)Session["usuario"];

                    ListaCompras = ventaNegocio.listar();

                    ListaCompras = ListaCompras.FindAll(x => x.DNIComprador == user.Dni);
                    rptCompras.DataSource = ListaCompras; 
                    rptCompras.DataBind();
                }

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        public string ObtenerUrlImagen(int idcolor)
        {
            ColorNegocio imagenNegocio = new ColorNegocio();
            try
            {
                List<Color> imagen = imagenNegocio.BuscarImagenPorIdAuto(idcolor);
                imagen.Find(x => x.IdProducto == idcolor);

                return "a";
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener la URL de la imagen: " + ex.Message);
            }
        }

        protected void rptCompras_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "VerPagos")
            {
                string idVenta = e.CommandArgument.ToString();

                Session["IDVenta"] = idVenta;

                Response.Redirect("Pagos.aspx");
            }
        }


    }
}