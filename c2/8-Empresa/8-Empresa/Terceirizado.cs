using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _8_Empresa
{
    class Terceirizado : Empregado
    {
        public Terceirizado(string n, string d, string g) : base(n, d)
        {
            Empresa_Matriz = g;
        }
        public string Empresa_Matriz { get; set; }
    }
}