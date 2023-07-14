<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="concesionaria_autos._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <video autoplay loop muted class="myvid" id="player">
                    <source src="./Videos/Banner.mp4" type="video/mp4">
                </video>
                <div class="financiacion">
                    <h1 id="video-banner" class="text-white">RENAULT STEPWAY</h1>
                    <h5 class="pb-4 text-white">hecha para los que hacen</h5>
                    <a class="btn btn-light fw-bold" href="detalle.aspx?id=3">descubrir más</a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


    <div class="container">
        <div class="row d-flex justify-content-around">
            <%
                foreach (dominio.Auto auto in ListaAutos)
                {
            %>
            <div class="allcard card border-0" style="width: 18rem">
                <img class="card-img-top" src="<%:auto.Imagen.ImagenUrl %>" alt="<%: auto.Nombre %>">
                <div class="card-body">
                    <h6 class="card-title text-uppercase fw-bold"><%: auto.Nombre %></h6>
                    <p class="card-text">desde $<%: auto.Precio.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></p>
                    <a href="/detalle.aspx?id=<%: auto.Id %>" class="linkCards me-4">descubrir</a>
                    <a href="/configuracion.aspx?id=<%: auto.Id %>" class="linkCards">configurar</a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>



</asp:Content>
