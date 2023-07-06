<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="concesionaria_autos.Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Compras del usuario</h1>

        <div class="row">
           <asp:Repeater ID="rptCompras" runat="server" OnItemCommand="rptCompras_ItemCommand">
            <ItemTemplate>
                <div class="allcard card border-0" style="width: 18rem">
                    <img class="card-img-top" src="<%# Eval("UrlImagen") %>" alt="un auto">
                    <div class="card-body">
                        <h6 class="card-title text-uppercase fw-bold"><%# Eval("ModeloAuto") %></h6>
                        <p class="card-text"><%# Eval("ColorAuto") %> </p>
                        <asp:Button ID="btnVerPagos" runat="server" CssClass="linkCards me-4" Text="Ver Pagos" CommandName="VerPagos" CommandArgument='<%# Eval("IDVenta") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        </div>
    </div>
</asp:Content>
