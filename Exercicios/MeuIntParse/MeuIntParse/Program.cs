
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MeuIntParse
{
    class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine(2 * MeuIntParse(Console.ReadLine()));
        }

        public static int MeuIntParse(string num)
        {
            int multiplicar = 1;
            int total = 0;

            for (int i = num.Length - 1; i >= 0; i--)
            {
                total += (num[i] - '0') * multiplicar;
                multiplicar *= 10;
            }

            return total;
        }
    }

}