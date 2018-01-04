<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Register.aspx.cs" Inherits="EstocasticProjectEstimation.Register" %>

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
            <br><br>
            <asp:Button ID="btbVolver" CssClass="float-right" runat="server" Text="<%$ Resources: WebResources, VOLVER %>" OnClientClick="javascript:volver();" />
            <fieldset id="Fieldset1" runat="server" style="background: #fff">          
                <table id="data" runat="server" style="width: 400px; margin:auto;">
                     <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources: WebResources, NOMBRE %>"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox runat="server" ID="TxtNombre" MaxLength="15"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources: WebResources, APELLIDOS %>"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox runat="server" ID="TxtApellidos" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources: WebResources, USER %>"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox runat="server" ID="TxtUser" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources: WebResources, PASSWORD %>"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox runat="server" ID="TxtPassword" MaxLength="15"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                             <asp:Label runat="server" ID="lblRegisterError" CssClass="lblerror" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                             <asp:Button ID="btnRegistrar" runat="server" Text="<%$ Resources: WebResources, REGISTER_CONTINUAR %>" OnClick="btnRegistrar_Click" />
                        </td>
                    </tr>                    
                </table>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
