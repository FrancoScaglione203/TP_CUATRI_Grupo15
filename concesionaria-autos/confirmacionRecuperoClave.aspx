﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="confirmacionRecuperoClave.aspx.cs" Inherits="concesionaria_autos.confirmacionRecuperoClave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="row justify-content-center mt-4">

        <div class="col-5 text-center">

            <img class="my-3" src="https://myrenault.com.ar/vendor/template/assets/img/renault_black.svg" alt="Renault" style="height:9em;"/>

            <h6 class="fw-bold my-3">Enviamos un mail a "<%= Session["confirMail"] %>"para que recuperes la contraseña</h6>

           
        </div>
    </div>


</asp:Content>
