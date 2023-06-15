<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="concesionaria_autos.signin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <div class="row">
        <div class="col-4"></div>
        <div class="col">
            <div class="mb-3">
                <label for="txtUsuario" class="form-label">Nuevo Usuario</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtUsuario" />
            </div>
            <div class="mb-3">
                <label for="txtClave" class="form-label">Nueva Clave</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtClave" type="password" />
                

            </div>
            <asp:Button Text="Registrarse" CssClass="btn btn-primary" runat="server" ID="btnLogin" />
        </div>
        <div class="col-4"></div>
    </div>

</asp:Content>
