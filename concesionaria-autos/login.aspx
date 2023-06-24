<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="concesionaria_autos.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% if (Session["usuario"] == null)
        {%>
    <br>
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
    <%}
        else
        {
%>

    <br>



<h2 class="subt">PERFIL</h2>
<br>

<div class="row justify-content-center">
    <div class="col-4">
        <div class="form-floating mb-3 text-center">
            <input readonly class="form-control-plaintext" id="fltDni" value="<%= dni() %>">
            <label for="fltDni">Dni</label>
        </div>
        <div class="form-floating mb-3 text-center">
            <input readonly class="form-control-plaintext" id="fltApellido" value="<%= Apellido() %>">
            <label for="fltApellido">Apellido</label>
        </div>
        <div class="form-floating mb-3 text-center">
            <input readonly class="form-control-plaintext" id="fltNombre" value="<%= Nombre() %>">
            <label for="fltNombre">Nombre</label>
        </div>
        <div class="form-floating mb-3 text-center">
            <input readonly class="form-control-plaintext" id="fltProvincia" value="<%= Provincia() %>">
            <label for="fltProvincia">Provincia</label>
        </div>
        <div class="form-floating mb-3 text-center">
            <input readonly class="form-control-plaintext" id="fltLocalidad" value="<%= Localidad() %>">
            <label for="fltLocalidad">Localidad</label>
        </div>
        <div class="form-floating mb-3 text-center">
            <input readonly class="form-control-plaintext" id="fltEmail" value="<%= Email() %>">
            <label for="fltEmail">Email</label>
        </div>
        <asp:Button Text="Modificar Perfil" CssClass="btn btn-primary" runat="server" ID="btnModificar" OnClick="btnModificar_Click" />
    </div>
</div>

            <%}%>
</asp:Content>
