<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="restablecerClave.aspx.cs" Inherits="concesionaria_autos.restablecerClave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div class="row justify-content-center mt-4">

        <div class="col-5 text-center">

            <img class="my-3" src="https://myrenault.com.ar/vendor/template/assets/img/renault_black.svg" alt="Renault" />

            <h6 class="fw-bold my-3">Bienvenido a MY RENAULT</h6>
            <h6 class="fw-bold my-3">Donde quiera que vayas, disfrutá los beneficios</h6>

            <div class="form-floating my-3">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtClave1" type="password" />
                <label for="txtClave1" class="form-label">Contraseña</label>
            </div>
            <div class="form-floating my-3">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtClave2" type="password" />
                <label for="txtClave2" class="form-label">Reingresar Contraseña</label>
            </div>

            <asp:Button Text="Confirmar" CssClass="btn btn-warning w-50 p-3 mt-4 mb-2" runat="server" ID="btnConfirmar" onClick="btnConfirmar_Click"/>
            
        </div>
    </div>


</asp:Content>
