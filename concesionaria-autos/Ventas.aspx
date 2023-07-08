<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="concesionaria_autos.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
     <h6 class="fw-bold text-center my-3">LISTA DE VENTAS</h6>
    <div class="row">
        <div class="d-flex justify-content-between">
            <div>
                <a href="CargaVenta.aspx" class="btn btn-primary">Nueva Venta</a>
                <asp:CheckBox Text="Filtro Avanzado"
                    CssClass="btn btn-primary" ID="chkAvanzado" runat="server"
                    AutoPostBack="true"
                    OnCheckedChanged="chkAvanzado_CheckedChanged" />
            </div>

            <div class="d-flex mb-3">
                <%--<asp:Label Text="Filtrar" runat="server" />--%>
                <asp:TextBox placeholder="Buscar" runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="filtro_TextChanged" />
            </div>

        </div>

        <%if (chkAvanzado.Checked)
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
    <asp:GridView ID="dgvVentas" runat="server" DataKeyNames="IDVenta"
        CssClass="table table-striped text-center" AutoGenerateColumns="false"
        OnSelectedIndexChanged="dgvVentas_SelectedIndexChanged"
        OnPageIndexChanging="dgvVentas_PageIndexChanging"
        AllowPaging="True" PageSize="10">
        <Columns>
            <asp:BoundField HeaderText="Dni Comprador" DataField="DniComprador" />
            <asp:BoundField HeaderText="Modelo Auto" DataField="ModeloAuto" />
            <asp:BoundField HeaderText="Color Auto" DataField="ColorAuto" />
            <asp:BoundField HeaderText="Version Auto" DataField="VersionAuto" />
            <asp:BoundField HeaderText="Cantidad Cuotas" DataField="CantidadCuotas" />
            <asp:BoundField HeaderText="Cuotas Pagadas" DataField="CuotasPagadas" />
            <asp:CommandField HeaderText="Ver Detalle" ShowSelectButton="true" SelectText="<i class='fas fa-edit'></i>" />
                

            <%--<asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:C}" />
            <asp:CheckBoxField HeaderText="Activo" DataField="Estado" />    
             />--%>
        </Columns>
    </asp:GridView>


</asp:Content>
