<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="Hotel.gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="page-body col-lg-9 col-lg-offset-3 col-md-8 col-md-offset-4 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 text-center">
            <div class="video-gallery">
                <div class="col-lg-12"> <!-- For The Main Video -->
                    <div class="mainV">
                        <div class="videoFour">
                            <video src="static/videos/videoFour.mp4" controls="controls" />
                        </div>
                    </div>
                </div>
                <div class="row small-videos"> <!-- For The Three Small Videos -->
                    <div class="col-lg-4">
                        <div class="videoOne">
                            <video src="static/videos/videoOne.mp4" />
                        </div>
                    </div>
                
                    <div class="col-lg-4">
                        <div class="videoTwo">
                            <video src="static/videos/videoTwo.mp4" />
                        </div>
                    </div>
                
                    <div class="col-lg-4">
                        <div class="videoThree">
                            <video src="static/videos/videoThree.mp4" />
                        </div>
                    </div>
                
                 
                </div>
            </div>
        </div>
    </div>
</asp:Content>
