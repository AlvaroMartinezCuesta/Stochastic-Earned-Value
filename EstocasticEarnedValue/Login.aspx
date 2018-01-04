<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EstocasticProjectEstimation.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <script type="text/javascript">
        
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="always">
        <ContentTemplate>
            <br><br>
            <fieldset runat="server" style="background: #fff">            
                <table id="data" runat="server" style="width: 400px; margin:auto;">
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources: WebResources, REGISTER_INFO %>"></asp:Label>&nbsp
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx" CssClass="BlueLink" Text="<%$ Resources: WebResources, REGISTER %>"></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="<%$ Resources: WebResources, USER %>"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox runat="server" ID="TxtUser" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label runat="server" Text="<%$ Resources: WebResources, PASSWORD %>"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox runat="server" ID="TxtPassword" MaxLength="15"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2" style="text-align:center;">
                             <asp:Label runat="server" ID="lblLoginError" CssClass="lblerror" Visible="false" Text="<%$ Resources: WebResources, ERROR_LOGIN %>"> ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                             <asp:Button ID="btnLogIn" runat="server" Text="<%$ Resources: WebResources, LOGIN %>" OnClick="btnLogIn_Click" />
                        </td>
                    </tr>                    
                </table>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
