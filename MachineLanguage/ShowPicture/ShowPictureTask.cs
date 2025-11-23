using System;

namespace ShowPicture
{

    public static class ShowPictureTask
    {
        // pixels[y, x] — note the order of coordinates!
        public static string[] GenerateShowPictureCode(bool[,] pixels)
        {
            Console.WriteLine(pixels);         

            // Note! the least significant bit in screen memory word is leftmost.
            throw new NotImplementedException();
        }
    }
}