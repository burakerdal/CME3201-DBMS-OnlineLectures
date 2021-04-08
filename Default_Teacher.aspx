<%@ Page Title="TeacherHome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default_Teacher.aspx.cs" Inherits="OnlineLecturesSite.Default_Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="Scripts/jquery-1.12.4.js" ></script>
     <script type="text/javascript" src="Scripts/jquery.dataTables.min.js" ></script>
    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });

    </script>
    <link href="Content/jquery.dataTables.min.css" rel="stylesheet" />
    <style>
        .th-size {
            width:200px;
        }
    </style>           
    <div class="row">
        <div class="col-md-4">
            <div class="jumbotron">                 
                <h3><asp:Label ID="LabelInfoMain" runat="server" Text=""></asp:Label></h3>
                <hr />
                &raquo; <asp:LinkButton ID="LinkButton2" runat="server" Text="Kurs Ver" OnClick="LinkButton2_Click" />
                <br />
                <br />
            </div>
        </div>
        <div class="col-md-8">
            <div class="jumbotron" style="height:702px;">
                <h3>Verdiğim Kurslar</h3>
                <hr />
                    <table id="example" class="display">
                        <thead>
                            <tr>
                                <th class="th-size">Kurs Adı</th>
                                <th class="th-size">Kurs Seviyesi</th>
                                <th class="th-size">Kurs Ücreti</th> 
                            </tr>
                        </thead>
                        <tbody>
                           <asp:Repeater ID="RepeaterCourseInfo" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td class="th-size"><%#Eval("Cname")%></td>
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
