﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using dominio;
using System.Configuration;
using static System.Net.Mime.MediaTypeNames;
using System.Net.Mail;
using System.Net;

namespace negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;
        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("e251eae65abbe8", "3c7451966c8a56");
            server.EnableSsl = true;
            server.Port = 2525;
            server.Host = "sandbox.smtp.mailtrap.io";
        }
        public void armarCorreo(string nombreDestinatario, string mailDestino, string asunto, string cuerpo,string pantilla)
        {
            //De Reanult a User
            email = new MailMessage();
            email.From = new MailAddress("renault.grupo15@gmail.com");
            email.To.Add(mailDestino);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = pantilla;
        }

        public void enviarMail() {
            try
            {
                server.Send(email);
            }
            catch (Exception ex) { 
                throw ex;
            }
        }

    }
}   