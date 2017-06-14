using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompeticaoDeCorrida
{
    class Competidor
    {
        public string nome;
        public double t1, t2, t3;

        public double TempoFinal()
        {
            if (t1 > t2 && t1 > t3)
                return t1 + t2;
            if (t2 > t1 && t2 > t3)
                return t1 + t3;
            else
                return t1 + t2; 
        }

    }
}
