<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="configuracion.aspx.cs" Inherits="concesionaria_autos.configuracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <%-- <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>--%>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<%--    <div class="d-flex justify-content-between">
        <div class="col">
            <a  class="btn btn-primary w-100 py-3">Versiones</a>
        </div>
        <div class="col">
            <a id="paso2" class="btn btn-primary w-100 py-3">Interior</a>
        </div>
        <div class="col">
            <a id="paso3" class="btn btn-primary w-100 py-3">Exterior</a>
        </div>
        <div class="col">
            <a id="paso4" class="btn btn-primary w-100 py-3">Equipamiento</a>
        </div>
        <div class="col bg-body-secondary">
            <a id="paso5" class="btn btn-primary w-100 py-3">Resumen</a>
        </div>
    </div>--%>

    <!-- VERSIONES -->
    <div id="contenido1" runat="server" visible="true">
        <div class="row justify-content-center my-4">
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
                            <asp:Button CssClass="btn btn-warning w-100 my-2 fw-bold text-capitalize" ID="btnEquipamiento" runat="server" Text="Configurar" CommandArgument='<%#Eval("Id")%>' CommandName="VersionId" OnClick="btnEquipamiento_Click" AutoPostBack="false" />

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <contenttemplate runat="server">
                <asp:Button ID="btnpaso1" runat="server" OnClick="btnpaso1_Click" CssClass="btn btn-warning w-100 my-2 fw-bold text-capitalize" Text="Siguiente" Visible="false"/>
            </contenttemplate>
        </div>

    </div>
    <!-- FIN VERSIONES -->

    <!-- EXTERIOR -->
    <div id="contenido2" runat="server" visible="false">

        <div class="row justify-content-center">

            <asp:UpdatePanel runat="server">
                <ContentTemplate runat="server">
                    <asp:Image CssClass="configImg" ID="colorBox" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="container ">
                <div class="d-flex justify-content-center m-4">
                    <asp:Repeater ID="RepeaterColor" runat="server">
                        <ItemTemplate>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate runat="server">
                                    <asp:ImageButton class="color dot" ID="btnColor" runat="server" ImageUrl='<%#Eval("Muestra")%>' CommandArgument='<%#Eval("Id")%>' CommandName="ColorId" OnClick="btnColor_Click" AutoPostBack="false" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
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

        </div>
    </div>
    <!-- FIN EXTERIOR -->


    <!-- INTERIOR -->

    <div id="contenido3" visible="false">
        <div class="row justify-content-center">

            <asp:UpdatePanel runat="server">
                <ContentTemplate runat="server">
                    <asp:Image CssClass="configImg2" ID="tapizadoBox" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="container">
                <div class="d-flex justify-content-center m-4">
                    <asp:Repeater ID="RepeaterTapizado" runat="server">
                        <ItemTemplate>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate runat="server">
                                    <asp:ImageButton class="tapizado dot" ID="btnTapizado" runat="server" ImageUrl='<%#Eval("Muestra")%>' CommandArgument='<%#Eval("Id")%>' CommandName="TapizadoId" OnClick="btnTapizado_Click" AutoPostBack="false" />

                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <span class="ImagenUrl2 d-none"><%#Eval("ImagenUrl") %></span>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
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

    <div id="contenido4">

        <!-- EQUIPAMIENTO -->

        <div class="justify-content-center">
            
            <asp:UpdatePanel runat="server">
                <ContentTemplate runat="server">
                    <asp:Image CssClass="configImg" ID="equipamientoBox" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>

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
    </div>

    <div id="contenido5" visible="false">
        <asp:UpdatePanel runat="server">
            <ContentTemplate runat="server">
                <div class="d-flex justify-content-evenly align-content-center my-4">

                    <div class="resumem-img-container">
                        <asp:Image class="resumen-img" ID="resumenBox" runat="server" />
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
    </div>

    <!-- FIN RESUMEN -->

   <%-- <script defer>

        $(document).ready(function () {

            $("#contenido2").hide();
            $("#contenido3").hide();
            $("#contenido4").hide();
            $("#contenido5").hide();
            $("#paso5").removeClass("btn btn-warning");
            $("#paso5").addClass("btn btn-primary");
            $("#paso1").addClass("btn btn-warning");

            $("#paso1").click(function () {
                $("#contenido1").show();
                $("#contenido2").hide();
                $("#contenido3").hide();
                $("#contenido4").hide();
                $("#contenido5").hide();
            });

             $("#paso2").click(function () {
                $("#contenido1").hide();
                $("#contenido2").show();
                $("#contenido3").hide();
                $("#contenido4").hide();
                $("#contenido5").hide();
                $("#paso1").removeClass("btn btn-warning");
                $("#paso1").addClass("btn btn-primary");
                $("#paso2").addClass("btn btn-warning");
             });

            $("#a2").click(function () {
                $("#contenido1").hide();
                $("#contenido2").show();
                $("#contenido3").hide();
                $("#contenido4").hide();
                $("#contenido5").hide();
            });

            $("#paso3").click(function () {
                $("#contenido1").hide();
                $("#contenido2").hide();
                $("#contenido3").show();
                $("#contenido4").hide();
                $("#contenido5").hide();
                $("#paso2").removeClass("btn btn-warning");
                $("#paso2").addClass("btn btn-primary");
                $("#paso3").addClass("btn btn-warning");
            });

            $("#paso4").click(function () {
                $("#contenido1").hide();
                $("#contenido2").hide();
                $("#contenido3").hide();
                $("#contenido4").show();
                $("#contenido5").hide();
                $("#paso3").removeClass("btn btn-warning");
                $("#paso3").addClass("btn btn-primary");
                $("#paso4").addClass("btn btn-warning");
            });

            $("#paso5").click(function () {
                $("#contenido1").hide();
                $("#contenido2").hide();
                $("#contenido3").hide();
                $("#contenido4").hide();
                $("#contenido5").show();
                $("#paso4").removeClass("btn btn-warning");
                $("#paso4").addClass("btn btn-primary");
                $("#paso5").addClass("btn btn-warning");
            });

        });
    </script>--%>

</asp:Content>
