<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="concesionaria_autos.signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row justify-content-center mt-4">
            <div class="text-center">
                <h6 class="fw-bold my-3">Ingresá tus datos </h6>


                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtDni" type="number" />
                    <label for="txtDni" class="form-label">
                        Dni
                                      <span class="d-flex">
                                          <asp:RequiredFieldValidator CssClass="d-block" ID="vDni" runat="server"
                                              ControlToValidate="txtDni"
                                              ErrorMessage="Debe ingresar un DNI"
                                              ForeColor="Red">
                                          </asp:RequiredFieldValidator>
                                          <asp:RegularExpressionValidator ID="reDni" runat="server" ControlToValidate="txtDni" ErrorMessage="Debe ingresar números"
                                              ValidationExpression="[0-9]+" ForeColor="Red"> 
                                          </asp:RegularExpressionValidator>
                                      </span>
                    </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" type="text" />
                    <label for="txtApellido" class="form-label">
                        Apellido
                    <asp:RequiredFieldValidator CssClass="d-block" ID="vApellido" runat="server"
                        ControlToValidate="txtApellido"
                        ErrorMessage="Debe ingresar un apellido"
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" type="text" />
                    <label for="txtNombre" class="form-label">
                        Nombre
                    <asp:RequiredFieldValidator CssClass="d-block" ID="vNombre" runat="server"
                        ControlToValidate="txtNombre"
                        ErrorMessage="Debe ingresar un nombre"
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtProvincia" type="text" />
                    <label for="txtProvincia" class="form-label">
                        Provincia
                    <asp:RequiredFieldValidator CssClass="d-block" ID="vProvincia" runat="server"
                        ControlToValidate="txtProvincia"
                        ErrorMessage="Debe ingresar una provincia"
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtLocalidad" type="text" />
                    <label for="txtLocalidad" class="form-label">
                        Localidad
                    <asp:RequiredFieldValidator CssClass="d-block" ID="vLocalidad" runat="server"
                        ControlToValidate="txtLocalidad"
                        ErrorMessage="Debe ingresar una provincia"
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" type="email" />
                    <label for="txtEmail" class="form-label">
                        Email
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
                        Contraseña
                            <asp:RequiredFieldValidator CssClass="d-block" ID="vClave" runat="server"
                                ControlToValidate="txtClave"
                                ErrorMessage="Debe ingresar una contraseña"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                    </label>
                </div>

                <asp:Button Text="Registrarme" CssClass="btn btn-warning w-50 p-3 mt-4 mb-2" runat="server" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" />

            </div>
        </div>
    </div>
</asp:Content>
