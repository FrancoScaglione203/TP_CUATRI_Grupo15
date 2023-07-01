using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Auto
    {
        public int Id {  get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public int Color {get; set; }
        public bool Estado { get; set; }
        public Imagen Imagen { get; set; }
        public FichaTecnica FichaTecnica { get; set; }
        public Auto()
        {
            this.Imagen = new Imagen();
            this.FichaTecnica = new FichaTecnica();
        }
        public decimal Financiacion()
        {
            decimal interes = Convert.ToDecimal(1.1594);

            decimal primeraCuota = Convert.ToDecimal(0.0072);

            return (Precio * interes)* primeraCuota;
        }
    }

}
