<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="configuracion.aspx.cs" Inherits="concesionaria_autos.configuracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <head>
        <!-- Materializecss compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/materialize-stepper@2.1.4/materialize-stepper.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <!-- Materializecss compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
        <!-- jQueryValidation Plugin -->
        <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
    </head>

    <div class="container-fluid">
        <form>
            <ul class="stepper parallel horizontal">
                <li class="step active">
                    <div class="step-title waves-effect waves-dark">Versiones</div>
                    <div class="step-content">
                        <div class="row justify-content-center">

                            <!-- VERSIONES -->
                            <%
                                foreach (dominio.Equipamiento equipo in ListaEquipamientos)
                                {
                            %>
                            <div class="card border-0 mx-4" style="width: 22rem">
                                <img class="card-img-top" src="<%: equipo.Imagen.ImagenUrl %>" alt="<%: equipo.Nombre %>">
                                <div class="card-body">
                                    <h6 class="card-title fw-bold"><%: equipo.Nombre %></h6>
                                    <h6 class="card-text fw-bold">desde $<%: equipo.Precio.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></h6>
                                    <div class="hl2 pe-4 my-3"></div>
                                    <p class="py-2">Ver equipamiento destacado</p>
                                    <ul class="p-1">
                                        <li class="list-dot">Airbags laterales delanteros﻿</li>
                                        <li class="list-dot">Anclajes Isofix﻿﻿</li>
                                        <li class="list-dot">DRL LED C-shape﻿</li>
                                        <li class="list-dot">Levantacristales delanteros con comando eléctrico﻿</li>
                                    </ul>

                                    <asp:Button class="btn btn-warning w-100 my-2 fw-bold text-capitalize" ID="Button1" runat="server" Text="Configurar" />
                                </div>
                            </div>
                            <%
                                }
                            %>

                            <!-- FIN VERSIONES -->

                        </div>
                        <div class="step-actions">
                            <button class="waves-effect waves-dark btn next-step bg-black text-capitalize">Siguiente</button>
                            <button class="waves-effect waves-dark btn-flat previous-step text-capitalize">Anterior</button>
                        </div>
                    </div>
                </li>
                <li class="step">
                    <div class="step-title waves-effect waves-dark">Diseño Exterior</div>
                    <div class="step-content">
                        <div class="row">

                            <!-- EXTERIOR -->

                            <img class="configImg" src="LoganGris.png" alt="Auto">



                            <div class="container d-flex">
                                <% foreach (dominio.Color colores in ListaColores)
                                    { %>
                                <a class="color">
                                    <img class="dot" src="<%: colores.Muestra %>" alt="<%: colores.Nombre %>">
                                </a>
                                <span class="ImagenUrl d-none"><%: colores.ImagenUrl %></span>
                                <% } %>
                            </div>

                            <script defer>
                                var img = document.querySelector('.configImg');
                                var color = document.querySelectorAll('.color');
                                var ImagenUrl = document.querySelectorAll('.ImagenUrl');

                                for (var i = 0; i < color.length; i++) {
                                    color[i].addEventListener("click", function (e) {
                                        var index = Array.from(color).indexOf(e.currentTarget); // Obtener el índice del elemento clicado
                                        var span = ImagenUrl[index]; // Obtener el elemento <span> correspondiente al índice
                                        var contenido = span.textContent;
                                        img.src = contenido;
                                    });
                                }
                            </script>

                            <!-- FIN EXTERIOR -->
                        </div>

                        <div class="step-actions">
                            <button class="waves-effect waves-dark btn next-step bg-black text-capitalize">Siguiente</button>
                            <button class="waves-effect waves-dark btn-flat previous-step text-capitalize">Anterior</button>
                        </div>
                    </div>
                </li>
                <li class="step">
                    <div class="step-title waves-effect waves-dark">Diseño Exterior</div>
                    <div class="step-content">
                        <div class="row">

                            <!-- INTERIOR -->





                            <!-- FIN INTERIOR -->

                        </div>
                        <div class="step-actions">
                            <button class="waves-effect waves-dark btn next-step bg-black  text-capitalize">Siguiente</button>
                            <button class="waves-effect waves-dark btn-flat previous-step  text-capitalize">Anterior</button>
                        </div>
                    </div>
                </li>
                <li class="step">
                    <div class="step-title waves-effect waves-dark">Equipamiento</div>
                    <div class="step-content">
                        <div class="row">

                            <!-- EQUIPAMIENTO -->





                            <!-- FIN EQUIPAMIENTO -->

                        </div>
                        <div class="step-actions">
                            <button class="waves-effect waves-dark btn next-step bg-black  text-capitalize">Siguiente</button>
                            <button class="waves-effect waves-dark btn-flat previous-step  text-capitalize">Anterior</button>
                        </div>
                    </div>
                </li>
                <li class="step">
                    <div class="step-title waves-effect waves-dark">Resumen</div>
                    <div class="step-content">
                        <div class="row">

                            <!-- RESUMEN -->





                            <!-- FIN RESUMEN -->

                        </div>
                        <div class="step-actions">
                        </div>
                    </div>
                </li>
            </ul>
        </form>
    </div>

    <script type="text/javascript" src="Stepper.js"></script>
</asp:Content>
