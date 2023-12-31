﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="detalle.aspx.cs" Inherits="concesionaria_autos.detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel runat="server">
        <ContentTemplate runat="server">
            <% if (listaImagenes.Count() > 1)
                {  %>
            <div class="detail-img-container">
                <img class="detail-img" src="<%:listaImagenes[1].ImagenUrl %>" alt="<%:listaImagenes[1].Id %>">
            </div>
            <% }
                else
                {  %>
            <div class="detail-img-container">
                <img class="detail-img" src="https://cdn.group.renault.com/ren/ar/modelos/kangoo/ph2/kangoo-k61-ph2-desktop-header-002.jpg.ximg.mediumx2.webp/c9ee5e1b80.webp" alt="Desc">
            </div>
            <% } %>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="container">
        <div class="d-flex justify-content-center my-5">
            <div class="col-8">
                <h2 class="text-uppercase fw-bold">Renault <%:auto.Nombre %></h2>
                <p>sentite cómodo con tu momento</p>
                <a href="/Contactanos.aspx" class="linkDetail fw-bold">solicitar un asesor
                <i class="fa-solid fa-chevron-right"></i></a>
            </div>
            <div id="vl-detalle" class="vl pe-4"></div>
            <div class="col-4">
                <h4 class="fw-bold">desde $<%:auto.Precio.ToString("N", new System.Globalization.CultureInfo("es-AR")) %></h4>
            </div>
        </div>

        <div class="row justify-content-around my-5">
            <%
                foreach (dominio.Descripcion desc in listaDescripcion)
                {
            %>
            <div class="desc-box card border-0" style="width: 23rem">
                <img class="card-img-top" src="<%: desc.ImagenUrl %>" alt="<%: desc.Titulo %>">
                <div class="card-body px-0">
                    <h4 class="card-title fw-bold"><%: desc.Titulo %></h4>
                     <div class="hl my-2"></div>
                    <p class="card-text"><%: desc.Bajada %></p>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>


</asp:Content>
