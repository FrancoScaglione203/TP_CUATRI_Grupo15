<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Locales.aspx.cs" Inherits="concesionaria_autos.Locales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row mb-4">
        <img src="BannerLocales.jpg" alt="Exterior Renault DUSTER" />
    </div>

    <div class="container">
        <div class="row">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26314.12748536826!2d-58.555542575813504!3d-34.47077737304013!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bcb1c10c5576e9%3A0xbea6f2b999ffd3c9!2sRenault!5e0!3m2!1ses!2sar!4v1687830776813!5m2!1ses!2sar" width="800" height="600" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>

    <div class="d-flex justify-content-center my-4">
        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Ver todas las sucursales" />
    </div>

</asp:Content>
