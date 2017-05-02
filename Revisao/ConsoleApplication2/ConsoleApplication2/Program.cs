using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class Program
    {
        static void Main(string[] args)
        {
            string modelo, T, P;
            double km, potencia;

            Console.WriteLine("Informe o modelo do carro");
            modelo = Console.ReadLine();

            Console.WriteLine("Informe a quilometragem do carro");
            km = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("Informe a potencia do carro");
            potencia = Convert.ToDouble(Console.ReadLine());

            if (km < 5000)
                T = "novo";
            else if (km >= 5000 && km <= 30000 )
                T = "seminovo";
            else
                T = "velho";
            if (potencia > 200)
                P = "potente";
            else if (potencia > 120 && potencia <= 200)
               P = "forte";
            else
                P = "popular";
            
            Console.WriteLine("O {0} - {1} - {2}", modelo, T, P);
            Console.ReadKey();
        }
    }
}
