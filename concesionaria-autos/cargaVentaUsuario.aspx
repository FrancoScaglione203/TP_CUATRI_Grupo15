<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="cargaVentaUsuario.aspx.cs" Inherits="concesionaria_autos.cargaVentaUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
            <h1>Carga de Venta - Usuario</h1>
            <div class="row">
                <div class="col-md-6">
                    
                    <div class="form-group">
                        <label for="txtNombre">Nombre:</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtEmail">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlModelo" class="form-label">Modelo del Auto: </label>
                        <asp:DropDownList ID="ddlModelo" CssClass="form-select" runat="server" OnSelectedIndexChanged="ddlModelo_SelectedIndexChanged" OnDataBound="ddlModelo_DataBound" AutoPostBack="True"></asp:DropDownList>
                    </div>
                    <!-- Otros campos del usuario -->
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="txtApellido">Apellido:</label>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtDni">Dni:</label>
                        <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="ddlVersion" class="form-label">Versión del Auto: </label>
                        <asp:DropDownList ID="ddlVersion" CssClass="form-select" runat="server" Enabled="false"></asp:DropDownList>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <h3>Detalles de Financiación</h3>
                    <div class="form-group">
                        <label for="ddlCuotas" class="form-label">Cantidad de cuotas: </label>
                        <asp:DropDownList ID="ddlCuotas" CssClass="form-select" runat="server" OnDataBound="ddlCuotas_DataBound"></asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="btnCargarVenta" runat="server" Text="Cargar Venta" CssClass="btn btn-primary" OnClick="btnCargarVenta_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" />
                    <asp:label id="lblError" runat="server"></asp:label>
                </div>
            </div>
        </div>
</asp:Content>
