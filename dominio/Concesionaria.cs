﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Concesionaria
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string ImagenUrl { get; set; }
        public string MapsUrl { get; set; }
        public decimal SemanaAbre { get; set; }
        public decimal SemanaCierra { get; set; }
        public decimal SabadoAbre { get; set; }
        public decimal SabadoCierra { get; set; }
        public string Localidad { get; set; }
        public string Provincia { get; set; }
    }
}
