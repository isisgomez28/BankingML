using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace parcerDatasetBankingML
{
    class Program
    {
        static void Main(string[] args)
        {
            // Lectura de Full Training Example and Test Examples
            string[] fullTraining = System.IO.File.ReadAllLines(@"C:\Users\Isis\Documents\GitHub\BankingML\DatasetInfo\bank-full.csv");
            string[] testTraining = System.IO.File.ReadAllLines(@"C:\Users\Isis\Documents\GitHub\BankingML\DatasetInfo\bank.csv");
            
            // Header de Consola
            System.Console.WriteLine("Comparacion de Archivos bank(text dataset) y bank-full(full dataser).");

            // Lista auxiliar.
            List<string> list = new List<string>(fullTraining);
            fullTraining = null;

            // Iteracion sobre Dataset para eliminar records que son iguales.
            for (int j = 0; j < list.Count; j++ ) {
                foreach (string testLine in testTraining) {
                    if (list[j] == testLine.Trim()) {
                        list.RemoveAt(j);
                    }
                }
            }

            // Mix up - Poniendo todo en su lugar.
            fullTraining = list.ToArray();
            list.Clear();

            // Insertando los Records en el cleanTrainingDS.txt
            System.IO.File.WriteAllLines(@"C:\Users\Isis\Documents\GitHub\BankingML\DatasetInfo\cleanTrainingDS.txt", fullTraining);
            
            Console.WriteLine("Press any key to exit.");
            System.Console.ReadKey();
        }
    }
}
