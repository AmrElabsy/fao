using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class Signup : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection con;
        MySql.Data.MySqlClient.MySqlCommand stmt;
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

        protected void Sign_up(object sender, EventArgs e)
        {
            string name = box_name.Text;
            string address = box_address.Text;
            string mail = box_email.Text;
            string phone = box_phone.Text;
            string credit = box_credit.Text;
            string pass = box_pass1.Text;
            string date = box_date.Text;


            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["db_mysql"].ToString();
            con = new MySql.Data.MySqlClient.MySqlConnection(connString);
            con.Open();
            query = "INSERT INTO clients(Name, Phone, Email, Pass, Address, CC_Number, Date_of_Birth) VALUES ('" + name + "', '" + phone + "', '" + mail + "', '" + pass + "', '" + address + "', '" + credit + "', '" + date + "')";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);

            stmt.ExecuteReader();
            con.Close();

            Response.Redirect("Login.aspx");

        }
    }
}