using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7_Conversor
{
    class Program
    {
        static void Main(string[] args)
        {
            TempC t = new TempC();
            int n = 1;

            while (n != 0)
            {
                Console.WriteLine("1- Nova temperatura");
                Console.WriteLine("2- Para Fahrenheit");
                Console.WriteLine("3- Para Kelvin");
                Console.WriteLine("0- Sair");
                n = int.Parse(Console.ReadLine());

                if (n != 0)
                {
                    Console.WriteLine("Temperatura:");
                    t.valor = double.Parse(Console.ReadLine());

                    if (n == 2)
                        Console.WriteLine(t.EmFahrenheit());
                    else if (n == 3)
                        Console.WriteLine(t.EmKelvin());
                }
                else
                    break;
            }
        }
    }
}
       