<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="concesionaria_autos.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% if (Session["usuario"] == null)
        {%>
    <div class="row justify-content-center mt-4">

        <div class="col-5 text-center">

            <img class="my-3" src="https://myrenault.com.ar/vendor/template/assets/img/renault_black.svg" alt="Renault" />

            <h6 class="fw-bold my-3">Bienvenido a MY RENAULT</h6>
            <h6 class="fw-bold my-3">Donde quiera que vayas, disfrutá los beneficios</h6>

            <div class="form-floating my-3">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtDni" />
                <label for="txtDni" class="form-label">DNI</label>
            </div>
            <div class="form-floating my-3">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtClave" type="password" />
                <label for="txtClave" class="form-label">Contraseña</label>
            </div>

            <asp:Button Text="Ingresar" CssClass="btn btn-warning w-50 p-3 mt-4 mb-2" runat="server" ID="btnIngresar" OnClick="btnIngresar_Click" />
            <a class="nav-item nav-link" href="signin.aspx">
                <asp:Label ID="lblRegistro" runat="server" CssClass="btn btn-light w-50 p-3" Text="Todavía no estoy registrado" />
            </a>
        </div>
    </div>
    <%}
        else
        {
    %>

    <div class="row justify-content-center mt-4">

        <div class="col-5 text-center">
            <h6 class="fw-bold my-3">PERFIL</h6>

            <div class="row justify-content-center">

                <div class="form-floating mb-3">
                    <input readonly class="form-control-plaintext" id="fltDni" value="<%= dni() %>">
                    <label for="fltDni">Dni</label>
                </div>
                <div class="form-floating mb-3">
                    <input readonly class="form-control-plaintext" id="fltApellido" value="<%= Apellido() %>">
                    <label for="fltApellido">Apellido</label>
                </div>
                <div class="form-floating mb-3">
                    <input readonly class="form-control-plaintext" id="fltNombre" value="<%= Nombre() %>">
                    <label for="fltNombre">Nombre</label>
                </div>
                <div class="form-floating mb-3">
                    <input readonly class="form-control-plaintext" id="fltProvincia" value="<%= Provincia() %>">
                    <label for="fltProvincia">Provincia</label>
                </div>
                <div class="form-floating mb-3 ">
                    <input readonly class="form-control-plaintext" id="fltLocalidad" value="<%= Localidad() %>">
                    <label for="fltLocalidad">Localidad</label>
                </div>
                <div class="form-floating mb-3">
                    <input readonly class="form-control-plaintext" id="fltEmail" value="<%= Email() %>">
                    <label for="fltEmail">Email</label>
                </div>
                <asp:Button Text="Modificar Perfil" CssClass="btn btn-warning w-50 p-3 mt-4 mb-2" runat="server" ID="btnModificar" OnClick="btnModificar_Click" />

            </div>
        </div>
    </div>

    <%}%>
</asp:Content>
