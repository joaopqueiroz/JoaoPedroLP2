﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _8_Empresa
{
    class Gerente : Funcionario
    {
        public Gerente(int r, int s) : base(r)
        {
            Setor = s;
        }
        public double Bonus { get; set; }
        public int Setor { get; set; }
    }
}