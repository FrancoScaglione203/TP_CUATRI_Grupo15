<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="concesionaria_autos.Pagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="Pagos">
        <div class="row py-4 g-4 align-items-center">
            <div class="col scrollable-cards">
                <div class="overflow-auto" style="max-height: 60vh;">
                    <asp:Repeater ID="rptCuotas" runat="server" OnItemDataBound="rptCuotas_ItemDataBound">
                        <ItemTemplate>
                            <div class="card mb-3">
                                <div class="card-header">
                                    Cuota <%# Eval("NumeroCuota") %>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">Monto: $<%# Eval("Monto") %></h5>
                                    <p class="card-text">Vencida: <%# ((DateTime)Eval("FechaVencimiento") < DateTime.Now) ? "Sí" : "No" %></p>
                                    <p class="card-text">Fecha de Vencimiento: <%# ((DateTime)Eval("FechaVencimiento")).ToString("dd/MM/yyyy") %></p>
                                    <p class="card-text">Pagada: <%# (bool)Eval("Pagada") ? "Sí" : "No" %></p>
                                    <div class="form-check">
                                        <asp:CheckBox ID="chkCuota" runat="server" AutoPostBack="True" OnCheckedChanged="chkCuota_CheckedChanged" />
                                        <label class="form-check-label" for="chkCuota">
                                            Seleccionar
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">
                        <h6 class="card-title fw-bold">Datos Bancarios</h6>
                        <p class="card-text">Banco: BBVA BANCO FRANCÉS S.A.</p>
                        <p class="card-text">Número de cuenta: 204-87865/8</p>
                        <p class="card-text">CBU: 01702046600000087865</p>
                        <p class="card-text">Titular de la cuenta: Pedrito Renault</p>
                        <p class="card-text">Monto a pagar: $<asp:Label ID="lblMontoPago" runat="server"></asp:Label></p>
                        <p class="card-text">
                            Referencia:
                           <asp:Label ID="lblReferenciaPago" runat="server"></asp:Label>
                        </p>
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
                    <button type="button" class="btn btn-primary w-100">Subir pago</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
