using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Resumen
    {
        public int Id {  get; set; }
        public string VersionNombre { get; set; }
        public decimal VersionPrecio { get; set; }
        public string ColorNombre { get; set; }
        public string ColorImagen { get; set; }
        public string TapizadoNombre { get; set; }
        public decimal TapizadoPrecio { get; set; }
        public decimal getTotal()
        {
            return VersionPrecio + TapizadoPrecio;
        }
    }

}
