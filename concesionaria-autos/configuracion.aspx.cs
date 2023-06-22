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
        public Equipamiento equipamiento { get; set; }
        public List<Auto> ListaAuto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            EquipamientoNegocio equipamientoNegocio = new EquipamientoNegocio();
            ListaEquipamientos = equipamientoNegocio.listar();
            try
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                //Session["Id"] = id;
                ListaEquipamientos = ListaEquipamientos.FindAll(equipo => equipo.IdProducto == id);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}