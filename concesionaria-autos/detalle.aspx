<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="detalle.aspx.cs" Inherits="concesionaria_autos.detalle" %>

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
                <p>sentite cómodo con tu momento</p>
                <a href="/asesoramiento.aspx" class="linkDetail fw-bold">solicitar un asesor
                <i class="fa-solid fa-chevron-right"></i></a>
            </div>
            <div class="vl pe-4"></div>
            <div class="col-4">
                <h4 class="fw-bold">desde $<%:auto.Precio.ToString("N",new System.Globalization.CultureInfo("es-AR")) %></h4>
            </div>
        </div>

        <div class="row d-flex justify-content-between my-5">
            <%
                foreach (dominio.Descripcion desc in listaDescripcion)
                {
            %>
            <div class="card border-0 p-0" style="width: 23rem">
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
