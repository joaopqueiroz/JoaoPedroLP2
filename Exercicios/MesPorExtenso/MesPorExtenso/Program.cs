using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MesPorExtenso
{
    class Program
    {
        static void Main(string[] args)
        {
                string data, mes;
                int D, M, A;


                data = Console.ReadLine();

                D = int.Parse(data.Substring(0, 2));

                M = int.Parse(data.Substring(3, 2));

                A = int.Parse(data.Substring(6, 4));

                if (M == 1)
                {
                    mes = "janeiro";
                }

                else if (M == 2)
                {
                    mes = "fevereiro";
                }

                else if (M == 3)
                {
                    mes = "março";
                }

                else if (M == 4)
                {
                    mes = "abril";
                }

                else if (M == 5)
                {
                    mes = "maio";
                }

                else if (M == 6)
                {
                    mes = "junho";
                }

                else if (M == 7)
                {
                    mes = "julho";
                }

                else if (M == 8)
                {
                    mes = "agosto";
                }

                else if (M == 9)
                {
                    mes = "setembro";
                }

                else if (M == 10)
                {
                    mes = "outubro";
                }

                else if (M == 11)
                {
                    mes = "novembro";
                }

                else
                {
                    mes = "dezembro";
                }

                Console.WriteLine("{0} de {1} de {2}", D, mes, A);

        }
    }
}