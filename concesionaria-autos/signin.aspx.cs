using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;



namespace concesionaria_autos
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int validacion = 0;
            int validacion1 = 0;
            Session.Add("validacion", validacion);
            Session.Add("validacion1", validacion1);
        }
        
        public void validacionDatosVacios()
        {
            int validacion;
            validacion = (int)Session["validacion"];
            Session["validacion1"] = validacion;

            if (string.IsNullOrEmpty(txtClave.Text) || string.IsNullOrEmpty(txtNombre.Text) ||
                string.IsNullOrEmpty(txtApellido.Text) || string.IsNullOrEmpty(txtDni.Text) ||
                string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtProvincia.Text) ||
                string.IsNullOrEmpty(txtLocalidad.Text))
            {
                validacion  ++;
                Session["validacion"] = validacion;

            }
            
        }


        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {

            validacionDatosVacios();
            int validacion;
            int validacion1;

            validacion = (int)Session["validacion"];
            validacion1 = (int)Session["validacion1"];

            if (validacion > validacion1)
            {
                return;            
            }

            try
            { 
            
                Usuario user = new Usuario();
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                user.clave = txtClave.Text;
                user.tipoUsuario = TipoUsuario.NORMAL;
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.Dni = txtDni.Text;
                user.Email = txtEmail.Text;
                user.Provincia = txtProvincia.Text;
                user.Localidad = txtLocalidad.Text;
                user.Activo = true;
                

                if(!usuarioNegocio.ValidacionDniEmail(user.Dni, user.Email))
                {
                    int id = usuarioNegocio.InsertarNuevo(user);
                    if (id == 0)
                    {
                        Response.Redirect("ErrorLog.aspx");
                    }
                    else
                    {
                        Session.Add("usuario", user);
                        Response.Redirect("default.aspx");
                    }
                }
                else
                {
                    //Session.Add("usuario", user);
                    Response.Redirect("ErrorLog.aspx");
                }


            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }

        }

       
    }
}