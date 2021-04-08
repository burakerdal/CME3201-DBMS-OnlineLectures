<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineLecturesSite.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type = "text/css" >
        .table-row {
            width: 180px;
            height: 35px;
        }
    </style>
    <div class="row">
        <div class="col-md-6">
            <div class="jumbotron" style="background-color:#FFF">
                <h2>Online Lectures Avantajları</h2>
                <hr />
                <p>&bull; Kaliteli ders içerikleri</p>
                <p>&bull; Uygun fiyatlar</p>
                <p>&bull; Her türlü platform</p>
                <p><a class="btn btn-primary " href="Login.aspx">Giriş Yap &raquo;</a></p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="jumbotron">
                <h2>Kaydol</h2>               
                <table>
                    <tr>
                        <td class="table-row">                
                            <asp:Label ID="LabelNameSurname" runat="server" Text="* Ad Soyad"></asp:Label>
                        </td>
                        <td class="table-row">
                            <asp:TextBox ID="TextBoxNameSurname" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-row">                
                            <asp:Label ID="LabelLoginNick" runat="server" Text="* Kullanıcı Adı"></asp:Label>
                        </td>
                        <td class="table-row">
                            <asp:TextBox ID="TextBoxNickName" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>                    
                    <tr>
                        <td class="table-row">
                            <asp:Label ID="Label4" runat="server" Text="Yaş"></asp:Label>
                        </td>
                        <td class="table-row">
                            <asp:TextBox ID="TextBoxAge" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-row">
                            <asp:Label ID="Label3" runat="server" Text="Cinsiyet"></asp:Label>
                        </td>
                        <td class="table-row">
                            <asp:DropDownList ID="DropDownListGender" runat="server" CssClass="form-control">
                                <asp:ListItem>Erkek</asp:ListItem>
                                <asp:ListItem>Kadın</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-row">
                
                            <asp:Label ID="Label5" runat="server" Text="* Eğitim Seviyesi"></asp:Label>
                
                        </td>
                        <td class="table-row">
               
                             <asp:DropDownList ID="DropDownListEdLevel" runat="server" CssClass="form-control">
                                 <asp:ListItem>İlkokul</asp:ListItem>
                                 <asp:ListItem>Ortaokul</asp:ListItem>
                                 <asp:ListItem>Lise</asp:ListItem>
                             </asp:DropDownList>
               
                        </td>
                    </tr>
                    <tr>
                        <td class="table-row"><asp:Label ID="Label1" runat="server" Text="* Kayıt Tipi"></asp:Label></td>
                        <td class="table-row">
                             <asp:DropDownList ID="DropDownListStatus" runat="server" CssClass="form-control">
                                 <asp:ListItem>Öğrenci</asp:ListItem>
                                 <asp:ListItem>Öğretmen</asp:ListItem>
                             </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-row">
                            <asp:Label ID="LabelLoginPassword" runat="server" Text="* Şifre"></asp:Label>
                        </td>
                        <td class="table-row">
                            <asp:TextBox ID="TextBoxLoginPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="LabelLoginWarning" runat="server" Text="" CssClass="text-danger" ></asp:Label>
                <p style="margin-top:10px; font-size:10px; color: red;">* işaretli alanların doldurulması zorunludur!</p>
                <div style="margin-top:20px; margin-left:180px; width: 180px;">
                    <asp:Button ID="Button1" runat="server" Text="Kaydet" CssClass="btn btn-primary" OnClick="ButtonRegister_Click" Width="180px" />
                </div>
            
            </div>
        </div>
    </div>

</asp:Content>

