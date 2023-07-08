<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="DetalleVenta.aspx.cs" Inherits="concesionaria_autos.DetalleVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <h6 class="fw-bold text-center my-3">Detalle de Cuotas</h6>
    <div class="row">
        <div class="d-flex justify-content-between">
            <div>
<%--                <a href="CargaVenta.aspx" class="btn btn-primary">Nueva Venta</a>--%>
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
    <asp:GridView ID="dgvCuotas" runat="server" DataKeyNames="ID"
        CssClass="table table-striped text-center" AutoGenerateColumns="false"
        OnSelectedIndexChanged="dgvCuotas_SelectedIndexChanged"
        OnPageIndexChanging="dgvCuotas_PageIndexChanging"
        AllowPaging="True" PageSize="10" 
        OnRowCommand="dgvCuotas_RowCommand" OnRowDataBound="dgvCuotas_RowDataBound">
        <Columns>
            <asp:BoundField HeaderText="Numero de Cuota" DataField="NumeroCuota" />
            <asp:BoundField HeaderText="Monto" DataField="Monto" DataFormatString="{0:C}" />
            <asp:BoundField HeaderText="Fecha de Vencimiento" DataField="FechaVencimiento" />
            <asp:CheckBoxField HeaderText="Pagada" DataField="Pagada" />
               
            <asp:TemplateField HeaderText="Confirmar Pago">
                <ItemTemplate>
                    <asp:Button ID="btnConfirmarPago" runat="server" CommandName="ConfirmarCancelarPago" CssClass="btn btn-primary"
                        OnClientClick="return confirm('¿Estás seguro de confirmar o cancelar el pago?');"
                        Text='<%# Convert.ToBoolean(Eval("Pagada")) ? "Cancelar Pago" : "Confirmar Pago" %>' />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

</asp:Content>
