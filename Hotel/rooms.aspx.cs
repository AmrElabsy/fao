using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class rooms : System.Web.UI.Page
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
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["db_mysql"].ToString();
            con = new MySql.Data.MySqlClient.MySqlConnection(connString);
            con.Open();
            query = "SELECT * FROM rooms";
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

     
            reader.Close();
            con.Close();

        }
    }
}