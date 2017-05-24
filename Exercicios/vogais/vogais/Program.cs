using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Vogais
{
    class Program
    {
        static void Main(string[] args)
        {
            string vogais;
            int cont = 0;
            vogais = Console.ReadLine();

            for (int i = 0; i < vogais.Length; i++)
            {
                if (vogais[i] == 'a' || vogais[i] == 'A')
                {
                    cont++;
                }

                else if (vogais[i] == 'e' || vogais[i] == 'E')
                {
                    cont++;
                }

                else if (vogais[i] == 'i' || vogais[i] == 'I')
                {
                    cont++;
                }

                else if (vogais[i] == 'o' || vogais[i] == 'O')
                {
                    cont++;
                }

                else if (vogais[i] == 'u' || vogais[i] == 'U')
                {
                    cont++;
                }

            }
            Console.WriteLine(cont);

        }
    }
}