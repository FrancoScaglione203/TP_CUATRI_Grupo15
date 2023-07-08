<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="concesionaria_autos.Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
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
                                <h6 class="card-title text-uppercase fw-bold" > <%# Eval("CuotasPagadas") %> de <%# Eval("CantidadCuotas") %> cuotas pagadas </h6>
                                <asp:Button ID="btnVerPagos" runat="server" CssClass="btn btn-warning me-4" Text="Ver Pagos" CommandName="VerPagos" CommandArgument='<%# Eval("IDVenta") %>' />
                            </div>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
        </div>
    </div>
</asp:Content>
