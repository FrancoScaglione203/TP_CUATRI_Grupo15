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
        public List<Auto> ListaAuto { get; set; }
        public List<Resumen> ListaResumen { get; set; }

        int idEquipamiento, idColor, idTapizado;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                    EquipamientoNegocio equipamientoNegocio = new EquipamientoNegocio();
                    ColorNegocio colorNegocio = new ColorNegocio();
                    TapizadoNegocio tapizadoNegocio = new TapizadoNegocio();
                    FichaTecnicaNegocio fichaTecnicaNegocio = new FichaTecnicaNegocio();
                    int id = Convert.ToInt32(Request.QueryString["id"]);

                //1. Listar vistas
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

                    ListaTapizado = tapizadoNegocio.listar();
                    ListaTapizado = ListaTapizado.FindAll(tapizado => tapizado.IdProducto == id);
                    Tapizado = ListaTapizado.Find(tapizado => tapizado.IdProducto == id);
                    RepeaterTapizado.DataSource = ListaTapizado;
                    RepeaterTapizado.DataBind();
                }

                ListaFichaTecnica = fichaTecnicaNegocio.listar();
                ListaFichaTecnica = ListaFichaTecnica.FindAll(elemento => elemento.IdProducto == id);

                //2. Obtener info del producto seleccionado

                if (Session["idEquipamiento"]!=null & Session["idColor"] != null && Session["idTapizado"]!=null)
                {
                    //ListaEquipamientos2 = equipamientoNegocio.listar();
                    //ListaEquipamientos2 = ListaEquipamientos2.FindAll(elemento => elemento.Id == idEquipamiento);
                    //Equipamiento2 = ListaEquipamientos2.Find(elemento => elemento.Id == idEquipamiento);

                    //ListaColores2 = colorNegocio.listar();
                    //Color2 = ListaColores2.Find(elemento => elemento.IdProducto == Convert.ToInt32(idColor));

                    //ListaTapizado2 = tapizadoNegocio.listar();
                    //Tapizado2 = ListaTapizado2.Find(elemento => elemento.IdProducto == Convert.ToInt32(idTapizado));
                }
       
                
              
                //3. Cargar la clase resumen       
                //Equipamiento -> nombre version - precio - FOTO
                //Colores -> Id - Nombre 
                //Tapizados -> Nombre - si es cuero + 5000
                //TOTAL -> SUMAR e.precio + CUERO

                //4. Listar datos de la clase resumen

            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void btnEquipamiento_Click(object sender, EventArgs e)
        {
            //sender: elemento que envía el evento -> objeto
            string id= ((Button)sender).CommandArgument;
            idEquipamiento = Convert.ToInt32(id);
            Session.Add("idEquipamiento", idEquipamiento);

            EquipamientoNegocio equipamientoNegocio = new EquipamientoNegocio();
            ListaEquipamientos2 = equipamientoNegocio.listar();
            ListaEquipamientos2 = ListaEquipamientos2.FindAll(elemento => elemento.Id == idEquipamiento);
            Equipamiento2 = ListaEquipamientos2.Find(elemento => elemento.Id == idEquipamiento);
        }


        protected void btnColor_Click(object sender, ImageClickEventArgs e)
        {
            string id = ((ImageButton)sender).CommandArgument;
            idColor = Convert.ToInt32(id);
            Session.Add("idColor", idColor);

            ColorNegocio colorNegocio = new ColorNegocio();
            ListaColores2 = colorNegocio.listar();
            Color2 = ListaColores2.Find(elemento => elemento.IdProducto == Convert.ToInt32(idColor));
        }

        protected void btnTapizado_Click(object sender, ImageClickEventArgs e)
        {
            string id = ((ImageButton)sender).CommandArgument;
            idTapizado = Convert.ToInt32(id);
            Session.Add("idTapizado", idTapizado);

            TapizadoNegocio tapizadoNegocio = new TapizadoNegocio();
            ListaTapizado2 = tapizadoNegocio.listar();
            Tapizado2 = ListaTapizado2.Find(elemento => elemento.IdProducto == Convert.ToInt32(idTapizado));
        }
        protected void btnFinalizar_Click(object sender, EventArgs e)
        {

        }
    }
}