<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="roomsshow.aspx.cs" Inherits="Hotel.roomsshow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
            	<div class="page-body col-lg-9 col-lg-offset-3" style="background:none">
		            <%
                        foreach (string[] room in roomsa) 
                        {
                            %>
                            
                                <div class="room">
						            <img src="static/images/<% Response.Write(i++); %>.jpg" class="col-lg-3" />
						            <h4 class="col-lg-4"><% Response.Write(room[4]); %> Room</h4>
						            <a class="btn btn-default center-block btn-lg col-lg-4" href="reservation.aspx?id=<% Response.Write(room[0]); %>">Book Now</a>
						            <p class="col-lg-4"><% Response.Write(room[3]); %>&nbsp;<% Response.Write(room[5]); %> bed</p>
						            <a class="link col-lg-4" href="#">Room details</a>
						            <ul class="col-lg-4">
							            <li>Double bed</li>
							            <li>Free Wi-Fi</li>
							            <li>Individual Air conditioning</li>
							            <li>Courtesy tray</li>
							            <li>Safety deposit box</li>
							            <li>Mini bar</li>
							            <li>Flat screen television</li>
							            <li>Satellite channels</li>
							            <li>Direct dial telephone</li>
							            <li>Bathroom with shower or bathtub</li>
							            <li>Hairdryer</li>
							            <li><a class="less" href="#">Less</a></li>
						            </ul>	
					            </div>
                            <%
                        }
                        %>
					
				</div>
			</div>
</asp:Content>
