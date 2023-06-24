<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificarPerfil.aspx.cs" Inherits="concesionaria_autos.ModificarPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <br>
    <h2 class="subt"> MODIFICAR PERFIL </h2>
    <br>
    <div class="row">
        <div class="col-4"></div>
        <div class="col">
        <div class="mb-3">
                <label for="txtDni" class="form-label">Dni:</label>
                <br>
                <label for="txtDni" class="form-label"><%= dni() %></label>

            </div>
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
            </div>
            <div class="mb-3">
                <label for="txtProvincia" class="form-label">Provincia:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtProvincia" />
            </div>
            <div class="mb-3">
                <label for="txtLocalidad" class="form-label">Localidad:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtLocalidad" />
            </div>
            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
            </div>
            <div class="mb-3">
                <label for="txtClave" class="form-label">Clave:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtClave" type="password" />
            </div>



            <asp:Button Text="Confirmar" CssClass="btn btn-primary" runat="server" ID="btnConfirmar" OnClick="btnConfirmar_Click"/>

            <asp:Button Text="Cancelar" CssClass="btn btn-primary" runat="server" ID="btnCancelar" OnClick="btnCancelar_Click" />
        </div>
        <div class="col-4"></div>
    </div>

</asp:Content>
