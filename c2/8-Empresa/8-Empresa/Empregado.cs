using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _8_Empresa
{
    class Empregado : Funcionario
    {
        public Empregado(int n, string d)
            : base(n)
        {
            Data_Entrada = d;
        }
        public string Data_Entrada { get; set; }
        public Gerente Gerente { get; set; }
    }
}