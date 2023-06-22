using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace concesionaria_autos
{
    public partial class detalle : System.Web.UI.Page
    {
        public List<Auto> ListaAutos { get; set; }
        public Auto auto { get; set; }
        public List<Imagen> listaImagenes { get; set; }
        public Imagen imagen { get; set; }
        public List<Descripcion> listaDescripcion { get; set; }
        public Descripcion descripcion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            AutoNeogocio autoNeogocio = new AutoNeogocio();
            ListaAutos = autoNeogocio.listar();

            ImagenNegocio imagenNegocio = new ImagenNegocio();
            listaImagenes = imagenNegocio.listar();

            DescripcionNegocio descripcionNegocio = new DescripcionNegocio();
            listaDescripcion = descripcionNegocio.listar();

            try
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                //Session["Id"] = id;
                auto = ListaAutos.Find(auto => auto.Id == id);
                listaImagenes = listaImagenes.FindAll(img => img.IdProducto == id);
                listaDescripcion= listaDescripcion.FindAll(desc => desc.IdProducto == id);

            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}