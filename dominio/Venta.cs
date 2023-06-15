using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Venta
    {
        public int Id { get; set; }
        public int idUsuario { get; set; }
        public DateTime Fecha { get; set; }
        public decimal PrecioFinal { get; set; }
        public int Estado { get; set; }  //Seria mejor crear una base de datos de Estados ya que podrian ser mas de dos los estados o solo hay dos estados y hacemos que sea un bool
        public int nroComprobante { get; set; }
        public DetalleVenta Detalle { get; set; }


    }
}
