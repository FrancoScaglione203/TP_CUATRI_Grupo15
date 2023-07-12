<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="concesionaria_autos.Compras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <% if (ListaCompras.Count > 0)
            { %>
        <h1>Mis Compras</h1>

        <div class="row">
            <asp:Repeater ID="rptCompras" runat="server" OnItemCommand="rptCompras_ItemCommand">
                <ItemTemplate>
                    <div class="card border border-dark" style="width: 80%;">
                        <div class="row g-0">
                            <div class="col-md-6">
                                <img src="imagenes/<%# Eval("UrlImagen") %>" class="card-img" alt="un auto">
                            </div>
                            <div class="col-md-6">
                                <div class="card-body">
                                    <h4 class="card-title text-uppercase fw-bold"><%# Eval("ModeloAuto") %> <%# Eval("VersionAuto") %></h4>
                                    <h5 class="card-title text-uppercase fw-bold"><%# Eval("ColorAuto") %></h5>
                                    <h6 class="card-title text-uppercase fw-bold"><%# Eval("CuotasPagadas") %> de <%# Eval("CantidadCuotas") %> cuotas pagadas </h6>
                                    <asp:Button ID="btnVerPagos" runat="server" CssClass="btn btn-warning me-4" Text="Ver Pagos" CommandName="VerPagos" CommandArgument='<%# Eval("IDVenta") %>' />
                                </div>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
        <% }
            else
            { %>
        <div class="row text-center mb-5">
            <div class="bg-black p-5 text-white">
                <h4 class="fw-bold p-4">AUN NO HAS REALIZADO NINGUNA COMPRA</h4>
                <h6>...pero ya que estás aquí te proponemos descubrir nuestros vehículos</h6>
            </div>
        </div>
        <div class="container p-5">
            <div class="d-flex justify-content-center">
                <div class="col-6">
                    <img src="https://cdn.group.renault.com/ren/ar/modelos/stepway/renault-sandero-stepway-b46-ph2-diseno-sandero-stepway-003.jpg.ximg.xsmall.jpg/c6cf15e209.jpg" alt="Kangoo Express" />
                </div>
                <div class="col-6">
                    <h4>Renault Stepway</h4>
                    <p>Sea cual sea el camino que elijas, estás a la altura.</p>
                    <p>Su gran despeje del suelo y sus nuevos faros C-Shape le otorgan una actitud intrépida que junto a las luces LED traseras, trazan una línea que resalta el movimiento. Un auto diseñado a la altura de lo que te propongas .</p>
                    <div class="d-flex justify-content-center">
                        <a class="btn btn-primary" href="https://localhost:44368/detalle.aspx?id=3">descubrilo</a>
                    </div>
                </div>
            </div>
        </div>

        <% }  %>
    </div>
</asp:Content>
