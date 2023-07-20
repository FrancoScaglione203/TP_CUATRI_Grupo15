<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="ConcesionariasAdmin.aspx.cs" Inherits="concesionaria_autos.ConcesionariasAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h6 class="fw-bold text-center my-3">LISTA CONCESIONARIAS</h6>
    <div class="row">
        <div class="d-flex justify-content-between">
            <div>
                <a href="FormularioConcesionaria.aspx" class="btn btn-primary">Nueva concesionaria</a>
                <asp:Button Text="Filtro Avanzado" CssClass="btn btn-primary" ID="btnFiltroAvanzado" runat="server" OnClick="btnFiltroAvanzado_Click" />

            </div>

            <div class="d-flex mb-3">
                <%--<asp:Label Text="Filtrar" runat="server" />--%>
                <asp:TextBox placeholder="Buscar" runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="filtro_TextChanged" />
            </div>

        </div>

        <%if (FiltroAvanzado)
            { %>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                    <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
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
                    <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" />
                </div>
            </div>
        </div>
        <%} %>
    </div>


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView OnRowCommand="dgvConcesionarias_RowCommand" ID="dgvConcesionarias" runat="server" DataKeyNames="Id"
                CssClass="table table-striped text-center" AutoGenerateColumns="false"
                OnSelectedIndexChanged="dgvConcesionarias_SelectedIndexChanged"
                OnPageIndexChanging="dgvConcesionarias_PageIndexChanging"
                AllowPaging="True" PageSize="10">
                <Columns>
                    <asp:ImageField HeaderText="Foto" DataImageUrlField="ImagenUrl" ControlStyle-Width="100" ControlStyle-Height="100" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Provincia" DataField="Provincia" />
                    <asp:BoundField HeaderText="Localidad" DataField="Localidad" />
                    <asp:BoundField HeaderText="Calle" DataField="Calle" />
                    <asp:BoundField HeaderText="Altura" DataField="Altura" />
                    <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="<i class='fas fa-edit'></i>" />
                    <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-primary py-1" />

                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
