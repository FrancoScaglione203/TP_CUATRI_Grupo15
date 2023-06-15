using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class DetalleVenta
    {
        public int Id { get; set; }
        public int idVenta { get; set; }
        public int idFinanciacion { get; set; }
        public int idAuto {get; set; }
        public int Cantidad { get; set; }
        public Decimal Precio { get; set; }

    }
}
