<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineLecturesSite._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="text-align: center; background-color:#fff;">
        <h1>Online Lectures</h1>
        <p class="lead">Dersler artık sadece bir tık uzağınızda. Nasıl mı? Online Lectures'la bu çok kolay.</p>
    </div>

    <div class="row">
        <div class="jumbotron" style="height: 400px;">
            <div class="col-md-6">
                <h2>İstediğiniz Ders Burada</h2>
                <p>Sınava mı hazırlanıyorsunuz? Alt sınıf derslerinden eksiğinizi tamamlamak veya seneye daha hazır başlamak mı istiyorsunuz? Doğru yerdesiniz.</p>
                <p><a runat="server" href="~/About" class="btn btn-primary btn-lg">Daha Fazlası &raquo;</a></p>            
            </div>     
            <div class="col-md-6">
                <img class="img-responsive" src="/Background/back1.jpg" style="width: 600px; height: 300px;" alt="" />
            </div>
        </div>     
    </div>
    <div class="row">
        <div class="jumbotron" style="background-color: #fff; height: 400px;">
            <div class="col-md-6">
                <img class="img-responsive" src="/Background/back3.jpg" style="width: 600px; height: 300px;" alt="" />
            </div>
            <div class="col-md-6">
                <h2>Öğrenci ve Öğretmenlerin Buluştuğu Adres</h2>
                <p>
                    Tüm dersler bu adreste. Bütçenize de uygun seçenekleri görmek için gelin.
                </p>
                <p><a runat="server" href="~/About" class="btn btn-primary btn-lg">Daha Fazlası &raquo;</a></p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="jumbotron" style="height: 400px;">
            <div class="col-md-6">
                <h2>Ders Vermek İstiyorum</h2>
                <p>
                    Branşınızda tecrübeli ya da yeni bir öğretmen misiniz? Ders vermek için bizimle iletişime geçin.
                </p>
                <p><a runat="server" href="~/Contact" class="btn btn-primary btn-lg">Daha Fazlası &raquo;</a></p>
            </div>
            <div class="col-md-6">
                <img class="img-responsive" src="/Background/back2.jpg" style="width: 600px; height: 300px;" alt="" />
            </div>
        </div>         
    </div>

</asp:Content>
