using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{

    public class Venta
    {
        public int IDVenta { get; set; }
        public string DNIComprador { get; set; }
        public int idModelo { get; set; }
        public string ModeloAuto { get; set; }
        public int idColor { get; set; }
        public string ColorAuto { get; set; }
        public string UrlImagen { get; set; }
        public int idVersion { get; set; }
        public string Tapizado { get; set; }
        public string VersionAuto { get; set; }
        public int CantidadCuotas { get; set; }
        public int CuotasPagadas { get; set; }
        public List<Cuota> Cuotas { get; set; }
    }
}
