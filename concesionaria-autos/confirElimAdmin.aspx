<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="confirElimAdmin.aspx.cs" Inherits="concesionaria_autos.confirElimAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    
    <div class="row justify-content-center mt-4">

        <div class="col-5 text-center">

            <img class="my-3" src="https://myrenault.com.ar/vendor/template/assets/img/renault_black.svg" alt="Renault" style="height: 9em;" />

            <h6 class="fw-bold my-3">¿Estas seguro que deseas eliminar este usuario?</h6>

                <asp:Button Text="Confirmar" CssClass="btn btn-primary" runat="server" ID="btnConfirmar" OnClick="btnConfirmar_Click" />

    <asp:Button Text="Cancelar" CssClass="btn btn-primary" runat="server" ID="btnCancelar" OnClick="btnCancelar_Click" />
        </div>
    </div>



    
        <div class="col-4"></div>
    



</asp:Content>
