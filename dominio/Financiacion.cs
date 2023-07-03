using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Financiacion
    {
        public int id { get; set; }
        public int CantCuotas { get; set; }
        public decimal DsCuotas { get; set; }
        public decimal GastoEntrega { get; set; }
        public decimal GastoAdministrativo { get; set; }
        public decimal Cuota1A20 { get; set; }
        public decimal Cuota21A40 { get; set; }
        public decimal Cuota41A60 { get; set; }
        public decimal Cuota61A80 { get; set; }
        public decimal Cuota81A100 { get; set; }

    }
}
