<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeBehind="CargaAuto.aspx.cs" Inherits="concesionaria_autos.CargaAuto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--1.AUTOS--%>
    <div id="contenido1" runat="server" visible="true">
        <div class="d-flex justify-content-between">
            <div class="col">
                <a class="btn btn-warning w-100 py-3">Datos</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3" runat="server">Ficha Técnica</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Descripción</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Equipamiento</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Color</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Tapizado</a>
            </div>
        </div>
        <div class="row justify-content-center align-items-center m-4 text-center">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Image class="card-img-top filtroSinSeleccionar" ImageUrl="Imagenes/Logan.jpg"
                            runat="server" ID="imgPokemon" Width="50%" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-6">
                <div class="form-floating my-3 d-none">
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                    <label for="txtId" class="form-label">Id</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    <label for="txtNombre" class="form-label">Nombre: </label>
                    <!-- <asp:RequiredFieldValidator ID="RFValNombre" ControlToValidate="txtNombre" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar un nombre" /> -->
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                    <label for="txtPrecio" class="form-label">Precio: </label>
                    <!-- <asp:RequiredFieldValidator ID="RFValPrecio" ControlToValidate="txtPrecio" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar un precio" />
                    <asp:RegularExpressionValidator ID="REValPrecio" ControlToValidate="txtPrecio" runat="server" ValidationExpression="^\d+(\.\d+)?$" ErrorMessage="El campo Precio debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" /> -->
                </div>
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <div class="form-floating mb-3">
                            <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                            <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="d-flex justify-content-end">
                <a class="btn btn-primary me-2" href="autos.aspx">Cancelar</a>
                <asp:Button Text="Guardar" ID="btnAceptar" CssClass="btn btn-warning" OnClick="btnAceptar_Click" runat="server" ValidationGroup="FormData" CausesValidation="true" AutoPostBack="false" />
            </div>

        </div>

      <div class="row d-none">
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
    </div>
    <%-- FIN AUTOS--%>

     <%-- 2.FICHA TÉCNICA--%>
    <div id="contenido2" runat="server" visible="true">
        <div class="d-flex justify-content-between">
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Datos</a>
            </div>
            <div class="col">
                <a class="btn btn-warning w-100 py-3">Ficha Técnica</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Descripción</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Equipamiento</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Color</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Tapizado</a>
            </div>
        </div>
        <div class="row justify-content-center align-items-center m-4 text-center">
            <div class="col-6">
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtPlazas" CssClass="form-control" />
                    <label for="txtPlazas" class="form-label">Plazas: </label>
                    <!-- <asp:RequiredFieldValidator ID="RFValPlazas" ControlToValidate="txtPlazas" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar la cantidad de plazas" />
                    <asp:RegularExpressionValidator ID="REValPlazas" ControlToValidate="txtPlazas" runat="server" ValidationExpression="^\d+$" ErrorMessage="El campo Plazas debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" /> -->
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtLongitud" CssClass="form-control" />
                    <label for="txtLongitud" class="form-label">Longitud: </label>
                    <!-- <asp:RequiredFieldValidator ID="RFValLongitud" ControlToValidate="txtLongitud" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar la longitud" />
                    <asp:RegularExpressionValidator ID="REValLongitud" ControlToValidate="txtLongitud" runat="server" ValidationExpression="^\d+$" ErrorMessage="El campo Longitud debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" /> -->

                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtAncho" CssClass="form-control" />
                    <label for="txtAncho" class="form-label">Ancho: </label>
                    <!-- <asp:RequiredFieldValidator ID="RFValAncho" ControlToValidate="txtAncho" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar el ancho" />
                    <asp:RegularExpressionValidator ID="REValAncho" ControlToValidate="txtAncho" runat="server" ValidationExpression="^\d+(\.\d+)?$" ErrorMessage="El campo Ancho debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" /> -->
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtEjes" CssClass="form-control" />
                    <label for="txtEjes" class="form-label">Ejes: </label>
                    <!-- <asp:RequiredFieldValidator ID="RFValEjes" ControlToValidate="txtEjes" runat="server" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" ErrorMessage="Debe ingresar la cantidad de ejes" />
                    <asp:RegularExpressionValidator ID="REValEjes" ControlToValidate="txtEjes" runat="server" ValidationExpression="^\d+$" ErrorMessage="El campo Ejes debe ser un valor numérico" ValidationGroup="FormData" Display="Dynamic" CssClass="text-danger" /> -->
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlCajaManual" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar una opción"></asp:ListItem>
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlCajaManual" class="form-label">Caja Manual: </label>
                    <!-- <asp:RequiredFieldValidator ID="RFValCajaManual" runat="server" ControlToValidate="ddlCajaManual" ErrorMessage="Campo obligatorio" CssClass="text-danger" ValidationGroup="FormData" /> -->
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlCajaAutomatica" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar una opción" Value=""></asp:ListItem>
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlCajaAutomatica" class="form-label">Caja Automática: </label>
                    <!-- <asp:RequiredFieldValidator ID="RFValCajaAutomatica" runat="server" ControlToValidate="ddlCajaAutomatica" ErrorMessage="Campo obligatorio" CssClass="text-danger" ValidationGroup="FormData" /> -->
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlNafta" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar una opción" Value=""></asp:ListItem>
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlNafta" class="form-label">Nafta: </label>
                    <!-- <asp:RequiredFieldValidator ID="RFValNafta" runat="server" ControlToValidate="ddlNafta" ErrorMessage="Campo obligatorio" CssClass="text-danger" ValidationGroup="FormData" /> -->
                </div>
            </div>

            <div class="d-flex justify-content-end">
                <a class="btn btn-primary me-2" href="autos.aspx">Cancelar</a>
                <asp:Button Text="Guardar" ID="btnAceptarFichaTecnica" CssClass="btn btn-warning" OnClick="btnAceptarFichaTecnica_Click" runat="server" ValidationGroup="FormData" CausesValidation="true" AutoPostBack="false" />
            </div>

        </div>
    </div>
    <%-- FIN FICHA TÉCNICA--%>

    <%-- 3.DESCRIPCION --%>
     <div id="contenido3" runat="server" visible="true">
        <div class="d-flex justify-content-between">
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Datos</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Ficha Técnica</a>
            </div>
            <div class="col">
                <a class="btn btn-warning w-100 py-3">Descripción</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Equipamiento</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Color</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Tapizado</a>
            </div>
        </div>
         <%-- tarj1 --%>
         <div class="row justify-content-center align-items-center m-4 text-center">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Image class="filtroSinSeleccionar" ImageUrl="Imagenes/Logan.jpg"
                            runat="server" ID="imagenDesc1" Width="50%" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-6">
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtTitulo1" CssClass="form-control" />
                    <label for="txtTitulo1" class="form-label">Titulo</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtDescripcion1" CssClass="form-control" />
                    <label for="txtDescripcion1" class="form-label">Descripcion</label>
                </div>
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <div class="form-floating mb-3">
                            <asp:TextBox runat="server" ID="txtImagenDesc1" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenDesc1_TextChanged" />
                            <label for="txtImagenDesc1" class="form-label">Url Imagen</label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
                  <%-- tarj2--%>
         <div class="row justify-content-center align-items-center m-4 text-center">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:Image class="filtroSinSeleccionar" ImageUrl="Imagenes/Logan.jpg"
                            runat="server" ID="imagenDesc2" Width="50%" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-6">
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtTitulo2" CssClass="form-control" />
                    <label for="txtTitulo2" class="form-label">Titulo</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtDescripcion2" CssClass="form-control" />
                    <label for="txtDescripcion2" class="form-label">Descripcion</label>
                </div>
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <div class="form-floating mb-3">
                            <asp:TextBox runat="server" ID="txtImagenDesc2" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenDesc2_TextChanged" />
                            <label for="txtImagenDesc2" class="form-label">Url Imagen</label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
                  <%-- tarj3 --%>
         <div class="row justify-content-center align-items-center m-4 text-center">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:Image class="filtroSinSeleccionar" ImageUrl="Imagenes/Logan.jpg"
                            runat="server" ID="imagenDesc3" Width="50%" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-6">
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtTitulo3" CssClass="form-control" />
                    <label for="txtTitulo3" class="form-label">Titulo</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtDescripcion3" CssClass="form-control" />
                    <label for="txtDescripcion3" class="form-label">Descripcion</label>
                </div>
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                        <div class="form-floating mb-3">
                            <asp:TextBox runat="server" ID="txtImagenDesc3" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenDesc3_TextChanged" />
                            <label for="txtImagenDesc3" class="form-label">Url Imagen</label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

            <div class="d-flex justify-content-end">
                <a class="btn btn-primary me-2" href="autos.aspx">Cancelar</a>
                <asp:Button Text="Guardar" ID="btnAceptarDescripcion" CssClass="btn btn-warning" OnClick="btnAceptarDescripcion_Click" runat="server" ValidationGroup="FormData" CausesValidation="true" AutoPostBack="false" />
            </div>
    </div>

    <%-- DESCRIPCION --%>

     <%-- EQUIPAMIENTO --%>
    <div id="contenido4" runat="server" visible="true">
        <div class="d-flex justify-content-between">
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Datos</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Ficha Técnica</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Descripción</a>
            </div>
            <div class="col">
                <a class="btn btn-warning w-100 py-3">Equipamiento</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Color</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Tapizado</a>
            </div>
        </div>
        <div class="row justify-content-center align-items-center m-4 text-center">
            
            <div class="col-6">
                <%-- <div class="form-floating my-3">
                    <asp:TextBox runat="server" ID="txtIdEquip" CssClass="form-control" />
                    <label for="txtIdEquip" class="form-label">Id</label>
                </div>--%>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtVersion" CssClass="form-control" />
                    <label for="txtVersion" class="form-label">Versión</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtPrecioVersion" CssClass="form-control" />
                    <label for="txtPrecioVersion" class="form-label">Precio</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlClimatizador" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar una opción" Value=""></asp:ListItem>
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlClimatizador" class="form-label">Climatizador</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlSensorEstacionamiento" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar una opción" Value=""></asp:ListItem>
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlSensorEstacionamiento" class="form-label">Sensor de Estacionamiento</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlComputadora" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar una opción" Value=""></asp:ListItem>
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlComputadora" class="form-label">Computadora</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlControlCrucero" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar una opción" Value=""></asp:ListItem>
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlControlCrucero" class="form-label">Control Crucero</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:DropDownList ID="ddlAlarma" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Seleccionar una opción" Value=""></asp:ListItem>
                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <label for="ddlAlarma" class="form-label">Alarma</label>
                </div>
                <%-- <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtIdProdEquip" CssClass="form-control" />
                    <label for="txtIdProdEquip" class="form-label">Id Producto</label>
                </div>--%>
            </div>

            <div class="d-flex justify-content-end">
                <a class="btn btn-primary me-2" href="autos.aspx">Cancelar</a>
                <asp:Button Text="Guardar" ID="btnAceptarEquipamiento" CssClass="btn btn-warning" OnClick="btnAceptarEquipamiento_Click" runat="server" ValidationGroup="FormData" CausesValidation="true" AutoPostBack="false" />
            </div>

        </div>
    </div>

    <%-- COLOR  (Tiene más de un registro por auto) --%>

    <div id="contenido5" runat="server" visible="true">
        <div class="d-flex justify-content-between">
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Datos</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Ficha Técnica</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Descripción</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Equipamiento</a>
            </div>
            <div class="col">
                <a class="btn btn-warning w-100 py-3">Color</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Tapizado</a>
            </div>
        </div>
        <div class="row justify-content-center align-items-center m-4 text-center">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Image class="filtroSinSeleccionar" ImageUrl="Imagenes/Logan.jpg"
                            runat="server" ID="imagenColor" Width="50%" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-6">
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtColor" CssClass="form-control" />
                    <label for="txtColor" class="form-label">Color</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtImagenMuestraColor" CssClass="form-control"
                        AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                    <label for="txtImagenMuestraColor" class="form-label">Url Muestra</label>
                </div>
                <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                    <ContentTemplate>
                        <div class="form-floating mb-3">
                            <asp:TextBox runat="server" ID="txtImagenColor" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenColor_TextChanged" />
                            <label for="txtImagenColor" class="form-label">Url Color</label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--Se podria traer ya el ID del paso 1--%>
                <%--        <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtIdProductoColor" CssClass="form-control" />
                    <label for="txtIdProductoColor" class="form-label">Id Producto</label>
                </div>--%>
                <button class="btn btn-primary">Agregar otro</button>
            </div>

            <div class="d-flex justify-content-end">
                <a class="btn btn-primary me-2" href="autos.aspx">Cancelar</a>
                <asp:Button Text="Guardar" ID="btnAceptarColor" CssClass="btn btn-warning" OnClick="btnAceptarColor_Click" runat="server" ValidationGroup="FormData" CausesValidation="true" AutoPostBack="false" />
            </div>

        </div>
    </div>

    <%-- FIN COLOR --%>

    <%-- TAPIZADO  (Tiene más de un registro por auto) --%>

    <div id="contenido6" runat="server" visible="true">
        <div class="d-flex justify-content-between">
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Datos</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Ficha Técnica</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Descripción</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Equipamiento</a>
            </div>
            <div class="col">
                <a class="btn btn-primary w-100 py-3">Color</a>
            </div>
            <div class="col">
                <a class="btn btn-warning w-100 py-3">Tapizado</a>
            </div>
        </div>
        <div class="row justify-content-center align-items-center m-4 text-center">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:Image class="filtroSinSeleccionar" ImageUrl="Imagenes/Logan.jpg"
                            runat="server" ID="imagenTapizado" Width="50%" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="contenedorTapizado" runat="server">

            </div>
            <div class="col-6">
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtTapizado" CssClass="form-control" />
                    <label for="txtTapizado" class="form-label">Tapizado</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtImagenMuestraTapizado" CssClass="form-control"
                        AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                    <label for="txtImagenMuestraTapizado" class="form-label">Url Muestra</label>
                </div>
                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                    <ContentTemplate>
                        <div class="form-floating mb-3">
                            <asp:TextBox runat="server" ID="txtImagenTapizado" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenTapizado_TextChanged" />
                            <label for="txtImagenTapizado" class="form-label">Url Tapizado</label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-floating mb-3">
                    <asp:TextBox runat="server" ID="txtPrecioTapizado" CssClass="form-control" />
                    <label for="txtPrecioTapizado" class="form-label">Precio</label>
                </div>
                <asp:Button Text="Guardar" ID="btnAceptarTapizado" CssClass="btn btn-warning" OnClick="btnAceptarTapizado_Click" runat="server" ValidationGroup="FormData1" CausesValidation="true" AutoPostBack="false" />
            </div>
            
            <div class="d-flex justify-content-end">
                <a class="btn btn-primary me-2" href="autos.aspx">Cancelar</a>
                <asp:Button Text="Finalizar" ID="btnFinalizar" CssClass="btn btn-warning" runat="server" AutoPostBack="false" OnClick="btnFinalizar_Click" />
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate runat="server">
                    <div id="alertaExitosa" class="alert alert-success alert-dismissible fade show" role="alert" runat="server" visible="false">
                        Los datos han sido cargados exitosamente.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>

    <%-- FIN TAPIZADO --%>
</asp:Content>
