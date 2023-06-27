<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Concesionarias.aspx.cs" Inherits="concesionaria_autos.Locales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row mb-4">
        <img src="BannerLocales.jpg" alt="Exterior Renault DUSTER" />
    </div>

    <div class="container">
        <div class="d-flex my-4">
            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button CssClass="btn btn-primary form-control w-25" ID="Button1" runat="server" Text="Buscar" />
        </div>

        <%--CARDS--%>
        <asp:Repeater ID="localesRepeater" runat="server">
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
                                <p class="text-muted me-2">Venta</p>
                                <p class="text-muted me-2">Servicio técnico</p>
                                <p class="text-muted me-2">Repuestos</p>
                            </div>

                            <div class="col-sm-4 d-flex justify-content-center">
                                <a href="/detalle.aspx?id=<%#Eval("Id") %>" class="btn btn-warning w-75">Ver sede</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>
