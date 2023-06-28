using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
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
            if (txtBuscar.Text == "")
            {
                ConcesionariaNegocio concesionariaNegocio = new ConcesionariaNegocio();
                listaConcesionaria = concesionariaNegocio.listar();
                outerRepeater.DataSource = listaConcesionaria;
                outerRepeater.DataBind();

                if (!IsPostBack)
                {
                    foreach (RepeaterItem item in outerRepeater.Items)
                    {
                        HiddenField hiddenID = (HiddenField)item.FindControl("hiddenID");
                        string idString = hiddenID.Value;
                        int id = Convert.ToInt32(idString);

                        if (id != 0)
                        {
                            ServiciosNegocio ServiciosNegocio = new ServiciosNegocio();
                            listaServicios = ServiciosNegocio.listar();
                            listaServicios = listaServicios.FindAll(data => data.IdConcesionaria == id);
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            ConcesionariaNegocio concesionariaNegocio = new ConcesionariaNegocio();
            listaConcesionaria = concesionariaNegocio.listar();

            if (txtBuscar.Text != "")
            {
                listaConcesionaria = listaConcesionaria.FindAll(x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper())
                || x.Localidad.ToUpper().Contains(txtBuscar.Text.ToUpper())
                || x.Provincia.ToUpper().Contains(txtBuscar.Text.ToUpper())
                );
                outerRepeater.DataSource = listaConcesionaria;
                outerRepeater.DataBind();

                foreach (RepeaterItem item in outerRepeater.Items)
                {
                    HiddenField hiddenID = (HiddenField)item.FindControl("hiddenID");
                    string idString = hiddenID.Value;
                    int id = Convert.ToInt32(idString);

                    if (id != 0)
                    {
                        ServiciosNegocio ServiciosNegocio = new ServiciosNegocio();
                        listaServicios = ServiciosNegocio.listar();
                        listaServicios = listaServicios.FindAll(data => data.IdConcesionaria == id);
                    }
                }
            }
        }
    }
}