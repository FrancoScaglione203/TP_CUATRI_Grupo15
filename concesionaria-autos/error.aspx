<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="concesionaria_autos.error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row text-center mb-5">
        <div class="bg-black p-5 text-white">
            <h4 class="fw-bold p-4">¡UPS! LO SENTIMOS, LA PÁGINA QUE BUSCÁS NO ESTÁ DISPONIBLE</h4>
            <h6>...pero ya que estás aquí te proponemos descubrir nuestros vehículos</h6>
        </div>
    </div>
    <div class="container p-5">
        <div class="d-flex justify-content-center">
            <div class="col-6">
                <img src="https://cdn.group.renault.com/ren/ar/modelos/stepway/renault-sandero-stepway-b46-ph2-diseno-sandero-stepway-003.jpg.ximg.xsmall.jpg/c6cf15e209.jpg" alt="Kangoo Express" />
            </div>
            <div class="col-6">
                <h4>Renault Stepway</h4>
                <p>Sea cual sea el camino que elijas, estás a la altura.</p>
                <p>Su gran despeje del suelo y sus nuevos faros C-Shape le otorgan una actitud intrépida que junto a las luces LED traseras, trazan una línea que resalta el movimiento. Un auto diseñado a la altura de lo que te propongas .</p>
                <div class="d-flex justify-content-center">
                    <a class="btn btn-primary" href="https://localhost:44368/detalle.aspx?id=3">descubrilo</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
