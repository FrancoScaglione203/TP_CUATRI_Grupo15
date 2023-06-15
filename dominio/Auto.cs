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
        public string modelo { get; set; }
        public int idMarca { get; set; }
        public decimal Precio { get; set; }
        public FichaTecnica FichaTecnica { get; set; }
        public int idImagen { get; set; }
        public int stock {get; set; }
        public int idColor { get; set; }
        public bool Estado { get; set; }
    }
}
