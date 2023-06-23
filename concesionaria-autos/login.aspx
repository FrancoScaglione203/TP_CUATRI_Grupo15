<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="concesionaria_autos.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-4"></div>
        <div class="col">
            <div class="mb-3">
                <label for="txtDni" class="form-label">Dni:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtDni" />
            </div>
            <div class="mb-3">
                <label for="txtClave" class="form-label">Clave:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtClave" type="password" />
                <a class="nav-item nav-link" href="signin.aspx">
                    <asp:Label ID="lblRegistro" runat="server" CssClass="form-text" Text="Si no estas registrado haz click aqui" /></a>

            </div>
            <asp:Button Text="Ingresar" CssClass="btn btn-primary" runat="server" ID="btnIngresar" OnClick="btnIngresar_Click" />
        </div>
        <div class="col-4"></div>
    </div>

</asp:Content>
