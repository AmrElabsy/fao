<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Hotel.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
	window.onload = function () {

		var chart = new CanvasJS.Chart("chartContainer", {
			theme: "light2",
			animationEnabled: true,
			title: {
				text: "Reservation"
			},
			subtitles: [{
				text: "Now",
				fontSize: 16
			}],
			data: [{
				type: "pie",
				indexLabelFontSize: 18,
				radius: 80,
				indexLabel: "{label} - {y}",
				yValueFormatString: "###0\" \"Reservation\"\"",
				click: explodePie,
				dataPoints: [
					{ y: <% Response.Write(reservedSingle); %>, label: "Single Room" },
					{ y: <% Response.Write(reservedDouble); %>, label: "Double Room" },
					{ y: <% Response.Write(reservedSuite); %>, label: "Suite" }
				]
			}]
		});
		chart.render();

		function explodePie(e) {
			for(var i = 0; i < e.dataSeries.dataPoints.length; i++) {
				if(i !== e.dataPointIndex)
					e.dataSeries.dataPoints[i].exploded = false;
			}
		}

	}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
		<div class="page-body col-lg-9 col-lg-offset-3 col-md-8 col-md-offset-4 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
			<h2 class="h2 Dashboard">Dashboard</h2>
			<div class="div-label-margin"> 
				<h2>
					<span class="label col-sm-3 label-Dashboard">
						Clients <span class="badge span-color"><% Response.Write(noClients); %></span>
					</span>
				</h2>

				<h2>
					<span class="label col-sm-4 label-Dashboard">
						Reservations <span class="badge span-color"><% Response.Write(noReservation); %></span>
					</span>
				</h2>
				
				<h2>
					<span class="label col-sm-3 label-Dashboard">
						Rooms <span class="badge span-color"><% Response.Write(noRooms); %></span>
					</span>
				</h2>
				
				<h3>
					<span class="label col-sm-3 label-Rooms">
						Single Rooms <span class="badge span-color"><% Response.Write(noSingleRooms); %></span>
					</span>
				</h3>
				
				<h3>
					<span class="label col-sm-3 label-Rooms">
						Double Rooms <span class="badge span-color"><% Response.Write(noDoubleRooms); %></span>
					</span>
				</h3>
				
				<h3>
					<span class="label col-sm-2 label-Rooms">
						Suites <span class="badge span-color"><% Response.Write(noSuites); %></span>
					</span>
				</h3>
			</div>

			<div class="div-table-margin">
				<hr />
				<h3 class="text-center Dashboard"><span class="glyphicon glyphicon-star-empty"></span> Featured Clients</h3>
				<hr />
				<table class="table table-condinsed table-font text-center">
					<thead class="head">
						<tr>
						<th>No.</th>
						<th>Client Name</th>
						<th>Reservations</th>
						</tr>
					</thead>
					
					<tbody>
						<%
							foreach (string[] client in bestClients)
							{
								%>
									<tr>
										<td><% Response.Write(++i); %></td>
										<td><% Response.Write(client[2]); %></td>
										<td><% Response.Write(client[0]); %></td>
									</tr>
								<%
							}
						%>
					</tbody>
				</table>
    			<hr />

			</div>
			<div id="chartContainer" style="height: 270px; width:450px;" class="div-graph"></div>
            <hr />
		</div>
	</div> 
</asp:Content>
