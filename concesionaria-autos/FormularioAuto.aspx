<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="FormularioAuto.aspx.cs" Inherits="concesionaria_autos.FormularioAuto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-6">
            <h1 class="mb-3">Datos</h1>
            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre: </label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" AutoCompleteType="None" />
            </div>
            <div class="mb-3">
                <label for="txtPrecio" class="form-label">Precio: </label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                        <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                            AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
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
            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <a href="autos.aspx">Cancelar</a>
                <%--<asp:Button Text="Inactivar" ID="btnInactivar" OnClick="btnInactivar_Click" CssClass="btn btn-warning" runat="server" />--%>
            </div>
        </div>

        <div class="col-6">
            <h1 class="mb-3">Ficha Tecnica</h1>
            <div class="mb-3">
                <label for="txtPlazas" class="form-label">Plazas: </label>
                <asp:TextBox runat="server" ID="txtPlazas" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtLongitud" class="form-label">Longitud: </label>
                <asp:TextBox runat="server" ID="txtLongitud" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtAncho" class="form-label">Ancho: </label>
                <asp:TextBox runat="server" ID="txtAncho" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtEjes" class="form-label">Ejes: </label>
                <asp:TextBox runat="server" ID="txtEjes" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="ddlCajaManual" class="form-label">Caja Manual: </label>
                <asp:dropdownlist id="ddlCajaManual" runat="server" cssclass="form-select">
                    <asp:ListItem Text="Seleccionar una opción"></asp:ListItem>
                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:dropdownlist>
            </div>
            <div class="mb-3">
                <label for="ddlCajaAutomatica" class="form-label">Caja Automática: </label>
                <asp:dropdownlist id="ddlCajaAutomatica" runat="server" cssclass="form-select">
                    <asp:ListItem Text="Seleccionar una opción"></asp:ListItem>
                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:dropdownlist>
            </div>
            <div class="mb-3">
                <label for="ddlNafta" class="form-label">Nafta: </label>
                <asp:dropdownlist id="ddlNafta" runat="server" cssclass="form-select">
                    <asp:ListItem Text="Seleccionar una opción"></asp:ListItem>
                    <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:dropdownlist>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" runat="server" />
                    </div>

                    <%if (ConfirmaEliminacion)
                        { %>
                        <div class="mb-3">
                            <asp:CheckBox Text="Confirmar Eliminación" ID="chkConfirmaEliminacion" runat="server" />
                            <asp:Button Text="Eliminar" ID="btnConfirmaEliminar" OnClick="btnConfirmaEliminar_Click" CssClass="btn btn-outline-danger" runat="server" />
                        </div>
                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
</asp:Content>
