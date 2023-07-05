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
    public partial class _default : System.Web.UI.Page
    {
        public List<Auto> ListaAutos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

                AutoNeogocio autoNegocio = new AutoNeogocio();
                ListaAutos = autoNegocio.listar();
                if ((List<Auto>)Session["busqueda"] != null)
                {
                    ListaAutos=(List<Auto>)Session["busqueda"];
                    Session.Add("busqueda",null);
                }
        }

        //protected void btnBuscar_Click(object sender, EventArgs e)
        //{
        //    if (txtBuscar.Text != "")
        //    {
        //        AutoNeogocio autoNegocio = new AutoNeogocio();
        //        ListaAutos = autoNegocio.listar();

        //        ListaAutos = ListaAutos.FindAll(x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper())
        //        );
        //    }
        //}
    }
}