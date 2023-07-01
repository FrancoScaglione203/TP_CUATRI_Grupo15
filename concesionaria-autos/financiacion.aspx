<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="financiacion.aspx.cs" Inherits="concesionaria_autos.financiacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="detail-img-container">
        <img class="detail-img" src="Imagenes/financiacion.jpg" alt="Financiacion" />
        <div class="financiacion">
            <h1 class="text-white fb-bold" style="font-size:3rem">SUSCRIBITE AHORA</h1>
            <h5 class="text-white pb-4">cuando quieras, donde quieras</h5>
            <a class="btn btn-light fw-bold" href="detalle.aspx?id=4">suscribite online</a>
        </div>
    </div>

    <div class="container">
        <h4 class="text-center fw-bold my-5">PLANES DE AHORRO VIGENTES</h4>
        <div class="row d-flex justify-content-around">
            <%
                foreach (dominio.Auto auto in ListaAutos)
                {
            %>
            <div class="allcard card border-0" style="width: 18rem">
                <img class="card-img-top" src="<%:auto.Imagen.ImagenUrl %>" alt="<%: auto.Nombre %>">
                <div class="card-body">
                    <h6 class="card-title text-uppercase fw-bold"><%: auto.Nombre %></h6>
                    <p class="card-text text-muted">100 Cuotas - 100% Financiado</p>
                    <p class="card-text">Cuota desde:<span class="card-title mx-1" style="font-size:1rem">$<%: auto.Financiacion().ToString("N",new System.Globalization.CultureInfo("es-AR")) %></span></p>
                    <a href="/financiacionDetalle.aspx?id=<%: auto.Id %>" class="btn btn-primary me-4">descubrir</a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

</asp:Content>
