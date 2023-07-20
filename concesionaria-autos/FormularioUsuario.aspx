<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="FormularioUsuario.aspx.cs" Inherits="concesionaria_autos.FormularioUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row justify-content-center mt-4">

        <div class="col-5 text-center">

            <%if (Session["usuarioNomApell"] != null)
                {%>
            <h6 class="fw-bold my-3"><%=Session["usuarioNomApell"]%></h6>
            <% }
                else
                {%>
            <h6 class="fw-bold my-3">Nuevo Usuario</h6>
            <%}%>

            <div class="row justify-content-center">

                <%if (Request.QueryString["id"] != null)
                    {%>
                <div class="form-floating mb-3">
                    <input for="txtDni" class="form-control" value="<%=dni()%>" disabled />
                    <label for="txtDni" class="form-label">Dni:</label>
                </div>
                <%}
                    else
                    {%>

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
                <%}%>

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

                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlTipoUsuario" runat="server">
                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                        <asp:ListItem Text="Normal" Value="Normal"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlTipoUsuario" class="form-label">Tipo Usuario: </label>
                </div>






                <a class="nav-item nav-link" href="login.aspx">
                    <asp:Label ID="lblCancelar" runat="server" CssClass="btn btn-light w-20 p-3" Text="Cancelar" />




                    <asp:Button Text="Confirmar" CssClass="btn btn-warning w-25 p-3 mt-4 mb-2" runat="server" ID="btnConfirmar" OnClick="btnConfirmar_Click" />


                    <asp:Button Text="Eliminar Cuenta" CssClass="btn btn-light border-1" runat="server" ID="btnEliminar" />
                </a>
            </div>
        </div>
    </div>


</asp:Content>
