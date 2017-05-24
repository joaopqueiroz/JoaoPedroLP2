using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            int i, qtd, potencia;
            string nome;
            double km;

            Console.WriteLine("Informe a quantidade de carros");
            qtd = Convert.ToInt32(Console.ReadLine());

            for (i = 0; i < qtd; i++)
            {
                Console.WriteLine("Informe o nome do carro");
                nome = Console.ReadLine();

                Console.WriteLine("Informe a quilometragem do carro");
                km = double.Parse(Console.ReadLine());

                Console.WriteLine("Informe a potencia do carro");
                potencia = int.Parse(Console.ReadLine());

                Console.WriteLine(Classificar(nome, km, potencia));

            }
        } //static void main

        public static string Classificar(string modelo, double km, int potencia)
        {
            string T, P;

            if (km <= 5000)
                T = "novo";

            else if (km <= 30000)
                T = "seminovo";

            else
                T = "velho";

            if (potencia < 120)
                P = "popular";

            else if (potencia <= 200)
                P = "forte";

            else
                P = "potente";

            return String.Format("{0} - {1} - {2}", modelo, T, P);


        }
    }
}
