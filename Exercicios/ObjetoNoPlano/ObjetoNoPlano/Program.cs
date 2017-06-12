using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObjetosNoPlano
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Digite X inicial: ");
            int x = int.Parse(Console.ReadLine());

            Console.Write("Digite Y inicial: ");
            int y = int.Parse(Console.ReadLine());

            Objeto2D obj = new Objeto2D();

            obj.X = x;
            obj.Y = y;

            Console.Write("Digite comando: ");
            ConsoleKey comando = Console.ReadKey().Key;


            while (comando != ConsoleKey.Escape)
            {
                if (comando == ConsoleKey.RightArrow)
                    obj.MoverParaDireita();

                Console.WriteLine(obj.Coordenadas());

                Console.Write("Digite comando: ");
                comando = Console.ReadKey().Key;
            }
        }
    }
}