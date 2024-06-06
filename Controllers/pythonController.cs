﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace pyOnMVC.Controllers
{
    public class pythonController : Controller
    {
        public ActionResult pyEdaDW()
        {
            try
            {
                var pythonPath = "python"; // Ruta al ejecutable de Python, puede variar según tu instalación
                var scriptPath = Server.MapPath("~/pyScripts/pyEdaSQL.py");

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
                        ViewBag.Error = "Error: " + error;
                        
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
                ViewBag.Error = e.Message;
             
            }
            return View();
        }
        public ActionResult pyIndicador(int crecimiento = 5)
        {
            try
            {
                var pythonPath = "python"; // Ruta al ejecutable de Python, puede variar según tu instalación
                var scriptPath = Server.MapPath("~/pyScripts/pyIndicador.py");
                var tempFilePath = Server.MapPath("~/App_Data/Output.html"); // Archivo temporal para almacenar la salida

                using (Process myProcess = new Process())
                {
                    myProcess.StartInfo.UseShellExecute = false;
                    myProcess.StartInfo.FileName = pythonPath;
                    myProcess.StartInfo.Arguments = $"{scriptPath} {tempFilePath} {crecimiento}"; // Pasar la ruta del archivo temporal como argumento
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
                        ViewBag.Error = "Error: " + error;
                    }
                    else
                    {
                        // Leer el contenido del archivo temporal
                        string fileContent = System.IO.File.ReadAllText(tempFilePath);
                        ViewBag.Message = fileContent;
                    }
                }
            }
            catch (Exception e)
            {
                ViewBag.Error = e.Message;
            }
            return View();
        }

        public ActionResult pyEdaTemp()
        {
            try
            {
                var pythonPath = "python"; // Ruta al ejecutable de Python, puede variar según tu instalación
                var scriptPath = Server.MapPath("~/pyScripts/pyEdaSQLTemp.py");
                var tempFilePath = Server.MapPath("~/App_Data/Output.html"); // Archivo temporal para almacenar la salida

                using (Process myProcess = new Process())
                {
                    myProcess.StartInfo.UseShellExecute = false;
                    myProcess.StartInfo.FileName = pythonPath;
                    myProcess.StartInfo.Arguments = $"{scriptPath} {tempFilePath}"; // Pasar la ruta del archivo temporal como argumento
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
                        ViewBag.Error = "Error: " + error;
                    }
                    else
                    {
                        // Leer el contenido del archivo temporal
                        string fileContent = System.IO.File.ReadAllText(tempFilePath);
                        ViewBag.Message = fileContent;
                    }
                }
            }
            catch (Exception e)
            {
                ViewBag.Error = e.Message;
            }
            return View();

        }
        // GET: python
        public ActionResult Index()
        {
            return View();
        }
    }
}