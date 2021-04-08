<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineLecturesSite.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type = "text/css" >
        .table-row {
            width: 180px;
            height: 35px;
        }
    </style>
<div class="row">
    <div class="col-md-6">
        <div class="jumbotron">
            <h2>Giriş Yap</h2>
            <table>
                <tr>
                    <td class="table-row">                
                        <asp:Label ID="LabelLoginNick" runat="server" Text="Kullanıcı Adı"></asp:Label>
                    </td>
                    <td class="table-row">
                        <asp:TextBox ID="TBLogNick" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table-row">
                        <asp:Label ID="LabelLogPassword" runat="server" Text="Şifre"></asp:Label>
                    </td>
                    <td class="table-row">
                        <asp:TextBox ID="TBLogPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table-row"></td>
                    <td class="table-row">
                         <asp:DropDownList ID="DDLogStat" runat="server" CssClass="form-control">
                             <asp:ListItem>Öğrenci</asp:ListItem>
                             <asp:ListItem>Öğretmen</asp:ListItem>
                         </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <div style="margin-top:20px; margin-left:180px; width: 300px;">
                <asp:Button ID="Button1" runat="server" Text="Giriş" CssClass="btn btn-primary" OnClick="ButtonTamam_Click" Width="180px" />
            </div>
            
        </div>
    </div>
    <div class="col-md-6">
        <div class="jumbotron" style="background-color:#FFF">
            <h2>Henüz Kaydolmadınız mı?</h2>
            <hr />
            <p>
                Sitemizin olanaklarından daha fazla yararlanmak için buradan kaydolabilirsiniz.
            </p>
            <p>
                <a class="btn btn-primary " href="Register.aspx">Kaydol &raquo;</a>
            </p>
        </div>
    </div>
</div>

</asp:Content>
