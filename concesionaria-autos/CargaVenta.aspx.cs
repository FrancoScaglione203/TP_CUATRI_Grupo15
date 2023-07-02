using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace concesionaria_autos
{
    public partial class CargaVenta : System.Web.UI.Page
    {




        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();


            int dni = int.Parse(txtDNI.Text);

            // Realizar la lógica de búsqueda del usuario por DNI en tu base de datos
            Usuario usuario = usuarioNegocio.BuscarUsuarioPorDNI(dni);
            Session.Add("usuarioVenta", usuario);

            if (usuario != null)
            {
                // Mostrar los detalles del usuario encontrado
                lblNombreUsuario.Text = usuario.Nombre;
                lblApellidoUsuario.Text = usuario.Apellido;
                lblDniUsuario.Text = usuario.Dni;
                lblEmailUsuario.Text = usuario.Email;
                lblProvinciaUsuario.Text = usuario.Provincia;
                lblLocalidadUsuario.Text = usuario.Localidad;

                // Mostrar la sección de usuarioDetails y ocultar la sección de usuarioNoEncontrado
                usuarioDetails.Visible = true;
                usuarioNoEncontrado.Visible = false;
            }
            else
            {
                // Mostrar la sección de usuarioNoEncontrado y ocultar la sección de usuarioDetails
                usuarioNoEncontrado.Visible = true;
                usuarioDetails.Visible = false;
            }
        }

        protected void btnCargarVenta_Click(object sender, EventArgs e)
        {
            // Lógica para cargar la venta del usuario
            // Puedes redirigir al usuario a la página de carga de venta o realizar otras acciones necesarias
            Response.Redirect("cargaVentaUsuario.aspx", false);
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            // Lógica para redirigir al usuario a la página de registro
            // Puedes redirigir al usuario a la página de registro o realizar otras acciones necesarias
        }
    }

    

}