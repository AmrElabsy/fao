using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class editroom : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection con;
        MySql.Data.MySqlClient.MySqlCommand stmt;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        public List<string[]> roomsa = new List<string[]>();
        string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_name"] == null)
            {
                Response.Redirect("main.aspx");
            } 
            int id = int.Parse(Request.QueryString["id"]);
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["db_mysql"].ToString();
            con = new MySql.Data.MySqlClient.MySqlConnection(connString);
            con.Open();
            query = "SELECT * FROM rooms WHERE ID = " + id;
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();

            while (reader.Read())
            {
                string[] arr = new string[7];
                arr[0] = reader["ID"].ToString();
                arr[1] = reader["Number"].ToString();
                arr[2] = reader["floor"].ToString();
                arr[3] = reader["no_of_beds"].ToString();
                arr[4] = reader["type_of_room"].ToString();
                arr[5] = reader["type_of_beds"].ToString();
                arr[6] = reader["price"].ToString();

                roomsa.Add(arr);
            }

            roomID.Value = roomsa[0][0];
            roomNumber.Text = roomsa[0][1];
            roomType.Text = roomsa[0][4];
            floor.Text = roomsa[0][2];
            bedsNumber.Text = roomsa[0][3];
            bedsType.SelectedValue = roomsa[0][5];
            price.Text = roomsa[0][6];

            reader.Close();
            con.Close();
        }

        protected void edit_room(object sender, EventArgs e)
        {
            string room = roomNumber.Text;
            string type = roomType.Text;
            string flor = floor.Text;
            string bdsN = bedsNumber.Text;
            string pric = price.Text;
            string bdsT = bedsType.SelectedValue;
            string id = roomID.Value;

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["db_mysql"].ToString();
            con = new MySql.Data.MySqlClient.MySqlConnection(connString);
            con.Open();
            query = "UPDATE rooms SET Number = '" + room + "', floor = '" + flor + "', no_of_beds = '" + bdsN + "', type_of_room = '" + type + "', type_of_beds = '" + bdsT + "', price = '" + pric + "' WHERE ID = '" + id + "'";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);

            roomNumber.Text = price.Text;
            stmt.ExecuteNonQuery();
            con.Close();

        }
    }
}