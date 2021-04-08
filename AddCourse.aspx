<%@ Page Title="AddCourse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="OnlineLecturesSite.AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="Scripts/jquery-1.12.4.js" ></script>
     <script type="text/javascript" src="Scripts/jquery.dataTables.min.js" ></script>
    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });

    </script>
    <link href="Content/jquery.dataTables.min.css" rel="stylesheet" />
    <style type = "text/css" >
        .table-row {
            width: 200px;
            height: 35px;
        }
        .table-row-center {
            width: 200px;
            height: 35px;
            text-align: center;
        }
    </style>
    <div class="row">
        <div class="col-md-4">
            <div class="jumbotron">
             <h2>Kurs Ekle</h2>    
                <hr />
                <table>
                  <tr>
                    <td class="table-row">
                        <asp:Label ID="Label5" runat="server" Text="Kurs Seviyesi"></asp:Label>
                    </td>
                     <td class="table-row">
                         <asp:DropDownList ID="DropDownListTCLevel" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownListTCLevel_SelectedIndexChanged" >
                             <asp:ListItem>---</asp:ListItem>
                             <asp:ListItem>İlkokul</asp:ListItem>
                             <asp:ListItem>Ortaokul</asp:ListItem>
                             <asp:ListItem>Lise</asp:ListItem>
                         </asp:DropDownList>
                    </td>                      
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Kurs Adı "></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListTCName" runat="server" CssClass="form-control" AutoPostBack="true">
                            <asp:ListItem>---</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>       
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Fiyat Belirle (₺)"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxCost" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
            </table>
                <div style="margin-top:20px">                    
                    <asp:Button ID="ButtonADD" runat="server" Text="Tamamla"  CssClass="btn btn-primary" OnClick="ButtonTCADD_Click"  />
                </div>
                <div style="margin-top:20px">
                    <asp:Label ID="LabelWarningAddCourse" runat="server" Text="" CssClass="text-danger" ></asp:Label>
                </div>
         </div>
        </div>
        <div class="col-md-8">
            <div class="jumbotron" style="height:702px;">
                <h3>Tüm Kurslar</h3>
                <hr />
                    <table id="example" class="display">
                        <thead>
                            <tr>
                                <th class="th-size">Kurs Adı</th>
                                <th class="th-size">Kurs Öğretmeni</th>
                                <th class="th-size">Kurs Seviyesi</th>
                                <th class="th-size">Kurs Ücreti</th> 
                            </tr>
                        </thead>
                        <tbody>
                           <asp:Repeater ID="RepeaterCourseInfo" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td class="th-size"><%#Eval("Cname")%></td>
                                        <td class="th-size"><%#Eval("Cteacher")%></td>
                                        <td class="th-size"><%#Eval("Clevel")%></td>              
                                        <td class="th-size"><%#Eval("Ccost")%> ₺</td>              
                                    </tr>
                                </ItemTemplate>     
                            </asp:Repeater>
                        </tbody>
                    </table>

                
            </div>
        </div>
    </div>
    


</asp:Content>
