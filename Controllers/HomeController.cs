using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Web.Mvc;

namespace pyOnMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            try
            {
                var pythonPath = "python"; // Ruta al ejecutable de Python, puede variar según tu instalación
                var scriptPath = Server.MapPath("~/pyScripts/script.py");

                using (Process myProcess = new Process())
                {
                    myProcess.StartInfo.UseShellExecute = false;
                    myProcess.StartInfo.FileName = pythonPath;
                    myProcess.StartInfo.Arguments = scriptPath;
                    myProcess.StartInfo.CreateNoWindow = true;
                    myProcess.StartInfo.RedirectStandardOutput = true;
                    myProcess.StartInfo.RedirectStandardError = true;

                    myProcess.Start();

                    // Esperar a que el proceso termine
                    myProcess.WaitForExit();

                    // Leer la salida estándar y de error
                    string output = myProcess.StandardOutput.ReadToEnd();
                    string error = myProcess.StandardError.ReadToEnd();

                    // Verificar si hubo errores
                    if (!string.IsNullOrEmpty(error))
                    {
                        ViewBag.Message = "Error: " + error;
                    }
                    else
                    {
                        // Suponiendo que el script imprime la ruta relativa de la imagen
                        string relativeImagePath = output.Trim();
                        ViewBag.ImagePath = Url.Content(relativeImagePath);
                    }
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }

            return View();
        }

        // Otros métodos del controlador

        public ActionResult About()
        {
            try
            {
                var pythonPath = "python"; // Ruta al ejecutable de Python, puede variar según tu instalación
                var scriptPath = Server.MapPath("~/pyScripts/explorar.py");

                using (Process myProcess = new Process())
                {
                    myProcess.StartInfo.UseShellExecute = false;
                    myProcess.StartInfo.FileName = pythonPath;
                    myProcess.StartInfo.Arguments = scriptPath;
                    myProcess.StartInfo.CreateNoWindow = true;
                    myProcess.StartInfo.RedirectStandardOutput = true;
                    myProcess.StartInfo.RedirectStandardError = true;

                    myProcess.Start();

                    // Esperar a que el proceso termine
                    myProcess.WaitForExit();

                    // Leer la salida estándar y de error
                    string output = myProcess.StandardOutput.ReadToEnd();
                    string error = myProcess.StandardError.ReadToEnd();

                    // Verificar si hubo errores
                    if (!string.IsNullOrEmpty(error))
                    {
                        ViewBag.Message = "Error: " + error;
                    }
                    else
                    {
                        // Suponiendo que el script imprime la ruta relativa de la imagen
                        ViewBag.Message = output.Trim();
                        
                    }
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return View();

        }

        public ActionResult Contact()
        {
            try
            {
                var pythonPath = "python"; // Ruta al ejecutable de Python, puede variar según tu instalación
                var scriptPath = Server.MapPath("~/pyScripts/pyCuboOLAP.py");

                using (Process myProcess = new Process())
                {
                    myProcess.StartInfo.UseShellExecute = false;
                    myProcess.StartInfo.FileName = pythonPath;
                    myProcess.StartInfo.Arguments = scriptPath;
                    myProcess.StartInfo.CreateNoWindow = true;
                    myProcess.StartInfo.RedirectStandardOutput = true;
                    myProcess.StartInfo.RedirectStandardError = true;

                    myProcess.Start();

                    // Esperar a que el proceso termine
                    myProcess.WaitForExit();

                    // Leer la salida estándar y de error
                    string output = myProcess.StandardOutput.ReadToEnd();
                    string error = myProcess.StandardError.ReadToEnd();

                    // Verificar si hubo errores
                    if (!string.IsNullOrEmpty(error))
                    {
                        ViewBag.Message = "Error: " + error;
                    }
                    else
                    {
                        // Leer el contenido de los archivos generados por el script Python
                        string outputDir = output.Trim(); // Esto es la ruta del directorio de salida
                        string productTable = System.IO.File.ReadAllText(outputDir + "/product_table.html");
                        string salesTable = System.IO.File.ReadAllText(outputDir + "/sales_table.html");
                        string productDescription = System.IO.File.ReadAllText(outputDir + "/product_description.html");
                        string salesDescription = System.IO.File.ReadAllText(outputDir + "/sales_description.html");
                        string productCategoryCount = System.IO.File.ReadAllText(outputDir + "/product_category_count.html");
                        string salesScatterPlot = System.IO.File.ReadAllText(outputDir + "/sales_scatter_plot.html");
                        //string urlDescarga = System.IO.File.ReadAllText(outputDir + "/EDA.zip");
                        // Pasar los contenidos al ViewBag
                        ViewBag.ProductTable = productTable;
                        ViewBag.SalesTable = salesTable;
                        ViewBag.ProductDescription = productDescription;
                        ViewBag.SalesDescription = salesDescription;
                        ViewBag.ProductCategoryCount = productCategoryCount;
                        ViewBag.SalesScatterPlot = salesScatterPlot;
                        ViewBag.urlDescarga = outputDir + "/EDA.zip";
                    }
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }

            return View();
        }
        
        public ActionResult Descargar(string urlDescarga)
        {
          
            return File(urlDescarga, "application/zip", "EDA.zip");
           // return View();

        }
    }
}
