using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
  /*public enum TipoUsuario
    {
        NORMAL = 1,
        ADMIN = 2
    } */

    public class Usuario
    {
        public int Id { get; set; }
        public string clave { get; set; }
        public bool TipoUsuario { get; set; }
        public bool Admin { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Dni { get; set; }
        public string Email { get; set; }
        public string Provincia { get; set; }
        public string Localidad { get; set; }
        public bool Activo { get; set; }



    }
}
