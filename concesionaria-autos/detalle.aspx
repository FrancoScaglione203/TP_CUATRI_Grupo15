<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="detalle.aspx.cs" Inherits="concesionaria_autos.detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img class="card-img-top" src="https://cdn.group.renault.com/ren/ar/modelos/kangoo/ph2/kangoo-k61-ph2-desktop-header-002.jpg.ximg.mediumx2.webp/c9ee5e1b80.webp" alt="imagen">
    <div class="name-price-container">
        <div class="name-container">
            <h1 class="detail-car-title">
                <span class="HeroModel__titleElement">RENAULT KANGOO</span>
            </h1>
            <h5>
                <span class="HeroModel__titleElement">Recargado de proyectos</span>
            </h5>
            <h5>
                <a href="#">Solicitar asesor</a>
            </h5>
        </div>
        <div class="price-container">
            <div>
                <h6>Desde</h6>
            </div>
            <div>
                <h4>
                    <span class="price">$8.095.500</span>
                </h4>
            </div>
        </div>
    </div>

    <div class="equipamiento">
        <div class="foto">
            <img src="https://cdn.group.renault.com/ren/ar/modelos/kangoo/ph2/renault-kangoo-k61-ph2-interior-equipamiento-002.jpg.ximg.large.webp/ddaf4a96b7.webp" alt="Alternate Text" style="width:400px;" />
            <h4>
                <span class="price">Interior</span>
            </h4>
        </div>
        <div class="foto">
            <img src="https://cdn.group.renault.com/ren/ar/modelos/kangoo/ph2/kangoo-k61-ph2-interior-equipamiento-07.jpg.ximg.large.webp/5b19d46677.webp" alt="Alternate Text" style="width:400px;" />
            <h4>
                <span class="price">Interior</span>
            </h4>
        </div>
        <div class="foto">
            <img src="https://cdn.group.renault.com/ren/ar/modelos/kangoo/ph2/kangoo-k61-ph2-interior-equipamiento-08.jpg.ximg.xsmall.jpg/cdacd8fcf5.jpg" alt="Seguridad activa" style="width:400px;"/>
            <h4>
                <span class="price">Interior</span>
            </h4>
        </div>
    </div>




</asp:Content>
