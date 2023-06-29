<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="CargaVenta.aspx.cs" Inherits="concesionaria_autos.CargaVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1>Carga de Venta</h1>
        <div class="form-group">
            <label for="txtDNI">DNI:</label>
            <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />

        <div id="usuarioDetails" class="d-flex justify-content-center" runat="server" visible="false">
            <div class="card my-4" style="width: 50vw">
                <div class="row no-gutters">
                    <div class="col-sm-3 concesionaria-img-container">
                        <img class="card-img img-concesesionaria" src="https://myrenault.com.ar/vendor/template/assets/img/renault_black.svg" alt="Renault">
                    </div>
                    <div class="col-sm-9">
                        <div class="card-body">
                            <p class="text-muted"></p>
                            <div class="row">

                                <div class="col-sm-4">
                                    <h4 class="card-title">
                                        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                                        <asp:Label ID="lblApellidoUsuario" runat="server"></asp:Label>
                                    </h4>
                                    <h6 class="card-text">
                                        <asp:Label ID="lblDniUsuario" runat="server"></asp:Label>
                                    </h6>
                                    <div>
                                        <a href="#" target="_blank" class="linkCards me-4">ver perfil</a>
                                    </div>
                                </div>

                                <div class="col-sm-7 d-flex justify-content-center">
                                    <div>
                                        <p>
                                            <strong>Email:</strong>
                                            <asp:Label ID="lblEmailUsuario" runat="server"></asp:Label>
                                        </p>
                                        <p>
                                            <strong>Provincia:</strong>
                                            <asp:Label ID="lblProvinciaUsuario" runat="server"></asp:Label>
                                        </p>
                                        <p>
                                            <strong>Localidad:</strong>
                                            <asp:Label ID="lblLocalidadUsuario" runat="server"></asp:Label>
                                        </p>
                                    </div>
                                </div>

                            </div>
                            <hr />
                            <div class="row my-1 d-flex justify-content-center">
                                <div class="col-sm-4 ">
                                    <asp:Button ID="btnCargarVenta" runat="server" Text="Cargar Venta" CssClass="btn btn-warning px-5" OnClick="btnCargarVenta_Click" />
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <div id="usuarioNoEncontrado" runat="server" visible="false">
        <p>El usuario no fue encontrado.</p>
        <asp:Button ID="btnRegistrarse" runat="server" Text="Registrarse" CssClass="btn btn-primary" OnClick="btnRegistrarse_Click" />
    </div>
    </div>
</asp:Content>
