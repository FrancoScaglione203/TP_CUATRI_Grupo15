<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificarPerfil.aspx.cs" Inherits="concesionaria_autos.ModificarPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row justify-content-center mt-4">

        <div class="col-5 text-center">
            <h6 class="fw-bold my-3">MODIFICAR PERFIL</h6>

            <div class="row justify-content-center">
               
                <div class="form-floating mb-3">
                    <input for="txtDni" class="form-control" value="<%= dni() %>"/>
                    <label for="txtDni" class="form-label">Dni:</label>

                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" />
                    <label for="txtApellido" class="form-label">Apellido:</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
                    <label for="txtNombre" class="form-label">Nombre:</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtProvincia" />
                    <label for="txtProvincia" class="form-label">Provincia:</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtLocalidad" />
                    <label for="txtLocalidad" class="form-label">Localidad:</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
                    <label for="txtEmail" class="form-label">Email:</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtClave" type="password" />
                    <label for="txtClave" class="form-label">Clave:</label>
                </div>

                <asp:Button Text="Cancelar" CssClass="btn btn-primary w-25 p-3 mt-4 mb-2 me-2" runat="server" ID="btnCancelar" OnClick="btnCancelar_Click" />
                
                <asp:Button Text="Confirmar" CssClass="btn btn-warning w-25 p-3 mt-4 mb-2" runat="server" ID="btnConfirmar" OnClick="btnConfirmar_Click" />

                <asp:Button Text="Eliminar Cuenta" CssClass="btn btn-light border-0" runat="server" ID="btnEliminar" OnClick="btnEliminar_Click" />

            </div>
        </div>
    </div>


</asp:Content>
