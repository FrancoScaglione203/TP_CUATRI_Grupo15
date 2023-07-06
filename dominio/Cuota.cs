using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Cuota
    {
        public int ID { get; set; }
        public int IDVenta { get; set; }
        public int Numero { get; set; }
        public decimal Monto { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public bool Pagada { get; set; }
    }
}
