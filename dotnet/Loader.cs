using System;
using System.Collections.Generic;
using System.IO;

namespace dotnet
{
    public class Loader
    {
        public List<int> LoadToList(string path)
        {
            var result = new List<int>();
            string line;
            int number;

            FileStream fileStream = new FileStream(path, FileMode.Open);
            using (StreamReader reader = new StreamReader(fileStream))
            {
                while (!reader.EndOfStream)
                {
                    line = reader.ReadLine();
                    number = Int32.Parse(line);
                    result.Add(number);
                }
            }

            return result;
        }

        public void Print(string path)
        {
            FileStream fileStream = new FileStream(path, FileMode.Open);
            using (StreamReader reader = new StreamReader(fileStream))
            {
                while (!reader.EndOfStream)
                {
                    string line = reader.ReadLine();
                    System.Console.WriteLine(line);
                }
            }
        }
    }
}