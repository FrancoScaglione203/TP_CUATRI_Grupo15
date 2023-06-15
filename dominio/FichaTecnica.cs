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
        public string Combustible { get;set;}
        public decimal Kilometraje { get;set;}
        public int año { get;set;}
        public decimal Precio { get;set;}
        public string Version { get;set;} //Cambie "Equipamiento" por "Version", haciendo referencia a si es full, base, deportivo, estandard, etc..
    }
}
