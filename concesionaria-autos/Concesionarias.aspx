<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Concesionarias.aspx.cs" Inherits="concesionaria_autos.Locales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="detail-img-container">
        <img class="detail-img" src="Imagenes/concesionaria.jpg" alt="Concesionarias" />
        <div class="financiacion">
            <h1 class="fb-bold text-white">CONCESCIONARIAS</h1>
            <h5 class="pb-4 text-white">siempre cerca tuyo</h5>
        </div>
    </div>

    <div class="container">
        <div class="d-flex my-4">
            <asp:TextBox CssClass="form-control" ID="txtBuscar" runat="server"></asp:TextBox>
            <asp:Button CssClass="btn btn-primary form-control w-25" ID="btnBuscar" runat="server" Text="Buscar" OnClick="Button1_Click"/>
        </div>

        <%--CARDS--%>
        <asp:Repeater ID="outerRepeater" runat="server">
            <ItemTemplate>
                <div class="card my-4">
                    <div class="row no-gutters">
                        <div class="col concesionaria-img-container">
                            <img class="card-img img-concesesionaria" src="<%#Eval("ImagenUrl") %>" alt="Renault">
                        </div>
                        <div class="col-sm-9">
                            <div class="card-body">
                                <p class="text-muted"><%#Eval("Provincia") %> > <%#Eval("Localidad") %></p>
                                <div class="row">

                                    <div class="col-sm-8">
                                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                        <p class="card-text"><%#Eval("Descripcion") %></p>
                                        <a href="<%#Eval("MapsUrl") %>" target="_blank" class="linkCards me-4">como llegar</a>
                                        <div>
                                        </div>
                                    </div>

                                    <div class="col-sm-4 d-flex justify-content-center">
                                        <div class="bg-light text-center p-2 w-75">
                                            <p class="m-0">
                                                Lunes a Viernes: <%#Eval("SemanaAbre") %> a <%#Eval("SabadoCierra") %>
                                            hs
                                    <p class="m-0">Sábados: <%#Eval("SabadoAbre") %> a <%#Eval("SabadoCierra") %> hs</p>
                                            <p class="m-0">Domingos y feriados: Cerrado</p>
                                        </div>
                                    </div>

                                </div>
                                <hr />
                                <div class="row my-1">

                                    <div class="col-sm-8 d-flex">

                                        <% foreach (dominio.Servicios servicio in listaServicios)
                                            { %>
                                        <p class="text-muted me-2"><%:servicio.Nombre %></p>
                                        <% } %>
                                    </div>

                                    <div class="col-sm-4 d-flex justify-content-center">
                                        <a href="/detalle.aspx?id=<%#Eval("Id") %>" class="btn btn-warning w-75">Ver sede</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="hiddenID" runat="server" Value='<%# Eval("Id") %>' />
            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>
