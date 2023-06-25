<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ConfirElimin.aspx.cs" Inherits="concesionaria_autos.ConfirElimin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="subt"> Estas seguro que deseas eliminar tu usuario? </h2>
    <br>
    <div class="row">
        <div class="col-4"></div>
        <div class="col">


            <asp:Button Text="Confirmar" CssClass="btn btn-primary" runat="server" ID="btnConfirmar" OnClick="btnConfirmar_Click"/>

            <asp:Button Text="Cancelar" CssClass="btn btn-primary" runat="server" ID="btnCancelar" OnClick="btnCancelar_Click" />

        </div>
        <div class="col-4"></div>
    </div>

</asp:Content>
