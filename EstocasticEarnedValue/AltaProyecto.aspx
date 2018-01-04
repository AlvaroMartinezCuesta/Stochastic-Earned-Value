<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AltaProyecto.aspx.cs" Inherits="EstocasticProjectEstimation.AltaProyecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <script type="text/javascript">
        function volver() {
            history.back();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="always">
        <ContentTemplate>
            <br>
            <br>
            <asp:Button ID="btbVolver" CssClass="float-right" runat="server" Text="<%$ Resources: WebResources, VOLVER %>" OnClientClick="javascript:volver();" />
            <%-- Paso 1 --%>
            <fieldset id="fldSetPaso1" runat="server" style="background: #fff">
                <legend runat="server"><%= Resources.WebResources.PASO_UNO %></legend>
                <table id="tablePasoUno" runat="server" style="width: 600px; margin: auto;">
                    <tr>
                        <td style="width:120px;">
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources: WebResources, NOMBRE_PROYECTO %>"></asp:Label>
                        </td>
                        <td style="width:300px;">
                            <asp:TextBox runat="server" ID="TxtNombreProyecto" Width="300" MaxLength="100"></asp:TextBox>
                        </td>
                        <td style="width:20px;"></td>
                        <td style="width:100px;">
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources: WebResources, NUM_ACTIVIDADES %>"></asp:Label>
                        </td>
                        <td style="width:30px;">
                            <asp:TextBox runat="server" ID="TxtNumAct" Width="20" MaxLength="2"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center;">
                             <asp:Label runat="server" ID="lblErrorPasoUno" Text="<%$ Resources: WebResources, ERROR_FILL_FIELDS %>" CssClass="lblerror" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center;">
                             <asp:Button ID="btnNextPasoUno" runat="server" Text="<%$ Resources: WebResources, NEXT %>" OnClick="btnNextPasoUno_Click" />
                        </td>
                    </tr>     
                </table>
            </fieldset>
           <%-- Fin Paso 1 --%>
           <%-- Paso 2 --%>
           <fieldset id="fldSetPaso2" runat="server" style="background: #fff" visible="false">
                <legend id="Legend1" runat="server"><%= Resources.WebResources.PASO_DOS %></legend>
                <table id="tablePasoDos" runat="server" style="width: 600px; margin: auto;">
                    <tr>
                        <td>
                             <asp:GridView ID="GV_ACTIVIDADES" runat="server" DataKeyNames="Num_Actividad" Width="100%"
                                 AutoGenerateColumns="false" EmptyDataText="<%$ Resources: WebResources, GRIDVIEW_EMPTY_TEXT %>">
                                <Columns>
                                    <asp:BoundField DataField="Num_Actividad" ReadOnly="true" HeaderText="<%$ Resources: WebResources, ACTIVIDAD %>"  ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" HeaderText="<%$ Resources: WebResources, NOMBRE_ACTIVIDAD %>">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TxtNombreActividad" Width="150" MaxLength="50"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" HeaderText="<%$ Resources: WebResources, DESCRIPCION %>">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TxtDescripcionActividad" Width="300" MaxLength="250"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                               
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center;">
                             <asp:Label runat="server" ID="lblErrorPasoDos" Text="<%$ Resources: WebResources, ERROR_ALTA_PROYECTO_PASO_DOS %>" CssClass="lblerror" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center;">
                             <asp:Button ID="btnNextPasoDos" runat="server" Text="<%$ Resources: WebResources, NEXT %>" OnClick="btnNextPasoDos_Click" />
                        </td>
                    </tr>     
                </table>
            </fieldset>
           <%-- Fin Paso 2 --%>
           <%--  Paso 3 --%>
           <fieldset id="fldSetPaso3" runat="server" style="background: #fff" visible="false">
                <legend id="Legend2" runat="server"><%= Resources.WebResources.PASO_TRES %></legend>
                <table id="tablePasoTres" runat="server" style="width: 600px; margin: auto;">
                    <tr>
                        <td style="text-align:center;">
                            <asp:Label runat="server" ID="Label3" Text="<%$ Resources: WebResources, ACTIVITIES_RELATION %>"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:GridView ID="GV_RELACIONES_ACTIVIDADES" runat="server" DataKeyNames="Num_Actividad" Width="100%" 
                                 AutoGenerateColumns="false" EmptyDataText="<%$ Resources: WebResources, GRIDVIEW_EMPTY_TEXT %>" OnRowDataBound="GV_RELACIONES_ACTIVIDADES_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="Num_Actividad" ReadOnly="true" HeaderText="<%$ Resources: WebResources, ORIGEN %>"  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="<%$ Resources: WebResources, DESTINO %>">
                                        <ItemTemplate>
                                            <asp:CheckBoxList runat="server" ID="chkBoxList" RepeatDirection="Horizontal" DataTextField="Num_Actividad" DataValueField="Num_Actividad"></asp:CheckBoxList>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                             
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center;">
                             <asp:Label runat="server" ID="lblErrorPasoTres" Text="<%$ Resources: WebResources, ERROR_ALTA_PROYECTO_PASO_TRES %>" CssClass="lblerror" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center;">
                             <asp:Button ID="btnNextPasoTres" runat="server" Text="<%$ Resources: WebResources, NEXT %>" OnClick="btnNextPasoTres_Click" />
                        </td>
                    </tr>     
                </table>
            </fieldset>
           <%-- Fin Paso 3 --%>
           <%-- Paso 4 --%>
           <fieldset id="fldSetPaso4" runat="server" style="background: #fff" visible="false">
                <legend id="Legend3" runat="server"><%= Resources.WebResources.PASO_CUATRO %></legend>
                <table id="tablePasoCuatro" runat="server" style="width: 600px; margin: auto;">
                    <tr>
                        <td>
                             <asp:GridView ID="GV_FUNCION_PROBABILIDAD" runat="server" DataKeyNames="Num_Actividad" Width="100%" 
                                 AutoGenerateColumns="false" EmptyDataText="<%$ Resources: WebResources, GRIDVIEW_EMPTY_TEXT %>">
                                <Columns>
                                                                           
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center;">
                             <asp:Label runat="server" ID="lblErrorPasoCuatro" Text="<%$ Resources: WebResources, ERROR_ALTA_PROYECTO_PASO_TRES %>" CssClass="lblerror" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center;">
                             <asp:Button ID="btnSaveProyect" runat="server" Text="<%$ Resources: WebResources, SAVE %>" />
                        </td>
                    </tr>     
                </table>
            </fieldset>
           <%-- Fin Paso 4 --%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
 