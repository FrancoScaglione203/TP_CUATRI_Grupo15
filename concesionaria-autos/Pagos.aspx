<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="concesionaria_autos.Pagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="Pagos">
    <div class="row">
        <div class="col-md-6 scrollable-cards">
            <h2>Cuotas</h2>
            <div class="col-md-12 overflow-auto" style="max-height: 400px;">
                <% foreach (dominio.Cuota cuota in ListaCuotas) { %>    
                    <div class="card mb-3">
                        <div class="card-header">
                            Cuota <%: cuota.NumeroCuota %>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Monto: $<%: cuota.Monto.ToString("N", new System.Globalization.CultureInfo("es-AR")) %></h5>
                            <p class="card-text">Vencida: <%: (cuota.FechaVencimiento < DateTime.Now) ? "Sí" : "No" %></p>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="checkCuota<%: cuota.ID %>">
                                <label class="form-check-label" for="checkCuota<%: cuota.ID %>">
                                    Seleccionar
                                </label>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
        <div class="col-md-6">
        <h2>Opciones de Pago</h2>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Realizar Transferencia</h5>
                <p class="card-text">Realice una transferencia bancaria a la siguiente cuenta:</p>
                <p class="card-text">Banco: BBVA BANCO FRANCÉS S.A.></p>
                <p class="card-text">Número de cuenta: 204-87865/8</p>
                <p class="card-text">CBU: 01702046600000087865</p>
                <p class="card-text">Titular de la cuenta: Pedrito Renault</p>
                <p class="card-text">Monto a pagar: $<span id="montoPago"></span></p>
                <p class="card-text">Referencia: <span id="referenciaPago"></span></p>
                <p class="card-text">Importante: Indique la referencia al realizar la transferencia para identificar su pago.</p>
                <p class="card-text">Una vez realizada la transferencia, suba el comprobante de pago a continuación:</p>
                <input type="file" id="comprobantePago" accept="image/*">
                <button type="button" class="btn btn-primary">Pagar</button>
            </div>
        </div>
    </div>
    </div>
</div>
</asp:Content>
