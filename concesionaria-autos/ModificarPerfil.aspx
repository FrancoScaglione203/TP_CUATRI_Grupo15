﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificarPerfil.aspx.cs" Inherits="concesionaria_autos.ModificarPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row justify-content-center mt-4">

        <div class="col-5 text-center">
            <h6 class="fw-bold my-3">MODIFICAR PERFIL</h6>

            <div class="row justify-content-center">

                <div class="form-floating mb-3">
                    <input for="txtDni" class="form-control" value="<%= dni() %>" disabled />
                    <label for="txtDni" class="form-label">Dni:</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" />
                    <label for="txtApellido" class="form-label">
                        Apellido:
                        <asp:RequiredFieldValidator CssClass="d-block" ID="vApellido" runat="server"
                            ControlToValidate="txtApellido"
                            ErrorMessage="Debe ingresar un apellido"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />

                    <label for="txtNombre" class="form-label">
                        Nombre:                    
                        <asp:RequiredFieldValidator CssClass="d-block" ID="vNombre" runat="server"
                            ControlToValidate="txtNombre"
                            ErrorMessage="Debe ingresar un nombre"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                    </label>

                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtProvincia" />
                    <label for="txtProvincia" class="form-label">
                        Provincia:
                        <asp:RequiredFieldValidator CssClass="d-block" ID="vProvincia" runat="server"
                            ControlToValidate="txtProvincia"
                            ErrorMessage="Debe ingresar una provincia"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtLocalidad" />
                    <label for="txtLocalidad" class="form-label">
                        Localidad:
                        <asp:RequiredFieldValidator CssClass="d-block" ID="vLocalidad" runat="server"
                            ControlToValidate="txtLocalidad"
                            ErrorMessage="Debe ingresar una localidad"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
                    <label for="txtEmail" class="form-label">
                        Email:
                        <span class="d-flex">
                            <asp:RequiredFieldValidator CssClass="d-block" ID="vEmail" runat="server"
                                ControlToValidate="txtEmail"
                                ErrorMessage="Debe ingresar un email"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="string" runat="server" ControlToValidate="txtEmail" ErrorMessage="Debe tener el formato de email"
                                ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </span>
                    </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtClave" type="password" />
                    <label for="txtClave" class="form-label">
                        Clave:
                        <asp:RequiredFieldValidator CssClass="d-block" ID="vClave" runat="server"
                            ControlToValidate="txtClave"
                            ErrorMessage="Debe ingresar una contraseña"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </label>
                </div>


                <a class="nav-item nav-link" href="login.aspx">
                    <asp:Label ID="lblCancelar" runat="server" CssClass="btn btn-light w-20 p-3" Text="Cancelar"  />
               



                <asp:Button Text="Confirmar" CssClass="btn btn-warning w-25 p-3 mt-4 mb-2" runat="server" ID="btnConfirmar" OnClick="btnConfirmar_Click" />


                <asp:Button Text="Eliminar Cuenta" CssClass="btn btn-light border-1" runat="server" ID="btnEliminar" OnClick="btnEliminar_Click" />
                     </a>
            </div>
        </div>
    </div>


</asp:Content>
