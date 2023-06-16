<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="concesionaria_autos._default" %>

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

    <div class="card border-0" style="width: 18rem;">
        <img class="card-img-top" src="https://www.renault.com.ar/agg/vn/unique/ONE_DACIA_PP_LARGE_DENSITY1/r_brandSite_carPicker_1.png?uri=https%3A%2F%2Far.co.rplug.renault.com%2Fproduct%2Fmodel%2FL4M%2Flogan%2Fc%2FA-ENS_0MDL2P1SERIELIM4_" alt="Card image cap">
        <div class="card-body">
            <h6 class="card-title text-uppercase fw-bold">Logan</h6>
            <p class="card-text">desde $5.000.000</p>
            <a href="#" class="linkCards">descubrir</a>
        </div>
    </div>

    <asp:GridView runat="server" ID="dgvMarcas"></asp:GridView>

</asp:Content>
