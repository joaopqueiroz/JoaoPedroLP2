using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _8_Empresa
{
    class Funcionario
    {
        public Funcionario(int h)
        {
            Numero_Registro = h;
        }
        public int Numero_Registro { get; set; }
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public string Email { get; set; }
        public double Salario { get; set; }

    }
}