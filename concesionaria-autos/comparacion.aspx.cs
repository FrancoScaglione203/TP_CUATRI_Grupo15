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
    public partial class comparacion : System.Web.UI.Page
    {
        public List<Auto> ListaAutos { get; set; }
        public List<FichaTecnica> ListaFichaTecnica1 { get; set; }
        public List<FichaTecnica> ListaFichaTecnica2 { get; set; }
        public Auto auto1 { get; set; }
        public Auto auto2 { get; set; }
        public FichaTecnica fichaTecnica1 { get; set; }
        public FichaTecnica fichaTecnica2 { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            AutoNeogocio autoNeogocio=new AutoNeogocio();
            try
            {
                if(!IsPostBack)
                {
                    DropDownList1.DataSource = autoNeogocio.listar();
                    DropDownList1.DataTextField = "Nombre";
                    DropDownList1.DataValueField = "Id";
                    DropDownList1.DataBind();

                    DropDownList2.DataSource = autoNeogocio.listar();
                    DropDownList2.DataTextField = "Nombre";
                    DropDownList2.DataValueField = "Id";
                    DropDownList2.DataBind();
                }
            }
            catch(Exception ex)
            {
                //Session.Add("error",ex);
                throw ex;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idAuto1 = int.Parse(DropDownList1.SelectedItem.Value);

            AutoNeogocio autoNegocio = new AutoNeogocio();
            ListaAutos = autoNegocio.listar();
            auto1 = ListaAutos.Find(auto => auto.Id == idAuto1);

            FichaTecnicaNegocio fichaTecnicaNegocio = new FichaTecnicaNegocio();
            ListaFichaTecnica1 = fichaTecnicaNegocio.listar();
            fichaTecnica1 = ListaFichaTecnica1.Find(ft => ft.IdProducto == idAuto1);
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idAuto2 = int.Parse(DropDownList2.SelectedItem.Value);

            AutoNeogocio autoNegocio = new AutoNeogocio();
            ListaAutos = autoNegocio.listar();
            auto2 = ListaAutos.Find(auto => auto.Id == idAuto2);

            FichaTecnicaNegocio fichaTecnicaNegocio = new FichaTecnicaNegocio();
            ListaFichaTecnica2 = fichaTecnicaNegocio.listar();
            fichaTecnica2 = ListaFichaTecnica2.Find(ft => ft.IdProducto == idAuto2);
        }
    }
}