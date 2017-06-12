using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompeticaoDeCorrida
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Informe o número de competidores");
            int n = Int32.Parse(Console.ReadLine());

            Competidor[] comp = new Competidor[n];
            double[] tempoOf = new double[n];

            int i = 0;
            while (i < n)
            {
                comp[i] = new Competidor();
                
                Console.WriteLine("Informe o nome");
                comp[i].nome = Console.ReadLine();
                
                Console.WriteLine("Informe o primeiro tempo");
                comp[i].t1 = Double.Parse(Console.ReadLine());

                Console.WriteLine("Informe o segundo tempo");
                comp[i].t2 = Double.Parse(Console.ReadLine());

                Console.WriteLine("Informe o terceiro tempo");
                comp[i].t3 = Double.Parse(Console.ReadLine());
                
                tempoOf[i] = comp[i].TempoOficial();

                i++;
            }
        }
    }
}
