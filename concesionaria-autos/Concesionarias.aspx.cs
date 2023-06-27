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
	public partial class Locales : System.Web.UI.Page
	{
		public List<Concesionaria> listaConcesionaria = new List<Concesionaria>();
        public List<Servicios> listaServicios = new List<Servicios>();

        protected void Page_Load(object sender, EventArgs e)
		{
			ConcesionariaNegocio concesionariaNegocio = new ConcesionariaNegocio();
            listaConcesionaria=concesionariaNegocio.listar();
            localesRepeater.DataSource = listaConcesionaria;
            localesRepeater.DataBind();
        }
    }
}