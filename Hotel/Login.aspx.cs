using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class Login : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection con;
        MySql.Data.MySqlClient.MySqlCommand stmt;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_name"] != null)
            {
                Response.Redirect("dashboard.aspx");
            }
            else if (Session["name"] != null)
            {
                Response.Redirect("main.aspx");
            }

        }

        protected void log_in(object sender, EventArgs e)
        {
            string name = box_name.Text;
            string pass = box_pass.Text;

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["db_mysql"].ToString();
            con = new MySql.Data.MySqlClient.MySqlConnection(connString);
            con.Open();
            query = "SELECT * FROM clients WHERE Name = '" + name + "' AND Pass = '" + pass + "'";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();

            while(reader.HasRows && reader.Read())
            {
                name = reader.GetString(reader.GetOrdinal("Name"));
            }

            if (reader.HasRows)
            {
                Session["name"] = name;
                box_name.Text = "Logged In Successfully";
            }
            else
            {
                box_pass.Text = "Invalid User";
            }
            reader.Close();
            con.Close();

            Response.Redirect("main.aspx");

        }
    }
}