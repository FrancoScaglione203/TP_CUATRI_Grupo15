<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="confirmar_pago.aspx.cs" Inherits="concesionaria_autos.confirmar_pago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <h4>Pago Realizado con Éxito</h4>
                            <p>Has realizado el pago de $<asp:Label ID="lblMontoPago" runat="server"></asp:Label> exitosamente.</p>
                            <p>Número de referencia: <asp:Label ID="lblReferenciaPago" runat="server"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
