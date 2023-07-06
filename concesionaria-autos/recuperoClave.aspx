<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="recuperoClave.aspx.cs" Inherits="concesionaria_autos.recuperoClave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="row justify-content-center mt-4">

        <div class="col-5 text-center">

            <img class="my-3" src="https://myrenault.com.ar/vendor/template/assets/img/renault_black.svg" alt="Renault" />

            <h6 class="fw-bold my-3">Ingresar DNI para enviar mail de recuperacion de clave a su correo electronico</h6>

            <div class="form-floating my-3">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtDni" />
                <label for="txtDni" class="form-label">DNI</label>
            </div>

            

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <asp:Button Text="Enviar mail" CssClass="btn btn-warning w-50 p-3 mt-4 mb-2" runat="server" ID="btnEnviarMail" OnClick="btnEnviarMail_Click" />
    <br>
     <%if (!(Session["validacionDni"] == null))
        {%>
     <label for="txtClave2" class="form-label">DNI Invalido</label>
        <%}
        else
        {%>

      <%}%>

    </ContentTemplate>
</asp:UpdatePanel>
           
        </div>
    </div>


</asp:Content>
