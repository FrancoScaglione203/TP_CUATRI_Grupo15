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
    public partial class FormularioUsuario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                Usuario usuario;
                UsuarioNegocio negocio = new UsuarioNegocio();
                int idUsuario = int.Parse(Request.QueryString["id"]);

                List<Usuario> lista = negocio.listarConSP();
                usuario = lista.Find(c => c.Id == idUsuario);

                string NombreApellido = usuario.Nombre + " " + usuario.Apellido;

                Session["usuarioNomApell"] = NombreApellido;



                txtApellido.Text = usuario.Apellido;
                txtNombre.Text = usuario.Nombre;
                txtProvincia.Text = usuario.Provincia;
                txtLocalidad.Text = usuario.Localidad;
                txtEmail.Text = usuario.Email;
                txtClave.Text = usuario.clave;


                if (usuario.tipoUsuario == TipoUsuario.NORMAL)
                {
                    ddlTipoUsuario.SelectedValue = "NORMAL";
                }
                else if (usuario.tipoUsuario == TipoUsuario.ADMIN)
                {
                    ddlTipoUsuario.SelectedValue = "ADMIN";
                }
                Session["usuarioModif"] = usuario;
            }
        }


        public String dni()
        {

            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();


            usuario = (Usuario)Session["usuarioModif"];
            string dni = usuario.Dni;
            return dni;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            
                Usuario usuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                if(Request.QueryString["id"] != null)
                { 
                    usuario = Session["usuarioModif"] as Usuario;
                }
                else 
                {
                usuario.Dni = txtDni.Text.ToString();
                }
        
                
                usuario.Apellido = txtApellido.Text;
                usuario.Nombre = txtNombre.Text;
                usuario.Provincia = txtProvincia.Text.ToString();
                usuario.Localidad = txtLocalidad.Text.ToString();
                usuario.Email = txtEmail.Text.ToString();
                usuario.clave = txtClave.Text.ToString();
                usuario.tipoUsuario = (TipoUsuario)ddlTipoUsuario.SelectedIndex;

            if (Request.QueryString["id"] != null)
            {
                negocio.ModificarPerfil(usuario);
                Response.Redirect("Usuarios.aspx", false);
            }
            else
            {
                negocio.InsertarNuevoDesdeAdmin(usuario);
                Response.Redirect("Usuarios.aspx", false);
            }
            Session.Remove("usuarioNomApell");
            Session.Remove("usuarioModif");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }


    }
}