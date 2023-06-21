﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="concesionaria_autos._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="Imagenes/banner1.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="Imagenes/banner2.png" class="d-block w-100" alt="...">
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

          <div class="d-flex justify-content-center my-4" >
            <a href="/comparacion.aspx" class="btn btn-primary">Comparar modelos</a>
            </div>

        <div class="row d-flex justify-content-around">
            <%
                foreach (dominio.Auto auto in ListaAutos)
                { 
            %>
            <div class="card border-0" style="width: 18rem">
                <img class="card-img-top" src="<%:auto.Imagen.ImagenUrl %>" alt="<%: auto.Nombre %>">
                <div class="card-body">
                    <h6 class="card-title text-uppercase fw-bold"><%: auto.Nombre %></h6>
                    <p class="card-text">desde $<%: auto.Precio %></p>
                    <a href="/detalle.aspx" class="linkCards me-4">descubrir</a>
                    <a href="/configuracion.aspx" class="linkCards">configurar</a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

  

</asp:Content>
