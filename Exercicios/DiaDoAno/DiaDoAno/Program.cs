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
            string mes, data;
            int d = 0, dia;
            
            Console.WriteLine("Insira a data");
            data = Console.ReadLine();
            
            dia = int.Parse(data.Substring(0, 2));
            
            mes = data.Substring(6, 4);

            if (mes == "jane" || mes == "Jane")
            {
                d = dia;
            }
            else if (mes == "feve" || mes == "Feve")
            {
                d = 31 + dia;
            }
            else if (mes == "març" || mes == "Març")
            {
                d = 59 + dia;
            }
            else if (mes == "abri" || mes == "Abri")
            {
                d = 90 + dia;
            }
            else if (mes == "maio" || mes == "Maio")
            {
                d = 120 + dia;
            }
            else if (mes == "junh" || mes == "Junh")
            {
                d = 151 + dia;
            }
            else if (mes == "julh" || mes == "Julh")
            {
                d = 181 + dia;
            }
            else if (mes == "agos" || mes == "Agos")
            {
                d = 212 + dia;
            }
            else if (mes == "sete" || mes == "Sete")
            {
                d = 243 + dia;
            }
            else if (mes == "outu" || mes == "Outu")
            {
                d = 273 + dia;
            }
            else if (mes == "nove" || mes == "Nove")
            {
                d = 304 + dia;
            }
            else if (mes == "deze" || mes == "Deze")
            {
                d = 334 + dia;
            }
            else
            {
                Console.WriteLine("Tu é Doente?");
            }
            Console.WriteLine("{0}º dia do ano", d);
            Console.ReadKey();
        }
    }
}
