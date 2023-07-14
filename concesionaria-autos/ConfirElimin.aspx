<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ConfirElimin.aspx.cs" Inherits="concesionaria_autos.ConfirElimin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="row justify-content-center mt-4">

        <div class="col-5 text-center">

            <img class="my-3" src="https://myrenault.com.ar/vendor/template/assets/img/renault_black.svg" alt="Renault" style="height: 9em;" />

            <h6 class="fw-bold my-3">¿Estas seguro que deseas eliminar tu usuario?</h6>

                <asp:Button Text="Confirmar" CssClass="btn btn-primary" runat="server" ID="btnConfirmar" OnClick="btnConfirmar_Click" />

    <asp:Button Text="Cancelar" CssClass="btn btn-primary" runat="server" ID="btnCancelar" OnClick="btnCancelar_Click" />
        </div>
    </div>



    
        <div class="col-4"></div>
    

</asp:Content>
