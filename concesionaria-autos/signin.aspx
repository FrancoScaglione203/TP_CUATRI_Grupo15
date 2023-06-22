﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="concesionaria_autos.signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br>
    <h2 class="subt">Registrate ingresando los datos pedidos a continuacion </h2>
    <br>
    <div class="row">
        <div class="col-4"></div>
        <div class="col">
            <div class="mb-3">
                <label for="txtDni" class="form-label">Dni:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtUsuario" />
            </div>
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TextBox5" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TextBox1" />
            </div>
            <div class="mb-3">
                <label for="txtProvincia" class="form-label">Provincia:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TextBox2" />
            </div>
            <div class="mb-3">
                <label for="txtLocalidad" class="form-label">Localidad:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TextBox3" />
            </div>
            <div class="mb-3">
                <label for="txtClave" class="form-label">Clave:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtClave" type="password" />
            </div>


          
            <asp:Button Text="Registrarse" CssClass="btn btn-primary" runat="server" ID="btnLogin" />
        </div>
        <div class="col-4"></div>
    </div>

</asp:Content>
