﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Tapizado
    {   
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Muestra { get; set; }
        public string ImagenUrl { get; set; }
        public decimal Precio { get; set; }
        public int IdProducto { get; set; }
    }
}
