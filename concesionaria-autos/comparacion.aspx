<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="comparacion.aspx.cs" Inherits="concesionaria_autos.comparacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container my-5">

        <%--SELECTORES--%>
        <div class="row text-center my-5">
            <h2 class="fw-bold">Comparador de modelos</h2>
            <h6>Compará todas las características de los diferentes modelos Renault</h6>
        </div>
        <div class="row justify-content-around my-3">

            <div class="card border-0 p-0" style="width: 23rem">
                <% if (auto1 != null)
                    {  %>
                <img class="card-img-top" src="<%:auto1.Imagen.ImagenUrl %>" alt="<%:auto1.Nombre %>">
                <% }
                    else
                    { %>
                <img class="card-img-top filtroSinSeleccionar" src="Logan.jpg" alt="Auto">
                <% } %>
                <asp:DropDownList class="form-select" ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="card border-0 p-0" style="width: 23rem">
                <% if (auto2 != null)
                    {  %>
                <img class="card-img-top" src="<%:auto2.Imagen.ImagenUrl %>" alt="<%:auto2.Nombre %>">
                <% }
                    else
                    { %>
                <img class="card-img-top filtroSinSeleccionar" src="Logan.jpg" alt="Auto">
                <% } %>
                <asp:DropDownList class="form-select" ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>

        <%--BOTON--%>

        <div class="d-flex justify-content-center my-4">
            <asp:Button class="btn btn-warning" ID="Button1" runat="server" Text="Compará" OnClick="Button1_Click" />
        </div>

        <%--COMPARACION--%>
        <% if (auto1 != null && auto2 != null)
            {  %>
        <div class="accordion" id="accordionPanelsStayOpenExample">
            <div class="accordion-item ">
                <h4 class="accordion-header" id="panelsStayOpen-headingOne">
                    <button class="accordion-button bg-foreColor text-white" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                        DIMENSIONES
                    </button>
                </h4>
                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                    <div class="accordion-body m-0 p-0">

                        <div class="row justify-content-center py-3">Número de plazas</div>
                        <div class="d-flex justify-content-around text-center">
                            <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica1!=null ? fichaTecnica1.Plazas : 0 %></div>
                            <div class="bg-lightGrey w-50 py-3"><%: fichaTecnica2!=null ? fichaTecnica2.Plazas : 0 %></div>
                        </div>

                        <div class="row justify-content-center py-3">Longitud total</div>
                        <div class="d-flex justify-content-around text-center">
                            <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica1!=null ? fichaTecnica1.Longitud : 0 %></div>
                            <div class="bg-lightGrey w-50 py-3"><%: fichaTecnica2!=null ? fichaTecnica2.Longitud : 0 %></div>
                        </div>

                        <div class="row justify-content-center py-3">Ancho total</div>
                        <div class="d-flex justify-content-around text-center">
                            <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica1!=null ? fichaTecnica1.Ancho : 0 %></div>
                            <div class="bg-lightGrey w-50 py-3"><%: fichaTecnica2!=null ? fichaTecnica2.Ancho : 0 %></div>
                        </div>

                        <div class="row justify-content-center py-3">Distancia entre ejes</div>
                        <div class="d-flex justify-content-around text-center">
                            <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica1!=null ? fichaTecnica1.Ejes : 0 %></div>
                            <div class="bg-lightGrey w-50 py-3"><%: fichaTecnica2!=null ? fichaTecnica2.Ejes : 0 %></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h4 class="accordion-header" id="panelsStayOpen-headingTwo">
                    <button class="accordion-button bg-foreColor text-white" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                        MOTOR
                    </button>
                </h4>
                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                    <div class="accordion-body m-0 p-0">

                        <div class="row justify-content-center py-3">Caja Manual</div>
                        <div class="d-flex justify-content-around text-center">
                            <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica1!=null ? (fichaTecnica1.CajaManual==true ? "Si" : "No") : 0 %></div>
                            <div class="bg-lightGrey w-50 py-3"><%: fichaTecnica2!=null ? (fichaTecnica2.CajaManual==true ? "Si" : "No") : 0 %></div>
                        </div>

                        <div class="row justify-content-center py-3">Caja Automática</div>
                        <div class="d-flex justify-content-around text-center">
                            <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica1!=null ? (fichaTecnica1.CajaAutomatica==true ? "Si" : "No"): 0 %></div>
                            <div class="bg-lightGrey w-50 py-3"><%: fichaTecnica2!=null ? (fichaTecnica2.CajaAutomatica==true ? "Si" : "No") : 0 %></div>
                        </div>

                        <div class="row justify-content-center py-3">Nafta</div>
                        <div class="d-flex justify-content-around text-center">
                            <div class="bg-darkGrey w-50 py-3"><%: fichaTecnica1!=null ? (fichaTecnica1.Nafta==true ? "Si" : "No") : 0 %></div>
                            <div class="bg-lightGrey w-50 py-3"><%: fichaTecnica2!=null ? (fichaTecnica2.Nafta==true ? "Si" : "No") : 0 %></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h4 class="accordion-header" id="panelsStayOpen-headingThree">
                    <button class="accordion-button bg-foreColor text-white" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                        PRECIO
                    </button>
                </h4>
                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                    <div class="accordion-body m-0 p-0">

                        <div class="row justify-content-center py-3">Precio</div>
                        <div class="d-flex justify-content-around text-center">
                            <div class="bg-darkGrey w-50 py-3">desde $<%: auto1!=null ? auto1.Precio.ToString("N",new System.Globalization.CultureInfo("es-AR")) : 0 %></div>
                            <div class="bg-lightGrey w-50 py-3">desde $<%: auto2!=null ? auto2.Precio.ToString("N",new System.Globalization.CultureInfo("es-AR")) : 0 %></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>

</asp:Content>
