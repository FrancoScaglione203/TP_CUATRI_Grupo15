<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="CargaVenta.aspx.cs" Inherits="concesionaria_autos.CargaVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <h1>Carga de Venta</h1>
    <div class="form-group">
        <label for="txtDNI">DNI:</label>
        <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
        <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />

    <div id="usuarioDetails" runat="server" visible="false">
        <h3>Datos del Usuario:</h3>
        <p><strong>Nombre:</strong> <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label></p>
        <p><strong>Apellido:</strong> <asp:Label ID="lblApellidoUsuario" runat="server"></asp:Label></p>
        <p><strong>Email:</strong> <asp:Label ID="lblEmailUsuario" runat="server"></asp:Label></p>
        <p><strong>DNI:</strong> <asp:Label ID="lblDniUsuario" runat="server"></asp:Label></p>
        <p><strong>Provincia:</strong> <asp:Label ID="lblProvinciaUsuario" runat="server"></asp:Label></p>
        <p><strong>Localidad:</strong> <asp:Label ID="lblLocalidadUsuario" runat="server"></asp:Label></p>


        

        <asp:Button ID="btnCargarVenta" runat="server" Text="Cargar Venta" CssClass="btn btn-primary" OnClick="btnCargarVenta_Click" />
    </div>
    <div id="usuarioNoEncontrado" runat="server" visible="false">
        <p>El usuario no fue encontrado.</p>
        <asp:Button ID="btnRegistrarse" runat="server" Text="Registrarse" CssClass="btn btn-primary" OnClick="btnRegistrarse_Click" />
    </div>
</div>
</asp:Content>
