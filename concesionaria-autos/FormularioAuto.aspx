<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="FormularioAuto.aspx.cs" Inherits="concesionaria_autos.FormularioAuto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-6">
             <h6 class="fw-bold my-3">DATOS</h6>
            <div class="form-floating my-3">
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                <label for="txtId" class="form-label">Id</label>
            </div>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                <label for="txtNombre" class="form-label">Nombre: </label>
                <asp:RequiredFieldValidator ID="RFValNombre" ControlToValidate="txtNombre" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar un nombre" />
            </div>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                <label for="txtPrecio" class="form-label">Precio: </label>
                <asp:RequiredFieldValidator ID="RFValPrecio" ControlToValidate="txtPrecio" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar un precio" />
                <asp:RegularExpressionValidator ID="REValPrecio" ControlToValidate="txtPrecio" runat="server" ValidationExpression="^\d+(\.\d+)?$" ErrorMessage="El campo Precio debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" />
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class=form-floating "mb-3">
                        <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                            AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                        <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                    </div>
                    <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png"
                        runat="server" ID="imgPokemon" Width="60%" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="form-floating mb-3">
                <a class="btn btn-primary" href="autos.aspx">Cancelar</a>
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-warning" OnClick="btnAceptar_Click" runat="server" ValidationGroup="FormData" CausesValidation="true" />
            </div>
        </div>

        <div class="col-6">
            <h6 class="fw-bold my-3">FICHA TÉCNICA</h6>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtPlazas" CssClass="form-control" />
                <label for="txtPlazas" class="form-label">Plazas: </label>
                <asp:RequiredFieldValidator ID="RFValPlazas" ControlToValidate="txtPlazas" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar la cantidad de plazas"/>
                <asp:RegularExpressionValidator ID="REValPlazas" ControlToValidate="txtPlazas" runat="server" ValidationExpression="^\d+$" ErrorMessage="El campo Plazas debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" />
            </div>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtLongitud" CssClass="form-control" />
                <label for="txtLongitud" class="form-label">Longitud: </label>
                <asp:RequiredFieldValidator ID="RFValLongitud" ControlToValidate="txtLongitud" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar la longitud" />
                <asp:RegularExpressionValidator ID="REValLongitud" ControlToValidate="txtLongitud" runat="server" ValidationExpression="^\d+$" ErrorMessage="El campo Longitud debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" />

            </div>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtAncho" CssClass="form-control" />
                <label for="txtAncho" class="form-label">Ancho: </label>
                <asp:RequiredFieldValidator ID="RFValAncho" ControlToValidate="txtAncho" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar el ancho"/>
                <asp:RegularExpressionValidator ID="REValAncho" ControlToValidate="txtAncho" runat="server" ValidationExpression="^\d+(\.\d+)?$" ErrorMessage="El campo Ancho debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" />
            </div>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtEjes" CssClass="form-control" />
                <label for="txtEjes" class="form-label">Ejes: </label>
                <asp:RequiredFieldValidator ID="RFValEjes" ControlToValidate="txtEjes" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar la cantidad de ejes" />
                <asp:RegularExpressionValidator ID="REValEjes" ControlToValidate="txtEjes" runat="server" ValidationExpression="^\d+$" ErrorMessage="El campo Ejes debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" />
            </div>
            <div class="form-floating mb-3">
                <asp:dropdownlist id="ddlCajaManual" runat="server" cssclass="form-select">
                    <asp:ListItem Text="Seleccionar una opción"></asp:ListItem>
                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:dropdownlist>
                <label for="ddlCajaManual" class="form-label">Caja Manual: </label>
                <asp:RequiredFieldValidator ID="RFValCajaManual" runat="server" ControlToValidate="ddlCajaManual" ErrorMessage="Campo obligatorio" CssClass="text-danger" ValidationGroup="FormData" />
            </div>
            <div class="form-floating mb-3">
                <asp:dropdownlist id="ddlCajaAutomatica" runat="server" cssclass="form-select">
                    <asp:ListItem Text="Seleccionar una opción" Value=""></asp:ListItem>
                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:dropdownlist>
                <label for="ddlCajaAutomatica" class="form-label">Caja Automática: </label>
                <asp:RequiredFieldValidator ID="RFValCajaAutomatica" runat="server" ControlToValidate="ddlCajaAutomatica" ErrorMessage="Campo obligatorio" CssClass="text-danger" ValidationGroup="FormData" />
            </div>
            <div class="form-floating mb-3">
                <asp:dropdownlist id="ddlNafta" runat="server" cssclass="form-select">
                    <asp:ListItem Text="Seleccionar una opción" Value=""></asp:ListItem>
                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:dropdownlist>
                <label for="ddlNafta" class="form-label">Nafta: </label>
                <asp:RequiredFieldValidator ID="RFValNafta" runat="server" ControlToValidate="ddlNafta" ErrorMessage="Campo obligatorio" CssClass="text-danger" ValidationGroup="FormData" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-light border-0" runat="server" />
                    </div>
                    <%if (ConfirmaEliminacion)
           
                        { %>
                        <div class="mb-3">
                            <asp:CheckBox Text="Confirmar Eliminación" ID="chkConfirmaEliminacion" runat="server" />
                            <asp:Button Text="Eliminar" ID="btnConfirmaEliminar" OnClick="btnConfirmaEliminar_Click" CssClass="btn btn-outline-danger " runat="server" />
                        </div>
                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>

             <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" ValidationGroup="FormData" />

        </div>
    </div>
</asp:Content>
