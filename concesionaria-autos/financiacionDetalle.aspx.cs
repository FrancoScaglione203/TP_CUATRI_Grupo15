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
    public partial class financiacionDetalle : System.Web.UI.Page
    {
        public List<Auto> ListaAutos { get; set; }
        public Auto auto { get; set; }
        public List<Imagen> listaImagenes { get; set; }
        public Imagen imagen { get; set; }
        public List<Descripcion> listaDescripcion { get; set; }
        public Descripcion descripcion { get; set; }
        public decimal precio { get; set; }
        public decimal ds { get; set; }
        public decimal gastoEntrega { get; set; }
        public decimal gastoAdministrativo { get; set; }
        public decimal cuota1A20 { get; set; }
        public decimal cuota21A40 { get; set; }
        public decimal cuota41A60 { get; set; }
        public decimal cuota61A80 { get; set; }
        public decimal cuota81A100 { get; set; }
        public decimal cuotaPura { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            AutoNeogocio autoNeogocio = new AutoNeogocio();
            ListaAutos = autoNeogocio.listar();

            ImagenNegocio imagenNegocio = new ImagenNegocio();
            listaImagenes = imagenNegocio.listar();

            DescripcionNegocio descripcionNegocio = new DescripcionNegocio();
            listaDescripcion = descripcionNegocio.listar();

            FinanciacionNegocio financiacionNegocio = new FinanciacionNegocio();
            List<Financiacion> listaFinanciacion = financiacionNegocio.listar();


            try
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                //Session["Id"] = id;
                auto = ListaAutos.Find(auto => auto.Id == id);
                listaImagenes = listaImagenes.FindAll(img => img.IdProducto == id);
                listaDescripcion = listaDescripcion.FindAll(desc => desc.IdProducto == id);

                Financiacion financiacion = listaFinanciacion[0];

                precio = auto.Precio;
                ds = precio*financiacion.DsCuotas;
                gastoEntrega = precio * financiacion.GastoEntrega;
                gastoAdministrativo = precio * financiacion.GastoAdministrativo;
                cuota1A20 = precio * financiacion.Cuota1A20;
                cuota21A40 = precio * financiacion.Cuota21A40;
                cuota41A60 = precio * financiacion.Cuota41A60;
                cuota61A80 = precio * financiacion.Cuota61A80;
                cuota81A100 = precio * financiacion.Cuota81A100;
                cuotaPura = (precio / 100);

            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}