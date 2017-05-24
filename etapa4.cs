using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    class Program
    {
            struct carro
            {
            public int potencia;
            public int qtd;
            public string nome;
            public double km;
            }
        static void Main(string[] args)
        {
            carro automovel;
            int i;

            Console.WriteLine("Informe a quantidade de carros");
            automovel.qtd = Convert.ToInt32(Console.ReadLine());

            for (i = 0; i < automovel.qtd; i++)
            {
                Console.WriteLine("Informe o nome do carro");
                automovel.nome = Console.ReadLine();

	            Console.WriteLine("Informe a quilometragem do carro");
                automovel.km = double.Parse(Console.ReadLine());
       
	            Console.WriteLine("Informe a potencia do carro");
                automovel.potencia = int.Parse(Console.ReadLine());

                Console.WriteLine(Classificar(automovel.nome, automovel.km, automovel.potencia));
              
            }
        } //static void main
        
        public static string Classificar(string modelo, double km, int potencia)
        {
            string T, P;

            if (automovel.km <= 5000)
                T = "novo";

            else if (automovel.km <= 30000)
                T = "seminovo";

            else
                T = "velho";

            if (automovel.potencia < 120)
                P = "popular";

            else if (automovel.potencia <= 200)
                P = "forte";

            else
                P = "potente";

            return String.Format("{0} - {1} - {2}", automovel.modelo, T, P);

        }
        
    }
}
