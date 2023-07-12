<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="ventaCargada.aspx.cs" Inherits="concesionaria_autos.ventaCargada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h6 class="fw-bold text-center my-3">RESUMEN DE LA VENTA</h6>
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
        <div class="row">
            <div class="col-md-6">
                <strong>Color del Auto:</strong>
                <asp:Label ID="lblColor" runat="server"></asp:Label>
            </div>
            <div class="col-md-6">
                <strong>Tapizado del Auto:</strong>
                <asp:Label ID="lblTapizado" runat="server"></asp:Label>
            </div>
        </div>

        <hr />
    </div>
</asp:Content>
