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
    public partial class configuracion : System.Web.UI.Page
    {
        public List<Equipamiento> ListaEquipamientos { get; set; }
        public List<Equipamiento> ListaEquipamientos2 { get; set; }
        public List<Color> ListaColores { get; set; }
        public List<Color> ListaColores2 { get; set; }
        public List<Tapizado> ListaTapizado { get; set; }
        public List<Tapizado> ListaTapizado2 { get; set; }
        public List<FichaTecnica> ListaFichaTecnica { get; set; }
        public Equipamiento Equipamiento2 { get; set; }
        public Color Color { get; set; }
        public Color Color2 { get; set; }
        public Tapizado Tapizado { get; set; }
        public Tapizado Tapizado2 { get; set; }

        int idEquipamiento, idColor, idTapizado;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                    ImagenNegocio imagenNegocio = new ImagenNegocio();
                    EquipamientoNegocio equipamientoNegocio = new EquipamientoNegocio();
                    ColorNegocio colorNegocio = new ColorNegocio();
                    TapizadoNegocio tapizadoNegocio = new TapizadoNegocio();
                    FichaTecnicaNegocio fichaTecnicaNegocio = new FichaTecnicaNegocio();
                    
                    int id = Convert.ToInt32(Request.QueryString["id"]);

                if (!IsPostBack)
                {

                    ListaEquipamientos = equipamientoNegocio.listar();
                    ListaEquipamientos = ListaEquipamientos.FindAll(equipo => equipo.IdProducto == id);
                    RepeaterEquipamiento.DataSource = ListaEquipamientos;
                    RepeaterEquipamiento.DataBind();

                    ListaColores = colorNegocio.listar();
                    ListaColores = ListaColores.FindAll(color => color.IdProducto == id);
                    Color = ListaColores.Find(color => color.IdProducto == id);
                    RepeaterColor.DataSource = ListaColores;
                    RepeaterColor.DataBind();

                    colorBox.ImageUrl = ListaColores[0].ImagenUrl;

                    ListaTapizado = tapizadoNegocio.listar();
                    ListaTapizado = ListaTapizado.FindAll(tapizado => tapizado.IdProducto == id);
                    Tapizado = ListaTapizado.Find(tapizado => tapizado.IdProducto == id);
                    RepeaterTapizado.DataSource = ListaTapizado;
                    RepeaterTapizado.DataBind();

                    tapizadoBox.ImageUrl = ListaTapizado[0].ImagenUrl;

                }

                ListaFichaTecnica = fichaTecnicaNegocio.listar();
                ListaFichaTecnica = ListaFichaTecnica.FindAll(elemento => elemento.IdProducto == id);

            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void btnEquipamiento_Click(object sender, EventArgs e)
        {
            {
                //sender: elemento que envía el evento -> objeto
                string id = ((Button)sender).CommandArgument;
                idEquipamiento = Convert.ToInt32(id);
  
                EquipamientoNegocio equipamientoNegocio = new EquipamientoNegocio();
                ListaEquipamientos2 = equipamientoNegocio.listar();
                ListaEquipamientos2 = ListaEquipamientos2.FindAll(elemento => elemento.Id == idEquipamiento);
                Equipamiento2 = ListaEquipamientos2.Find(elemento => elemento.Id == idEquipamiento);

                Session.Add("equipamientoNombre", Equipamiento2.Nombre);
                Session.Add("equipamientoPrecio", Equipamiento2.Precio);

                Session.Add("precio1", Equipamiento2.Precio);
            }

        }


        protected void btnColor_Click(object sender, ImageClickEventArgs e)
        {
            string id = ((ImageButton)sender).CommandArgument;
            idColor = Convert.ToInt32(id);
             
            Session.Add("idColor", idColor);

            ColorNegocio colorNegocio = new ColorNegocio();
            ListaColores2 = colorNegocio.listar();
            Color2 = ListaColores2.Find(elemento => elemento.Id == idColor);
           
            imageBox.ImageUrl = Color2.ImagenUrl;
            Session.Add("colorNombre", Color2.Nombre);
            Session.Add("colorFoto", Color2.ImagenUrl);


        }

        protected void btnTapizado_Click(object sender, ImageClickEventArgs e)
        {
            string id = ((ImageButton)sender).CommandArgument;
            idTapizado = Convert.ToInt32(id);
   
            TapizadoNegocio tapizadoNegocio = new TapizadoNegocio();
            ListaTapizado2 = tapizadoNegocio.listar();
            Tapizado2 = ListaTapizado2.Find(elemento => elemento.Id == idTapizado);
            Session.Add("tapizadoNombre", Tapizado2.Nombre);
            Session.Add("tapizadoPrecio", Tapizado2.Precio);
  
            decimal precio1 = (decimal)Session["precio1"];
            decimal precio2 = Tapizado2.Precio;
            decimal total=precio1+precio2;
 
            Session.Add("precioTotal", total);

        }
        protected void btnFinalizar_Click(object sender, EventArgs e)
        {

        }
    }
}