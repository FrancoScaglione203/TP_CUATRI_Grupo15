<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="FormularioConcesionaria.aspx.cs" Inherits="concesionaria_autos.FormularioConcesionaria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h6 class="fw-bold text-center my-3">NUEVA CONCESIONARIA</h6>

    <div id="contenido1" runat="server" visible="true">
        <div class="row justify-content-center align-items-center m-4 text-center">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Image class="card-img-top" ImageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXXwt_SEgljCr7afJdT1Bd3A4XvfO3r1akdHVmo0cqfYpexQfryETseNoCzpRMSWcaQYs&usqp=CAU"
                            runat="server" ID="imgPokemon" Width="50%" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-6">
                <div class="form-floating my-3 d-none">
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                    <label for="txtId" class="form-label">Id</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    <label for="txtNombre" class="form-label">Nombre: </label>
                    <asp:RequiredFieldValidator ID="RFValNombre" ControlToValidate="txtNombre" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar un nombre" />
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtCalle" CssClass="form-control" />
                    <label for="txtCalle" class="form-label">Calle: </label>
                    <asp:RequiredFieldValidator ID="RFVaCalle" ControlToValidate="txtCalle" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar una calle" />
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtAltura" CssClass="form-control" />
                    <label for="txtAltura" class="form-label">Altura: </label>
                    <asp:RequiredFieldValidator ID="RFValAltura" ControlToValidate="txtAltura" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar un numero" />
                    <asp:RegularExpressionValidator ID="reAltura" runat="server" ControlToValidate="txtAltura" ErrorMessage="Debe ingresar números" ValidationExpression="[0-9]+" ForeColor="Red"> </asp:RegularExpressionValidator>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtLocalidad" CssClass="form-control" />
                    <label for="txtLocalidad" class="form-label">Localidad: </label>
                    <asp:RequiredFieldValidator ID="RFVaLocalidad" ControlToValidate="txtLocalidad" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar una localidad" />
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtProvincia" CssClass="form-control" />
                    <label for="txtProvincia" class="form-label">Provincia: </label>
                    <asp:RequiredFieldValidator ID="RFVaProvincia" ControlToValidate="txtProvincia" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar una localidad" />
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" />
                    <label for="txtDescripcion" class="form-label">Descripcion: </label>
                    <asp:RequiredFieldValidator ID="RFVaDescripcion" ControlToValidate="txtDescripcion" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar una descripcion" />
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtUrlMaps" CssClass="form-control" />
                    <label for="txtUrlMaps" class="form-label">Descripcion: </label>
                    <asp:RequiredFieldValidator ID="RFVaUrlMaps" ControlToValidate="txtUrlMaps" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar un link" />
                </div>


                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <div class="form-floating mb-3">
                            <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                            <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                            <asp:RequiredFieldValidator ID="RFImagenMain" ControlToValidate="txtImagenUrl" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar una imagen" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="d-flex justify-content-end">
                <a class="btn btn-primary me-2" href="ConcesionariasAdmin.aspx">Cancelar</a>
                <asp:Button Text="Guardar" ID="btnAceptar" CssClass="btn btn-warning" OnClick="btnAceptar_Click" runat="server" ValidationGroup="FormData" CausesValidation="true" AutoPostBack="false" />
            </div>

        </div>

        <div class="row d-none">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-light border-0" runat="server" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" ValidationGroup="FormData" />

            </div>
        </div>
    </div>

</asp:Content>
