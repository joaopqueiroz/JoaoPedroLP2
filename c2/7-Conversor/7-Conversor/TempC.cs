using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7_Conversor
{
    class TempC
    {
        public double valor;

        public double EmFahrenheit()
        {
            return 1.8 * valor + 32;
        }

        public double EmKelvin()
        {
            return valor + 273;
        }
    }
}