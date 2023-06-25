using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class FichaTecnica
    {
        public int Id {get;set;}
        public int Plazas { get;set;}
        public int Longitud { get;set;}
        public int Ancho { get;set;}
        public int Ejes { get;set;}
        public bool CajaManual { get; set; }
        public bool CajaAutomatica { get; set; }
        public bool Nafta { get; set; }
        public int IdProducto { get; set; }
    }
}
