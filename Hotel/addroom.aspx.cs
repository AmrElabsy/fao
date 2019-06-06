using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class addroom : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection con;
        MySql.Data.MySqlClient.MySqlCommand stmt;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_name"] == null)
            {
                Response.Redirect("main.aspx");
            }

        }

        protected void add_room(object sender, EventArgs e)
        {
            string room = roomNumber.Text;
            string type = roomType.Text;
            string flor = floor.Text;
            string bdsN = bedsNumber.Text;
            string pric = price.Text;
            string bdsT = bedsType.SelectedValue;

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["db_mysql"].ToString();
            con = new MySql.Data.MySqlClient.MySqlConnection(connString);
            con.Open();
            query = "INSERT INTO rooms(Number, floor, no_of_beds, type_of_room, type_of_beds, price) VALUES('" + room + "', '" + flor + "', '" + bdsN + "', '" + type + "', '" + bdsT + "', '" + pric + "')";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);

            stmt.ExecuteReader();
            con.Close();

            Response.Redirect("rooms.aspx");
        }
    }
}