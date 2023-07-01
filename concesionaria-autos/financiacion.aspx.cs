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
    public partial class financiacion : System.Web.UI.Page
    {
        public List<Auto> ListaAutos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            AutoNeogocio autoNegocio = new AutoNeogocio();
            ListaAutos = autoNegocio.listarFinanciados();
        }
  
    }
}