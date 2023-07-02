<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contactanos.aspx.cs" Inherits="concesionaria_autos.Contactanos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="detail-img-container">
        <img class="detail-img" src="Imagenes/contacto.jpg" alt="Financiacion" />
        <div class="financiacion">
            <h1 class="fb-bold text-white" style="font-size: 3rem">CONTACTANOS</h1>
            <h5 class="pb-4 text-white">siempre cerca tuyo</h5>
            <a class="btn btn-light fw-bold" href="detalle.aspx?id=4">solicitar asesor</a>
        </div>
    </div>

    <div class="container">
        <h4 class="text-center fw-bold mt-5">SERVICIO ATENCIÓN AL CLIENTE</h4>
        <h4 class="text-center fw-bold ">0800-333-7362</h4>
        <div class="row d-flex text-center mt-4">
            <p><span class="fw-bold me-2">Horario de atención:</span>lunes a viernes de 9:00 hs. a 21:00 hs.</p>
            <p><span class="fw-bold me-2">Financiación:</span>contacte al 5077-2800 de lunes a viernes de 08 a 20 hs.</p>
        </div>
        <div class="row mt-5 justify-content-center">
            <div class="card border-0 p-0" style="width: 23rem">
                <img class="card-img-top" src="https://cdn.group.renault.com/ren/master/renault-new-cars/editorial/contact-us/renault-contact-us-001.jpg.ximg.large.webp/291e2e828e.webp" alt="">
                <div class="card-body px-0">
                    <h4 class="card-title fw-bold">teléfono o chat en vivo</h4>
                    <div class="hl my-2"></div>
                    <p class="card-text text-start">Podés contactar a nuestros equipos de Asistencia a clientes al 0800-333-7362 de 9 a.m. a 21 p.m. de lunes a viernes.</p>
                </div>
            </div>
            <div class="card border-0 p-0 mx-5" style="width: 23rem">
                <img class="card-img-top" src="https://cdn.group.renault.com/ren/master/renault-new-cars/editorial/contact-us/renault-contact-us-002.jpg.ximg.large.webp/6a17df3180.webp" alt="">
                <div class="card-body px-0">
                    <h4 class="card-title fw-bold">correo electrónico</h4>
                    <div class="hl my-2"></div>
                    <p class="card-text text-start">Puedes escribirnos de las siguientes maneras:</p>
                    <p class="card-text">correo electrónico: <a class="text-dark fw-bold" href="#">src-renault.argentina@renault.com</a></p>
                    <p class="card-text">correo postal:  Fray Justo Sta. María de Oro 1744, C1414DBB CABA</p>
                </div>
            </div>
            <div class="card border-0 p-0" style="width: 23rem">
                <img class="card-img-top" src="https://cdn.group.renault.com/ren/master/renault-new-cars/editorial/contact-us/renault-contact-us-003.jpg.ximg.large.webp/0edcff864e.webp" alt="">
                <div class="card-body px-0">
                    <h4 class="card-title fw-bold">redes sociales</h4>
                    <div class="hl my-2"></div>
                    <p class="card-text">Contáctanos directamente a través de nuestras redes sociales Renault: <a class="text-dark fw-bold" href="#">Facebook</a>,  <a class="text-dark fw-bold" href="#">Twitter</a>,  <a class="text-dark fw-bold" href="#">Instagram</a>, etc.</p>
                </div>
            </div>
        </div>
        <div class="row m-5 justify-content-center text-center">
            <h5 class="fw-bold mt-5">Contactanos</h5>
             <div class="form-floating my-3">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
                <label for="txtNombre" class="form-label">Nombre</label>
            </div>
            <div class="form-floating my-3">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
                <label for="txtEmail" class="form-label">Email</label>
            </div>
            <div class="form-floating my-3">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtAsunto" />
                <label for="txtAsunto" class="form-label">Asunto</label>
            </div>
            <div class="form-floating my-3">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtConsulta" TextMode="MultiLine" Style="height: 6em;" />
                <label for="txtConsulta" class="form-label">Consulta</label>
            </div>
            <asp:Button Text="Enviar" CssClass="btn btn-warning w-50 py-2 mt-4 mb-2" runat="server" ID="btnEnviarConsulta" onClick="btnEnviarConsulta_Click"/>
        </div>

    </div>
</asp:Content>
