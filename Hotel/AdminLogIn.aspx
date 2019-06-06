<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="AdminLogIn.aspx.cs" Inherits="Hotel.AdminLogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	    <div class="page-body col-lg-4 col-lg-offset-5 col-md-5 col-md-offset-6 col-sm-7 col-sm-offset-3 col-xs-10 col-xs-offset-1">
		    <h2 class="login text-center">Admin Log In</h2>
		    <form class="form" runat="server">
                <asp:TextBox ID="box_name" CssClass="address center-block" placeholder="Enter Your Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="box_name" ErrorMessage="<div class='err-msg text-center'>Write Must Your Name</div>"></asp:RequiredFieldValidator>
                
                <asp:TextBox ID="box_pass" CssClass="Password center-block" TextMode="Password" placeholder="Enter Your Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="box_pass" ErrorMessage="<div class='err-msg text-center'>Write Must Your Password</div>"></asp:RequiredFieldValidator>
                
                <asp:Button ID="Button1" runat="server" Text="Log In" CssClass="btn btn-default btn-lg center-block" OnClick="admin_log_in"/>
			    		    
		    </form>
	    </div>
    </div>
</asp:Content>
