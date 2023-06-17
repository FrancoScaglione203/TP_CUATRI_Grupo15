using System;
using System.Collections.Generic;
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
        public int IdMarca { get; set; }
        public string Imagen { get; set; }
        public int Stock {get; set; }
        public int Estado { get; set; }
    }
}
