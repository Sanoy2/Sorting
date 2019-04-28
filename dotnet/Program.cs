using System;
using System.Collections.Generic;

namespace dotnet
{
    class Program
    {
        static void Main(string[] args)
        {
            int numberOfInts = Int32.Parse(args[0]);
            int numberOfFiles = Int32.Parse(args[1]);
            string directoryWithFiles = $"{args[2]}{numberOfInts}/";
            bool sortOn = Boolean.Parse(args[3]);

            System.Console.WriteLine($"Number of ints: {numberOfInts}");
            System.Console.WriteLine($"Number of files: {numberOfFiles}");
            System.Console.WriteLine($"Sorting on?: {sortOn}");
            System.Console.WriteLine($"Directory: {directoryWithFiles}");

            var loader = new Loader();

            List<int> list = null;
            string path;

            for (int i = 0; i < numberOfFiles; i++)
            {
                path = directoryWithFiles + i + ".txt";
                list = loader.LoadToList(path);
                if(sortOn)
                    list.Sort();
            }
        }
    }
}
