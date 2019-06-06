<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="rooms.aspx.cs" Inherits="Hotel.rooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	    <div class="page-body table-body col-lg-9 col-lg-offset-3 col-md-8 col-md-offset-4 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
		    <h2 class="h2">Rooms</h2>
		    <table class="table table-condinsed table-font">
			    <thead class="head text-center">
				    <tr>
					    <th>Room Number</th>
					    <th>Floor</th>
					    <th>Type of Room</th>
					    <th>Number of Beds</th>
					    <th>Type of Beds</th>
					    <th>Price</th>
				    </tr>
			    </thead>
			    <tbody>
                    <%
                    foreach (string[] room in roomsa)
                    {
                    %>
                        <tr>
                            <td><% Response.Write(room[1]); %></td>
					        <td><% Response.Write(room[2]); %></td>
					        <td><% Response.Write(room[4]); %></td>
					        <td><% Response.Write(room[3]); %></td>
					        <td><% Response.Write(room[5]); %></td>
					        <td><% Response.Write(room[6]); %></td>
                        </tr>
                    <%
                    } 
                    %>
			    </tbody>
		    </table>
	    </div>
    </div>


</asp:Content>
