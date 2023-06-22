<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="detalle.aspx.cs" Inherits="concesionaria_autos.detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="detail-img-container">
        <img class="detail-img" src="<%:listaImagenes[1].ImagenUrl %>" alt="<%:listaImagenes[1].Id %>">
    </div>

    <div class="container">
        <div class="d-flex justify-content-center my-4">
            <div class="col-8">
                <h2 class="text-uppercase fw-bold">Renault <%:auto.Nombre %></h2>
                <p>sentite cómodo con tu momento</p>
                <a href="/asesoramiento.aspx" class="linkDetail fw-bold">solicitar un asesor
                <i class="fa-solid fa-chevron-right"></i></a>
            </div>
            <div class="vl pe-4"></div>
            <div class="col-4">
                <h4 class="fw-bold">desde $<%:auto.Precio %></h4>
            </div>
        </div>
    </div>

</asp:Content>
