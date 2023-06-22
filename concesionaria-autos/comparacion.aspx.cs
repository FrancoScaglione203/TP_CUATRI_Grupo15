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
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idAuto2 = int.Parse(DropDownList2.SelectedItem.Value);

        }
    }
}