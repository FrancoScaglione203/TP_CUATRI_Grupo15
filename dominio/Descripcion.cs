using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{

    public class Descripcion
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Bajada { get; set; }
        public string ImagenUrl { get; set; }
        public int IdProducto { get; set; }
    }
}
