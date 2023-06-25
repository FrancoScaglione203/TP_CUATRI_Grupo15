using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Equipamiento
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public bool Climatizador { get; set; }
        public bool SensorEstacionamiento { get; set; }
        public bool Computadora { get; set; }
        public bool ControlCrucero { get; set; }
        public bool Alarma { get; set; }
        public int IdProducto { get; set; }
        public Imagen Imagen { get; set; }
    }
}
