using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace concesionaria_autos
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        public List<Auto> ListaAutos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (Session["usuario"] != null)
            {

                Usuario usuario;
                usuario = (Usuario)Session["usuario"];
                string nombreUsuario = usuario.Nombre + " " + usuario.Apellido;
                lblIngresar.Text = nombreUsuario;

            }
            else
            {
                lblIngresar.Text = "Ingresar";
            }

            if (dominio.Seguridad.esAdmin(Session["usuario"]))
            {
                adminLink.Visible = true;
            }
        }
    

        protected void btnLoginSingin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }


        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("default.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtBuscar.Text != "")
            {
                AutoNeogocio autoNegocio = new AutoNeogocio();
                ListaAutos = autoNegocio.listar();

                ListaAutos = ListaAutos.FindAll(x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper())
                );

                if(ListaAutos.Count > 0)
                {
                   Session.Add("busqueda", ListaAutos);
                   Response.Redirect("default.aspx");
                } else
                {
                    Response.Redirect("error.aspx");
                }
            }
        }
    }
}