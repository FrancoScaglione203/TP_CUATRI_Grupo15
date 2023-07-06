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
            AutoNeogocio autoNeogocio1=new AutoNeogocio();
            FichaTecnicaNegocio fichaTecnicaNegocio1 = new FichaTecnicaNegocio();

            AutoNeogocio autoNeogocio2 = new AutoNeogocio();
            FichaTecnicaNegocio fichaTecnicaNegocio2 = new FichaTecnicaNegocio();

            try
            {
                List<Auto> listaAuto1 = autoNeogocio1.listar();
                List<Auto> listaAuto2 = autoNeogocio2.listar();
                List<FichaTecnica> listafichaTecnica1 = fichaTecnicaNegocio1.listar();
                List<FichaTecnica> listafichaTecnica2 = fichaTecnicaNegocio2.listar();
                Session["listafichaTecnica1"] = listafichaTecnica1;
                Session["listafichaTecnica2"] = listafichaTecnica2;
                Session["listaAuto1"] = listaAuto1;
                Session["listaAuto2"] = listaAuto2;

                if (!IsPostBack)
                {
                    DropDownList1.DataSource = listaAuto1;
                    DropDownList1.DataTextField = "Nombre";
                    DropDownList1.DataValueField = "Id";
                    DropDownList1.DataBind();

                    DropDownList2.DataSource = listaAuto2;
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
            if (!IsPostBack)
            {
                int idAuto1 = int.Parse(DropDownList1.SelectedItem.Value);
                DropDownList1.DataSource = ((List<Auto>)Session["listaAuto1"]).FindAll(x=>x.Id == idAuto1);
                DropDownList1.DataBind();
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idAuto2 = int.Parse(DropDownList2.SelectedItem.Value);
                DropDownList2.DataSource = ((List<Auto>)Session["listaAuto2"]).FindAll(x => x.Id == idAuto2);
                DropDownList2.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idAuto1 = int.Parse(DropDownList1.SelectedItem.Value);
            int idAuto2 = int.Parse(DropDownList2.SelectedItem.Value);

            AutoNeogocio autoNegocio = new AutoNeogocio();
            ListaAutos = autoNegocio.listar();
            auto1 = ListaAutos.Find(auto => auto.Id == idAuto1);
            auto2 = ListaAutos.Find(auto => auto.Id == idAuto2);

            FichaTecnicaNegocio fichaTecnicaNegocio = new FichaTecnicaNegocio();
            
            ListaFichaTecnica1 = fichaTecnicaNegocio.listar();
            fichaTecnica1 = ListaFichaTecnica1.Find(ft => ft.IdProducto == idAuto1);

            ListaFichaTecnica2 = fichaTecnicaNegocio.listar();
            fichaTecnica2 = ListaFichaTecnica2.Find(ft => ft.IdProducto == idAuto2);
        }
    }
}