<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="cargaVentaUsuario.aspx.cs" Inherits="concesionaria_autos.cargaVentaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h6 class="fw-bold text-center my-3">CARGAR VENTA</h6>
        <div class="row py-3">
            <div class="col-md-6">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    <label class="form-label" for="txtNombre">Nombre:</label>
                </div>

                <div class="form-floating mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    <label for="txtEmail">Email:</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlModelo" CssClass="form-select" runat="server" OnSelectedIndexChanged="ddlModelo_SelectedIndexChanged" OnDataBound="ddlModelo_DataBound" AutoPostBack="True"></asp:DropDownList>
                    <label for="ddlModelo" class="form-label">Modelo del Auto: </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlColor" CssClass="form-select" runat="server" Enabled="false" OnDataBound="ddlColor_DataBound"></asp:DropDownList>
                    <label for="ddlColor" class="form-label">Color del Auto: </label>
                </div>
                <!-- Otros campos del usuario -->
            </div>
            <div class="col-md-6">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    <label for="txtApellido">Apellido:</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    <label for="txtDni">Dni:</label>
                </div>

                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlVersion" CssClass="form-select" runat="server" Enabled="false" OnSelectedIndexChanged="ddlVersion_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                    <label for="ddlVersion" class="form-label">Versión del Auto: </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlTapizado" CssClass="form-select" runat="server">
                        <asp:ListItem Text="Selecciona un tipo de tapizado" Value="" disabled="disabled"></asp:ListItem>
                        <asp:ListItem Text="Cuero" Value="Cuero"></asp:ListItem>
                        <asp:ListItem Text="Tela" Value="Tela"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlTapizado" class="form-label">Tapizado: </label>
                </div>
            </div>
            <div class="form-floating mb-3">
                <asp:DropDownList ID="ddlCuotas" CssClass="form-select" runat="server" OnDataBound="ddlCuotas_DataBound"></asp:DropDownList>
                <label for="ddlCuotas" class="form-label">Cantidad de cuotas</label>
            </div>
        </div>
        <div class="row my-4">
            <div class="d-flex justify-content-center">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-light me-2" OnClick="btnCancelar_Click" />
                <asp:Button ID="btnCargarVenta" runat="server" Text="Cargar Venta" CssClass="btn btn-warning" OnClick="btnCargarVenta_Click" />
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
