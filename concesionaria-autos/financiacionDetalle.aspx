<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="financiacionDetalle.aspx.cs" Inherits="concesionaria_autos.financiacionDetalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="detail-img-container">
        <img class="detail-img" src="<%:listaImagenes[1].ImagenUrl %>" alt="<%:listaImagenes[1].Id %>">
    </div>

    <div class="container">
        <div class="d-flex justify-content-center my-5">
            <div class="col-8">
                <h2 class="text-uppercase fw-bold">Renault <%:auto.Nombre %></h2>
                <p>100 CUOTAS - 100% FINANCIADO</p>
                <a href="/configuracion.aspx?id=<%: auto.Id %>" class="linkDetail fw-bold">configurar modelo
                <i class="fa-solid fa-chevron-right"></i></a>
            </div>
            <div class="vl pe-4"></div>
            <div class="col-4">
                <h4 class="fw-bold">cuota desde $<%:auto.Precio.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></h4>
                <a href="/Contactanos.aspx" class="btn btn-warning">solicitar un asesor</a>
            </div>
        </div>

        
    <div class="d-flex p-5 bg-light align-items-end">
        <div class="col-4">
            <img class="imagenFinanciacionDetalle" src="Imagenes/financiacion2.jpg"/>
        </div>
        <div class="col-4 cuotasDetalle px-5">
            <h5 class="fw-bold pb-2">Información del Plan</h5>
                 <p class="resumenP">
                    <span>Precio Público</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: precio.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
                <p class="resumenP">
                    <span>D.S. 3% Cuotas 2 a 20</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: ds.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
                <p class="resumenP">
                    <span>Gastos de entrega</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: gastoEntrega.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
                <p class="resumenP">
                    <span>Cuota Pura</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: cuotaPura.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
                <p class="resumenP">
                    <span>Gastos Administrativos</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: cuotaPura.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
 
        </div>
        <div class="col-4 px-5 cuotasDetalle">
            <h5 class="fw-bold pb-2">Detalle de cuotas</h5>
                <p class="resumenP">
                    <span>Cuota 1-20</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: cuota1A20.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
                <p class="resumenP">
                    <span>Cuota 21-40</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: cuota21A40.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
                <p class="resumenP">
                    <span>Cuota 41-20</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: cuota41A60.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
                <p class="resumenP">
                    <span>Cuota 61-80</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: cuota61A80.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
                <p class="resumenP">
                    <span>Cuota 81-100</span>
                    <span class="dottedLine"></span>
                    <span class="fw-bold">$<%: cuota81A100.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span>
                </p>
            </div>
        </div>
    </div>
    </div>


</asp:Content>
