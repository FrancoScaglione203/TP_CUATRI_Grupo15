<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Concesionarias.aspx.cs" Inherits="concesionaria_autos.Locales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row mb-4">
        <img src="BannerLocales.jpg" alt="Exterior Renault DUSTER" />
    </div>

    <div class="container">
        <%-- <div class="row">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26314.12748536826!2d-58.555542575813504!3d-34.47077737304013!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bcb1c10c5576e9%3A0xbea6f2b999ffd3c9!2sRenault!5e0!3m2!1ses!2sar!4v1687830776813!5m2!1ses!2sar" width="800" height="600" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>

    <div class="d-flex justify-content-center my-4">
        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Ver todas las sucursales" />
    </div>--%>

        <div class="d-flex my-4">
            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button CssClass="btn btn-primary form-control w-25" ID="Button1" runat="server" Text="Buscar" />
        </div>

        <%--CARDS--%>

        <div class="card my-4">
            <div class="row no-gutters">
                <div class="col concesionaria-img-container">
                    <img class="card-img img-concesesionaria" src="https://lh5.googleusercontent.com/p/AF1QipND4fYyFlwH7qhoMI7ViHFDeQ8ALEitNGnuHqrm=w507-h240-k-no" alt="Renault">
                </div>
                <div class="col-sm-9">
                    <div class="card-body">
                        <p class="text-muted">CABA > Belgrano</p>
                        <div class="row">

                            <div class="col-sm-8">
                                <h5 class="card-title">Galante D'Antonio S.A</h5>
                                <p class="card-text">Renault Galante es uno de las sedes más grandes de la cadena y de Argentina.</p>
                                <a href="https://goo.gl/maps/uD7Es1rhG9JHnkpWA" target="_blank" class="linkCards me-4">como llegar</a>
                                <div>
                                </div>
                            </div>

                            <div class="col-sm-4 d-flex justify-content-center">
                                <div class="bg-light text-center p-2 w-75">
                                    <p class="m-0">
                                        Lunes a Viernes: 7 a 22 hs
                                    <p class="m-0">Sábados: 9 a 20 hs</p>
                                    <p class="m-0">Domingos y feriados: Cerrado</p>
                                </div>
                            </div>

                        </div>
                        <hr />
                        <div class="row my-1">

                            <div class="col-sm-8 d-flex">
                                <p class="text-muted me-2">Venta</p>
                                <p class="text-muted me-2">Servicio técnico</p>
                                <p class="text-muted me-2">Repuestos</p>
                            </div>

                            <div class="col-sm-4 d-flex justify-content-center">
                                <a href="/detalle.aspx?id=1" class="btn btn-warning w-75">Ver sede</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--FIN CARDS--%>

        <%--CARDS--%>

        <div class="card my-4">
            <div class="row no-gutters">
                <div class="col concesionaria-img-container">
                    <img class="card-img img-concesesionaria" src="https://lh5.googleusercontent.com/p/AF1QipPLXvVExbnjj4Hd7r-K00Qv0pkGDCaaKyVDuace=w408-h544-k-no" alt="Renault">
                </div>
                <div class="col-sm-9">
                    <div class="card-body">
                        <p class="text-muted">CABA > Belgrano</p>
                        <div class="row">

                            <div class="col-sm-8">
                                <h5 class="card-title">Galante D'Antonio S.A</h5>
                                <p class="card-text">Renault Galante es uno de las sedes más grandes de la cadena y de Argentina.</p>
                                <a href="https://goo.gl/maps/uD7Es1rhG9JHnkpWA" target="_blank" class="linkCards me-4">como llegar</a>
                                <div>
                                </div>
                            </div>

                            <div class="col-sm-4 d-flex justify-content-center">
                                <div class="bg-light text-center p-2 w-75">
                                    <p class="m-0">
                                        Lunes a Viernes: 7 a 22 hs
                                    <p class="m-0">Sábados: 9 a 20 hs</p>
                                    <p class="m-0">Domingos y feriados: Cerrado</p>
                                </div>
                            </div>

                        </div>
                        <hr />
                        <div class="row my-1">

                            <div class="col-sm-8 d-flex">
                                <p class="text-muted me-2">Venta</p>
                                <p class="text-muted me-2">Servicio técnico</p>
                                <p class="text-muted me-2">Repuestos</p>
                            </div>

                            <div class="col-sm-4 d-flex justify-content-center">
                                <a href="/detalle.aspx?id=1" class="btn btn-warning w-75">Ver sede</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--FIN CARDS--%>

        <%--CARDS--%>

        <div class="card my-4">
            <div class="row no-gutters">
                <div class="col concesionaria-img-container">
                    <img class="card-img img-concesesionaria" src="https://lh5.googleusercontent.com/p/AF1QipMiLdbRc0UbEDXirmvdLx7zizPxMxHJ4itIrBgE=w408-h544-k-no" alt="Renault">
                </div>
                <div class="col-sm-9">
                    <div class="card-body">
                        <p class="text-muted">CABA > Belgrano</p>
                        <div class="row">

                            <div class="col-sm-8">
                                <h5 class="card-title">Galante D'Antonio S.A</h5>
                                <p class="card-text">Renault Galante es uno de las sedes más grandes de la cadena y de Argentina.</p>
                                <a href="https://goo.gl/maps/uD7Es1rhG9JHnkpWA" target="_blank" class="linkCards me-4">como llegar</a>
                                <div>
                                </div>
                            </div>

                            <div class="col-sm-4 d-flex justify-content-center">
                                <div class="bg-light text-center p-2 w-75">
                                    <p class="m-0">
                                        Lunes a Viernes: 7 a 22 hs
                                    <p class="m-0">Sábados: 9 a 20 hs</p>
                                    <p class="m-0">Domingos y feriados: Cerrado</p>
                                </div>
                            </div>

                        </div>
                        <hr />
                        <div class="row my-1">

                            <div class="col-sm-8 d-flex">
                                <p class="text-muted me-2">Venta</p>
                                <p class="text-muted me-2">Servicio técnico</p>
                                <p class="text-muted me-2">Repuestos</p>
                            </div>

                            <div class="col-sm-4 d-flex justify-content-center">
                                <a href="/detalle.aspx?id=1" class="btn btn-warning w-75">Ver sede</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--FIN CARDS--%>
    </div>


</asp:Content>
