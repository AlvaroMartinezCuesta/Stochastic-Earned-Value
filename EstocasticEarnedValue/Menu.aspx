<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Menu.aspx.cs" Inherits="EstocasticProjectEstimation.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <script type="text/javascript">
        function goTo(pagina) {
            
            window.location.href = "AltaProyecto.aspx"
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">
    <fieldset id="Fieldset1" runat="server" style="background: #fff">            
                <table id="data" runat="server" style="width: 300px; margin:auto;">
                     <tr>
                        <td style="width: 100px; text-align:center;">
                            <img src="/Images/CreateProject.png" class="iconoMenu" onclick="javascript:goTo('AltaProyecto');"></img>
                            <asp:Hyperlink runat="server" CssClass="linkMenu" NavigateUrl="~/AltaProyecto.aspx" Text="<%$ Resources: WebResources, CREATE_PROJECT %>"></asp:Hyperlink>
                        </td> 
                        <td style="width: 50px;"></td>                  
                        <td style="width: 100px; text-align:center;">
                            <img src="/Images/EditProject.png" class="iconoMenu"  onclick="javascript:goTo('EditarProyecto');"></img>
                            <asp:Hyperlink runat="server" CssClass="linkMenu" NavigateUrl="~/AltaProyecto.aspx"  Text="<%$ Resources: WebResources, VIEW_PROJECTS %>"></asp:Hyperlink>
                        </td>
                        <td style="width: 50px;"></td> 
                    </tr>        
                </table>
            </fieldset>
</asp:Content>