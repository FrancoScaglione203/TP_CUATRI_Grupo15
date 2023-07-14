<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="concesionaria_autos.Pagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
    <div class="container" id="Pagos">
        <div class="row py-4 g-5 align-items-center">
            <div class="col scrollable-cards">
                <div class="overflow-auto" style="max-height: 55vh;">
                    <asp:Repeater ID="rptCuotas" runat="server" OnItemDataBound="rptCuotas_ItemDataBound">
                        <ItemTemplate>
                            <div class="card mb-3">
                                <div class="card-header bg-black text-white">
                                    Cuota N° <%# Eval("NumeroCuota") %>
                                </div>
                                <div class="card-body">
                                    <h6 class="card-title fw-bold">Monto: $<%# Eval("Monto") %></h6>
                                    <p class="card-text my-1">Vencida: <%# ((DateTime)Eval("FechaVencimiento") < DateTime.Now) ? "Sí" : "No" %></p>
                                    <p class="card-text my-1">Fecha de Vencimiento: <%# ((DateTime)Eval("FechaVencimiento")).ToString("dd/MM/yyyy") %></p>
                                    <p class="d-flex justify-content-between card-text my-1">
                                        Pagada: <%# (bool)Eval("Pagada") ? "Sí" : "No" %>
                                        <span class="form-check-cuota form-check">
                                            <asp:CheckBox ID="chkCuota" runat="server" AutoPostBack="True" OnCheckedChanged="chkCuota_CheckedChanged" />
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body p-4 pagos">
                        <h6 class="card-title fw-bold">Datos Bancarios</h6>
                        <p class="card-text">Banco: BBVA BANCO FRANCÉS S.A.</p>
                        <p class="card-text">Número de cuenta: 204-87865/8</p>
                        <p class="card-text">CBU: 01702046600000087865</p>
                        <p class="card-text">Titular de la cuenta: Pedrito Renault</p>
                        <p class="card-text">Monto a pagar: $<asp:Label ID="lblMontoPago" runat="server"></asp:Label></p>
                        <div class="mb-3 d-flex align-items-center">
                            <label for="txtReferenciaPago" class="form-label me-2">Referencia:</label>
                            <input type="text" class="form-control" id="txtReferenciaPago" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="card my-3">
                    <div class="card-body p-4">
                        <h6 class="card-title fw-bold">Adjuntar comprobante</h6>
                        <input class="form-control" type="file" id="comprobantePago" accept="image/*" runat="server" />
                    </div>
                </div>
                <div class="alert alert-warning" role="alert">
                    <p class="card-text">Importante: Indique la referencia al realizar la transferencia para identificar su pago.</p>
                </div>
                <div class="text-center my-1">
                    <asp:Button ID="btnSubirPago" runat="server" Text="Subir pago" CssClass="btn btn-primary w-100" OnClick="btnSubirPago_Click" />
                    <div class="alert alert-danger mt-3" id="divError" runat="server" visible="false">
                        <strong>Error:</strong> Debe seleccionar al menos una cuota para realizar el pago.
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
