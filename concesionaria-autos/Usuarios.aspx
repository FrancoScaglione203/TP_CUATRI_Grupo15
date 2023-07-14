<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="concesionaria_autos.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <h6 class="fw-bold text-center my-3">LISTA USUARIOS</h6>
    <div class="row">
        <div class="d-flex justify-content-between">
            <div>
                <a href="signin.aspx" class="btn btn-primary">Nuevo usuario</a>
                <asp:Button Text="Filtro Avanzado" CssClass="btn btn-primary" ID="btnFiltroAvanzado" runat="server" OnClick="btnFiltroAvanzado_Click" />
            </div>

            <div class="d-flex mb-3">
                 <%--<asp:Label Text="Filtrar" runat="server" />--%>
                <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="filtro_TextChanged" placeholder="Buscar"/>
            </div>

        </div>
   
        <%if (FiltroAvanzado)
            { %>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                    <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" id="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                        <asp:ListItem Text="Nombre" />
                        <%--<asp:ListItem Text="Tipo" />
                        <asp:ListItem Text="Número" />--%>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Criterio" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Filtro" runat="server" />
                    <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Estado" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                        <asp:ListItem Text="Todos" />
                        <asp:ListItem Text="Activo" />
                        <asp:ListItem Text="Inactivo" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" id="btnBuscar" OnClick="btnBuscar_Click"/>
                </div>
            </div>
        </div>
        <%} %>
    </div>
    <asp:GridView ID="dgvUsuarios" runat="server" DataKeyNames="Id"
        CssClass="table table-striped text-center" AutoGenerateColumns="false"
        OnSelectedIndexChanged="dgvUsuarios_SelectedIndexChanged"
        OnPageIndexChanging="dgvUsuarios_PageIndexChanging"
        AllowPaging="True" PageSize="10">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
            <asp:BoundField HeaderText="DNI" DataField="DNI" />
            <asp:BoundField HeaderText="Email" DataField="Email" />
            <asp:BoundField HeaderText="Provincia" DataField="Provincia" />
            <asp:BoundField HeaderText="Localidad" DataField="Localidad" />
            <asp:BoundField HeaderText="Tipo de usuario" DataField="TipoUsuario" />
            <asp:CheckBoxField headerText="Activo" DataField="Activo" />
            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="<i class='fas fa-edit'></i>" />
        </Columns>
    </asp:GridView>

</asp:Content>
