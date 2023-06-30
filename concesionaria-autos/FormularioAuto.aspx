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
            </div>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                <label for="txtPrecio" class="form-label">Precio: </label>
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
            <%--<div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo: </label>
                <asp:DropDownList ID="ddlTipo" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad</label>
                <asp:DropDownList ID="ddlDebilidad" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>--%>
            <div class="form-floating mb-3">
                <a class="btn btn-primary" href="autos.aspx">Cancelar</a>
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-warning" OnClick="btnAceptar_Click" runat="server" />
                <%--<asp:Button Text="Inactivar" ID="btnInactivar" OnClick="btnInactivar_Click" CssClass="btn btn-warning" runat="server" />--%>
            </div>
        </div>

        <div class="col-6">
            <h6 class="fw-bold my-3">FICHA TÉCNICA</h6>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtPlazas" CssClass="form-control" />
                <label for="txtPlazas" class="form-label">Plazas: </label>
            </div>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtLongitud" CssClass="form-control" />
                <label for="txtLongitud" class="form-label">Longitud: </label>
            </div>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtAncho" CssClass="form-control" />
                <label for="txtAncho" class="form-label">Ancho: </label>
            </div>
            <div class="form-floating mb-3">
                <asp:TextBox runat="server" ID="txtEjes" CssClass="form-control" />
                <label for="txtEjes" class="form-label">Ejes: </label>
            </div>
            <div class="form-floating mb-3">
                <asp:dropdownlist id="ddlCajaManual" runat="server" cssclass="form-select">
                    <asp:ListItem Text="Seleccionar una opción"></asp:ListItem>
                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:dropdownlist>
                <label for="ddlCajaManual" class="form-label">Caja Manual: </label>
            </div>
            <div class="form-floating mb-3">
                <asp:dropdownlist id="ddlCajaAutomatica" runat="server" cssclass="form-select">
                    <asp:ListItem Text="Seleccionar una opción"></asp:ListItem>
                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:dropdownlist>
                <label for="ddlCajaAutomatica" class="form-label">Caja Automática: </label>
            </div>
            <div class="form-floating mb-3">
                <asp:dropdownlist id="ddlNafta" runat="server" cssclass="form-select">
                    <asp:ListItem Text="Seleccionar una opción"></asp:ListItem>
                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:dropdownlist>
                <label for="ddlNafta" class="form-label">Nafta: </label>
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

        </div>
    </div>
</asp:Content>
