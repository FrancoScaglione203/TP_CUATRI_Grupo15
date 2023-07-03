﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="configuracion.aspx.cs" Inherits="concesionaria_autos.configuracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

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
                    <div class="step-content" style="height: 40em">
                        <div class="row justify-content-center">

                            <!-- VERSIONES -->
                            <asp:Repeater ID="RepeaterEquipamiento" runat="server">
                                <ItemTemplate>
                                    <div class="card border-0 mx-4" style="width: 22rem">
                                        <asp:Image class="card-img-top" ID="equipamientoBox" runat="server" />
                                        <img class="card-img-top" src="<%#Eval("Imagen").ToString() %>" alt="<%#Eval("Nombre") %>">
                                        <div class="card-body">
                                            <h6 class="card-title fw-bold"><%#Eval("Nombre") %></h6>
                                            <h6 class="card-text fw-bold">desde $<%#Eval("Precio") %></h6>
                                            <div class="hl2 pe-4 my-3"></div>
                                            <p class="py-2">Ver equipamiento destacado</p>
                                            <ul class="p-1">
                                                <li class="list-dot">Airbags laterales delanteros﻿</li>
                                                <li class="list-dot">Anclajes Isofix﻿﻿</li>
                                                <li class="list-dot">DRL LED C-shape﻿</li>
                                                <li class="list-dot">Levantacristales delanteros con comando eléctrico﻿</li>
                                            </ul>
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate runat="server">
                                                    <asp:Button CssClass="btn btn-warning w-100 my-2 fw-bold text-capitalize" ID="btnEquipamiento" runat="server" Text="Configurar" CommandArgument='<%#Eval("Id")%>' CommandName="VersionId" OnClick="btnEquipamiento_Click" AutoPostBack="false" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>

                            <!-- FIN VERSIONES -->

                        </div>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate runat="server">
                                <div class="step-actions">
                                    <%if (paso1 != 0)
                                        {%>
                                    <button class="waves-effect waves-dark btn next-step bg-black text-capitalize">Siguiente</button>
                                    <%}
                                        else
                                        { %>
                                    <button class="waves-effect waves-dark btn next-step bg-black text-capitalize" disabled>Siguiente</button>
                                    <%} %>
                                    <button class="waves-effect waves-dark btn-flat previous-step text-capitalize">Anterior</button>
                                </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </li>
                <li class="step">
                    <div class="step-title waves-effect waves-dark">Diseño Exterior</div>
                    <div class="step-content" style="height: 48em">
                        <div class="row">

                            <!-- EXTERIOR -->
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate runat="server">
                                    <asp:Image CssClass="configImg" ID="colorBox" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <%--<img class="configImg" src="<%: Color.ImagenUrl %>" alt="Auto">--%>

                            <div class="container ">
                                <div class="d-flex justify-content-center m-4">
                                    <asp:Repeater ID="RepeaterColor" runat="server">
                                        <ItemTemplate>
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate runat="server">
                                                    <asp:ImageButton class="color dot" ID="btnColor" runat="server" ImageUrl='<%#Eval("Muestra")%>' CommandArgument='<%#Eval("Id")%>' CommandName="ColorId" OnClick="btnColor_Click" AutoPostBack="false" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <%--<a class="color me-4">
                                                <img class="dot" src="<%#Eval("Muestra") %>" alt="<%#Eval("Nombre") %>" style="cursor: pointer;">
                                            </a>--%>
                                            <span class="ImagenUrl d-none"><%#Eval("ImagenUrl") %></span>
                                        </ItemTemplate>
                                    </asp:Repeater>
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
                                        img.src = "/Imagenes/" + contenido;
                                    });
                                }
                            </script>

                            <!-- FIN EXTERIOR -->
                        </div>

                        <asp:UpdatePanel runat="server">
                            <ContentTemplate runat="server">
                                <div class="step-actions">
                                    <%if (paso2 != 0)
                                        {%>
                                    <button class="waves-effect waves-dark btn next-step bg-black text-capitalize">Siguiente</button>
                                    <%}
                                        else
                                        { %>
                                    <button class="waves-effect waves-dark btn next-step bg-black text-capitalize" disabled>Siguiente</button>
                                    <%} %>
                                    <button class="waves-effect waves-dark btn-flat previous-step text-capitalize">Anterior</button>
                                </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </li>

                <li class="step">
                    <div class="step-title waves-effect waves-dark">Diseño Interior</div>
                    <div class="step-content" style="height: 48em">
                        <div class="row">

                            <!-- INTERIOR -->
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate runat="server">
                                    <asp:Image CssClass="configImg2" ID="tapizadoBox" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <%--  <img class="configImg2" src="<%#Eval("ImagenUrl") %>" alt="Auto">--%>

                            <div class="container">
                                <div class="d-flex justify-content-center m-4">
                                    <asp:Repeater ID="RepeaterTapizado" runat="server">
                                        <ItemTemplate>
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate runat="server">
                                                    <asp:ImageButton class="tapizado dot" ID="btnTapizado" runat="server" ImageUrl='<%#Eval("Muestra")%>' CommandArgument='<%#Eval("Id")%>' CommandName="TapizadoId" OnClick="btnTapizado_Click" AutoPostBack="false" />
                                                    <%--  <a class="tapizado me-4">
                                                <img class="dot" src="<%#Eval("Muestra") %>" alt="<%#Eval("Nombre") %>" style="cursor: pointer;">
                                            </a>--%>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <span class="ImagenUrl2 d-none"><%#Eval("ImagenUrl") %></span>
                                        </ItemTemplate>
                                    </asp:Repeater>
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

                            <!-- FIN INTERIOR -->
                        </div>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate runat="server">
                                <div class="step-actions">
                                    <%if (paso3 != 0)
                                        {%>
                                    <button class="waves-effect waves-dark btn next-step bg-black text-capitalize">Siguiente</button>
                                    <%}
                                        else
                                        { %>
                                    <button class="waves-effect waves-dark btn next-step bg-black text-capitalize" disabled>Siguiente</button>
                                    <%} %>
                                    <button class="waves-effect waves-dark btn-flat previous-step text-capitalize">Anterior</button>
                                </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </li>

                <li class="step">
                    <div class="step-title waves-effect waves-dark">Equipamiento</div>
                    <div class="step-content" style="height: 60em">
                        <div class="row">

                            <!-- EQUIPAMIENTO -->

                            <div class="justify-content-center m-4">

                                <%
                                    foreach (dominio.FichaTecnica fichaTecnica in ListaFichaTecnica)
                                    {
                                %>
                                <div class="row justify-content-center py-3">Número de plazas</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica != null ? fichaTecnica.Plazas : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Longitud total</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica != null ? fichaTecnica.Longitud : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Ancho total</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica != null ? fichaTecnica.Ancho : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Distancia entre ejes</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica != null ? fichaTecnica.Ejes : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Caja Manual</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica != null ? (fichaTecnica.CajaManual == true ? "Si" : "No") : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Caja Automática</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica != null ? (fichaTecnica.CajaAutomatica == true ? "Si" : "No") : 0 %></div>

                                </div>

                                <div class="row justify-content-center py-3">Nafta</div>
                                <div class="d-flex justify-content-around text-center">
                                    <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica != null ? (fichaTecnica.Nafta == true ? "Si" : "No") : 0 %></div>

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
                    <div class="step-content" style="height: 40em">
                        <div class="row my-4">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate runat="server">
                                    <div class="d-flex justify-content-evenly align-content-center">

                                        <div class="resumem-img-container">
                                            <asp:Image class="resumen-img" ID="imageBox" runat="server" />
                                        </div>
                                        <div class="card p-4" style="width: 25rem;">
                                            <div class="card-body">
                                                <h6 class="card-subtitle my-2 text-muted">Precio</h6>
                                                <h5 class="card-title fw-bold"><%: Session["precioTotal"]%></h5>
                                                <div class="hl2 pe-4 my-3"></div>
                                                <h6 class="card-subtitle my-4 text-muted">Detalle del precio</h6>

                                                <p class="card-text fw-bold">VERSION</p>
                                                <p class="resumenP">
                                                    <span><%:Session["equipamientoNombre"]%></span>
                                                    <%-- <asp:Label ID="vNombre" runat="server" Text="Label"></asp:Label>--%>
                                                    <span class="dottedLine"></span>
                                                    <span><%:Session["equipamientoPrecio"]%></span>
                                                    <%--<asp:Label ID="vPrecio" runat="server" Text="Label"></asp:Label>--%>
                                                </p>

                                                <p class="card-text fw-bold">COLOR</p>
                                                <p class="resumenP">
                                                    <span><%:Session["colorNombre"]%></span>
                                                    <%--<asp:Label ID="cNombre" runat="server" Text="Label"></asp:Label>--%>
                                                    <span class="dottedLine"></span>
                                                    <span class="fw-bold">$0</span>
                                                </p>

                                                <p class="card-text fw-bold">TAPIZADO</p>
                                                <p class="resumenP">
                                                    <%--  <asp:Label ID="lblTapizadoPrecio" runat="server" Text="Label"></asp:Label>--%>
                                                    <span><%:Session["tapizadoNombre"]%></span>
                                                    <%-- <asp:Label ID="tNombre" runat="server" Text="Label"></asp:Label>--%>
                                                    <span class="dottedLine"></span>
                                                    <span><%:Session["tapizadoPrecio"]%></span>
                                                    <%--<asp:Label ID="tPrecio" runat="server" Text="Label"></asp:Label>--%>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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

    <script type="text/javascript" src="Scripts/Stepper.js"></script>
</asp:Content>
