<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Hotel.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
		<div class="page-body col-lg-4 col-lg-offset-5 col-md-5 col-md-offset-6 col-sm-7 col-sm-offset-3 col-xs-10 col-xs-offset-1">
			<h2 class="signup text-center">Sign Up</h2>
                     
			<div class="form">
                <form id="form1" runat="server">
                    <asp:TextBox ID="box_name" runat="server" CssClass="address center-block" placeholder="Your Name"></asp:TextBox>                            
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<div class='err-msg text-center'>You Must Write Your Name</div>" ControlToValidate="box_name"></asp:RequiredFieldValidator>
                            
                    <asp:TextBox ID="box_address" runat="server" CssClass="address center-block" placeholder="Type Your Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<div class='err-msg text-center'>You Must Write Your Address</div>" ControlToValidate="box_address"></asp:RequiredFieldValidator>
                            
                    <asp:TextBox ID="box_phone" runat="server" CssClass="address center-block" placeholder="Type Your Phone Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<div class='err-msg text-center'>You Must Write Your Phone Number</div>" ControlToValidate="box_phone"></asp:RequiredFieldValidator>
                            
                    <asp:TextBox ID="box_credit" runat="server" CssClass="credit center-block" placeholder="Type Your Credit"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<div class='err-msg text-center'>You Must Write Your Credit Card Number</div>" ControlToValidate="box_credit"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ValidationExpression="[0-9][0-9][0-9][0-9] [0-9][0-9][0-9][0-9] [0-9][0-9][0-9][0-9] [0-9][0-9][0-9][0-9]"
                            ControlToValidate="box_credit"
                            ErrorMessage="<div class='err-msg text-center'>Credit Must be Like 9999 9999 9999 9999</div>"></asp:RegularExpressionValidator>
                            
                    <asp:TextBox ID="box_email" runat="server" CssClass="email center-block" placeholder="Type Your Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<div class='err-msg text-center'>You Must Write Your E-Mail</div>" ControlToValidate="box_email"></asp:RequiredFieldValidator>
                            
                    <asp:TextBox ID="box_date" runat="server" CssClass="address center-block" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<div class='err-msg text-center'>You Must Write Your Birth Date</div>" ControlToValidate="box_date"></asp:RequiredFieldValidator>


                    <asp:TextBox ID="box_pass1" runat="server" TextMode="Password" CssClass="Password center-block" placeholder="Type Your Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<div class='err-msg text-center'>You Must Write Your Password</div>" ControlToValidate="box_pass1"></asp:RequiredFieldValidator>
                            
                    <asp:TextBox ID="box_pass2" runat="server" TextMode="Password" CssClass="Password center-block" placeholder="Confirm Your Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="box_pass2" ControlToCompare="box_pass1" ErrorMessage="<div class='err-msg text-center'>Both Password Must Match</div>"></asp:CompareValidator>

                    <asp:Button ID="Button1" runat="server" Text="Sign Up" CssClass="btn btn-default btn-lg center-block" OnClick="Sign_up"/>
					<p class="para text-center">Do you have acount?</p>
                    <a href="Login.aspx" class="sign">Log In</a>
                </form>
			</div>
		</div>
	</div>
</asp:Content>
