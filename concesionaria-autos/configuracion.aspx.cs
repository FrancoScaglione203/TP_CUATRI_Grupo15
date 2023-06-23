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
    public partial class configuracion : System.Web.UI.Page
    {
        public List<Equipamiento> ListaEquipamientos { get; set; }
        public List<FichaTecnica> ListaFichaTecnica { get; set; }
        public List<Color> ListaColores { get; set; }
        public Color Color { get; set; }
        public List<Auto> ListaAuto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            EquipamientoNegocio equipamientoNegocio = new EquipamientoNegocio();
            ListaEquipamientos = equipamientoNegocio.listar();

            ColorNegocio colorNegocio = new ColorNegocio();
            ListaColores = colorNegocio.listar();

            FichaTecnicaNegocio fichaTecnica = new FichaTecnicaNegocio();
            ListaFichaTecnica = fichaTecnica.listar();

            try
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                //Session["Id"] = id;
                ListaEquipamientos = ListaEquipamientos.FindAll(equipo => equipo.IdProducto == id);
                ListaColores = ListaColores.FindAll(color => color.IdProducto == id);
                Color=ListaColores.Find(color => color.IdProducto == id);
                ListaFichaTecnica = ListaFichaTecnica.FindAll(ficha => ficha.IdProducto == id);

            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}