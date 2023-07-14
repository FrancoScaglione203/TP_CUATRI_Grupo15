<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="ventaCargada.aspx.cs" Inherits="concesionaria_autos.ventaCargada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row justify-content-center my-4">

 <%--       <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
            <div>
                <asp:Image ID="resumenBox" runat="server" />
            </div>
        </div>--%>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
            <div class="resumen-card card p-4" style="width: 25rem;">
                <div class="card-body">
                    <h6 class="card-subtitle my-2 text-muted">
                        <asp:Label ID="lblModeloAuto" runat="server"></asp:Label></h6>
                    <h5 class="card-title fw-bold"></h5>
                    <div class="hl2 pe-4 my-3"></div>
                    <h6 class="card-subtitle my-4 text-muted">Detalle de la venta</h6>

                    <p class="card-text fw-bold"></p>
                    <p class="resumenP">
                        <span>DNI</span>
                        <span class="dottedLine"></span>
                        <span class="fw-bold">
                            <asp:Label ID="lblDNIComprador" runat="server"></asp:Label></span>
                    </p>

                    <p class="resumenP">
                        <span>MODELO</span>
                        <span class="dottedLine"></span>
                        <span class="fw-bold">
                            <asp:Label ID="lblVersionAuto" runat="server"></asp:Label></span>
                    </p>

                    <p class="card-text fw-bold"></p>
                    <p class="resumenP">
                        <span>CUOTAS</span>
                        <span class="dottedLine"></span>
                        <span class="fw-bold">
                            <asp:Label ID="lblCantidadCuotas" runat="server"></asp:Label></span>
                    </p>

                    <p class="card-text fw-bold"></p>
                    <p class="resumenP">
                        <span>COLOR</span>
                        <span class="dottedLine"></span>
                        <span class="fw-bold">
                            <asp:Label ID="lblColor" runat="server"></asp:Label></span>
                    </p>

                    <p class="card-text fw-bold"></p>
                    <p class="resumenP">
                        <span>TAPIZADO</span>
                        <span class="dottedLine"></span>
                        <span class="fw-bold">
                            <asp:Label ID="lblTapizado" runat="server"></asp:Label></span>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <%--    <div class="container">
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
        </div>--%>

</asp:Content>
