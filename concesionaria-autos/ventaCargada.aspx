<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="ventaCargada.aspx.cs" Inherits="concesionaria_autos.ventaCargada" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
            <h1>Confirmación de Venta</h1>
            <hr />

            <h3>Detalles de la Venta</h3>
            <div class="row">
                <div class="col-md-6">
                    <strong>DNI del Comprador:</strong>
                    <asp:Label ID="lblDNIComprador" runat="server"></asp:Label>
                </div>
                <div class="col-md-6">
                    <strong>Modelo del Auto:</strong>
                    <asp:Label ID="lblModeloAuto" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <strong>Versión del Auto:</strong>
                    <asp:Label ID="lblVersionAuto" runat="server"></asp:Label>
                </div>
                <div class="col-md-6">
                    <strong>Cantidad de Cuotas:</strong>
                    <asp:Label ID="lblCantidadCuotas" runat="server"></asp:Label>
                </div>
            </div>
            
            <hr />

            <p>Venta cargada exitosamente.</p>
            <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" CssClass="btn btn-primary" />
        </div>
</asp:Content>
