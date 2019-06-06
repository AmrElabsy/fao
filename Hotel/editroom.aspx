<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="editroom.aspx.cs" Inherits="Hotel.editroom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	    <div class="page-body-navbar1 col-lg-10 col-lg-offset-3 col-md-6 col-md-offset-5 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 ">
		    <h2 class="signup text-center">Edit Room</h2>
		    <form class="form-horizontal form-padding" runat="server">
                <asp:HiddenField ID="roomID" runat="server" />
			    <div class="form-group">
				    <label class="control-label col-sm-4" for="Room Number">Room Number:</label>
				    <div class="col-sm-7">
                        <asp:TextBox ID="roomNumber" CssClass="form-control input" runat="server" placeholder="Room Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="roomNumber" ErrorMessage="<div class='err-msg text-center'>Write Room Number</div>"></asp:RequiredFieldValidator>
				    </div>
			    </div>

			    <div class="form-group">
				    <label class="control-label col-sm-4" for="Room Type">Room Type:</label>
				    <div class="col-sm-7">
                        <asp:TextBox ID="roomType" runat="server" CssClass="form-control input" placeholder="Room Type"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="roomType" ErrorMessage="<div class='err-msg text-center'>Write Room Type</div>"></asp:RequiredFieldValidator>
                    </div>
			    </div>

			    <div class="form-group">
				    <label class="control-label col-sm-4" for="Floor">Floor:</label>
				    <div class="col-sm-8">
                        <div class="col-sm-5 room-form-pad">
                        <asp:TextBox ID="floor" runat="server" type="number" CssClass="form-control input-nm">0</asp:TextBox>
                        </div>
                        <div class="col-lg-12">
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="floor" Type="Integer" MinimumValue="1" MaximumValue="10" ErrorMessage="<div class='err-msg text-center'>Floor Must Be between 1 and 10</div>"></asp:RangeValidator>
				        </div>
				    </div>
			    </div>

			    <div class="form-group">  
				    <label class="control-label col-sm-4" for="Beds Number">Beds Number:</label>
				    <div class="col-sm-8">
                        <div class="col-sm-5 room-form-pad">
                        <asp:TextBox ID="bedsNumber" runat="server" type="number" CssClass="form-control input-nm">0</asp:TextBox>
                        </div>
                        <div class="col-lg-12">
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="bedsNumber" MinimumValue="1" MaximumValue="5" ErrorMessage="<div class='err-msg text-center'>Beds Number Must Be between 1 and 5</div>"></asp:RangeValidator>
				        </div>
                    </div>
			    </div>

			    <div class="form-group">
				    <div class="control-label col-sm-4">
					    <label class="control-label" for="Beds Type"><span class="span">Beds Type :</span></label>
				    </div>
				    <div class="col-lg-7">
                        <asp:RadioButtonList ID="bedsType" runat="server" CssClass="inline">
                            <asp:ListItem Text=" Small" Value="Small" Selected="True"></asp:ListItem>
                            <asp:ListItem Text=" Medium" Value="Medium"></asp:ListItem>
                            <asp:ListItem Text=" Large" Value="Large"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
			    </div> 

			    <div class="form-group">
				    <label class="control-label col-sm-4" for="Price">Price: </label>
				    <div class="col-lg-8">
                        <div class="col-lg-6">
                            <asp:TextBox ID="price" placeholder="Price" CssClass="form-control" runat="server"></asp:TextBox>
				        </div>
                        <div class="col-lg-12">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="price" ValidationExpression="\d+" ErrorMessage="<div class='err-msg text-center'>Price Must be Number</div>"></asp:RegularExpressionValidator>
                        </div>
                    </div>
			    </div>
			    <div class="text-center col-sm-4 col-lg-4 col-sm-offset-4 col-lg-offset-4">
                    <asp:Button ID="Button1" runat="server" Text="Edit Room" CssClass="btn btn-default btn-lg center-block" OnClick="edit_room"/>
			    </div>
		    </form>
	    </div>
    </div>
</asp:Content>
