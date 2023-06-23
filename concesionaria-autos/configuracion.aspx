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

                            <img class="configImg" src="<%:Color.ImagenUrl %>" alt="Auto">

                            <div class="container ">
                                <div class="d-flex justify-content-center m-4">
                                    <% foreach (dominio.Color colores in ListaColores)
                                        { %>
                                    <a class="color me-4">
                                        <img class="dot" src="<%: colores.Muestra %>" alt="<%: colores.Nombre %>">
                                    </a>
                                    <span class="ImagenUrl d-none"><%: colores.ImagenUrl %></span>
                                    <% } %>
                                </div>
                            </div>

                            <script type="text/javascript">
                                var img = document.querySelector('.configImg');
                                var color = document.querySelectorAll('.color');
                                var ImagenUrl = document.querySelectorAll('.ImagenUrl');

                                for (var i = 0; i < color.length; i++) {
                                    color[i].addEventListener("click", function (e) {
                                        var index = Array.from(color).indexOf(e.currentTarget); // Obtener el índice del elemento clicado
                                        var span = ImagenUrl[index]; // Obtener el elemento <span> correspondiente al índice
                                        var contenido = span.textContent;
                                        /* alert(contenido);*/
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
                    <div class="step-title waves-effect waves-dark">Diseño Interior</div>
                    <div class="step-content">
                        <div class="row">

                            <!-- INTERIOR -->

                            <img class="configImg2" src="<%:Tapizado.ImagenUrl %>" alt="Auto">

                            <div class="container">
                                <div class="d-flex justify-content-center m-4">
                                    <% foreach (dominio.Tapizado tapizado in ListaTapizado)
                                        { %>
                                    <a class="tapizado me-4">
                                        <img class="dot" src="<%: tapizado.Muestra %>" alt="<%: tapizado.Nombre %>">
                                    </a>
                                    <span class="ImagenUrl2 d-none"><%: tapizado.ImagenUrl %></span>
                                    <% } %>
                                </div>
                            </div>

                            <script type="text/javascript">
                                var img2 = document.querySelector('.configImg2');
                                var tapizado = document.querySelectorAll('.tapizado');
                                var ImagenUrl2 = document.querySelectorAll('.ImagenUrl2');

                                for (var i = 0; i < tapizado.length; i++) {
                                    tapizado[i].addEventListener("click", function (e) {
                                        var index = Array.from(tapizado).indexOf(e.currentTarget); // Obtener el índice del elemento clicado
                                        var span = ImagenUrl2[index]; // Obtener el elemento <span> correspondiente al índice
                                        var contenido = span.textContent;
                                        /* alert(contenido);*/
                                        img2.src = contenido;
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
                    <div class="step-title waves-effect waves-dark">Equipamiento</div>
                    <div class="step-content">
                        <div class="row">

                            <!-- EQUIPAMIENTO -->

                            <%
                                foreach (dominio.FichaTecnica fichaTecnica in ListaFichaTecnica)
                                {
                            %>
                            <img class="configImg" src="<%:Color.ImagenUrl %>" alt="Auto">

                            <%
                                }
                            %>

                            <div class="justify-content-center m-4">

                                <%
                                    foreach (dominio.FichaTecnica fichaTecnica in ListaFichaTecnica)
                                    {
                                %>
                                <div class="row justify-content-center py-3">Número de plazas</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica!=null ? fichaTecnica.Plazas : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Longitud total</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica!=null ? fichaTecnica.Longitud : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Ancho total</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica!=null ? fichaTecnica.Ancho : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Distancia entre ejes</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica!=null ? fichaTecnica.Ejes : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Caja Manual</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica!=null ? (fichaTecnica.CajaManual==true ? "Si" : "No") : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Caja Automática</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica!=null ? (fichaTecnica.CajaAutomatica==true ? "Si" : "No"): 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Nafta</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica!=null ? (fichaTecnica.Nafta==true ? "Si" : "No") : 0 %></div>

                                </div>

                                <%
                                    }
                                %>
                            </div>


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
                        <div class="row my-4">

                            <!-- RESUMEN -->

                            <div class="d-flex justify-content-evenly align-content-center">

                                <div class="resumem-img-container">
                                    <img class="resumen-img" src="<%:Color.ImagenUrl %>" alt="Auto">
                                </div>

                                <div class="card p-4" style="width: 25rem;">
                                    <div class="card-body">
                                        <h6 class="card-subtitle my-2 text-muted">Precio</h6>
                                        <h5 class="card-title fw-bold">$5.454.200,00</h5>
                                        <div class="hl2 pe-4 my-3"></div>
                                        <h6 class="card-subtitle my-4 text-muted">Detalle del precio</h6>
                                        <p class="card-text fw-bold">VERSION</p>

                                        <p class="resumenP">
                                            <span>Logan Life 1.6</span>
                                            <span class="dottedLine"></span>
                                            <span class="fw-bold">$5.449.200,00</span>
                                        </p>

                                        <p class="card-text fw-bold">COLOR</p>
                                        <p class="resumenP">
                                            <span>Blanco</span>
                                            <span class="dottedLine"></span>
                                            <span class="fw-bold">$0</span>
                                        </p>

                                        <p class="card-text fw-bold">TAPIZADO</p>
                                        <p class="resumenP">
                                            <span>Cuero</span>
                                            <span class="dottedLine"></span>
                                            <span class="fw-bold">$5.000,00</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center my-5">
                                <a class="btn btn-light me-4">Solicitar un testdrive</a>
                                <a class="btn btn-warning">Solicitar un asesor</a>
                            </div>

                            <!-- FIN RESUMEN -->

                        </div>

                    </div>
                    </li>
            </ul>
        </form>
    </div>

    <script type="text/javascript" src="Stepper.js"></script>
</asp:Content>
