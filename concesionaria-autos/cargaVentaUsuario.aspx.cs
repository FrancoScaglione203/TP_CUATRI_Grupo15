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
    public partial class cargaVentaUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCargarVenta_Click(object sender, EventArgs e)
        {
            // Obtener los valores ingresados por el usuario
            string marcaAuto = txtMarca.Text;
            string modeloAuto = txtModelo.Text;
            int cantidadCuotas = Convert.ToInt32(txtCuotas.Text);
            decimal montoCuota = Convert.ToDecimal(txtMontoCuota.Text);

            // Realizar las acciones necesarias para cargar la venta y los detalles de financiación
            // ...
            // Puedes guardar los datos en la base de datos, llamar a métodos de negocio, etc.

            // Redirigir a la página de confirmación o mostrar un mensaje de éxito
            Response.Redirect("ConfirmacionVenta.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            // Lógica para cancelar la carga de venta
            // Puedes redirigir al usuario a la página anterior o realizar otras acciones necesarias
            Response.Redirect("PaginaAnterior.aspx");
        }
    }
}