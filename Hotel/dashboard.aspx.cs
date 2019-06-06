using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class dashboard : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection con;
        MySql.Data.MySqlClient.MySqlCommand stmt;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        public List<string[]> bestClients = new List<string[]>();
        public string query;
        public string noClients;
        public string noReservation;
        public string noRooms;
        public string noSingleRooms;
        public string noDoubleRooms;
        public string noSuites;
        public string reservedSingle;
        public string reservedDouble;
        public string reservedSuite;
        public int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin_name"] == null)
            {
                Response.Redirect("main.aspx");
            }

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["db_mysql"].ToString();
            con = new MySql.Data.MySqlClient.MySqlConnection(connString);
            con.Open();
            query = "SELECT COUNT(Client), reservations.Client, clients.Name FROM reservations INNER JOIN clients ON reservations.Client = clients.ID GROUP BY Client ORDER BY COUNT(Client) DESC LIMIT 5";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();

            while (reader.Read())
            {
                string[] arr = new string[3];
                arr[0] = reader["COUNT(Client)"].ToString();
                arr[1] = reader["Client"].ToString();
                arr[2] = reader["Name"].ToString();
                bestClients.Add(arr);
            }
            reader.Close();

            query = "SELECT COUNT(*) FROM clients";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();
            while (reader.Read())
            {
                noClients = reader["COUNT(*)"].ToString();
            }
            reader.Close();

            query = "SELECT COUNT(*) FROM reservations";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();
            while (reader.Read())
            {
                noReservation = reader["COUNT(*)"].ToString();
            }
            reader.Close();

            query = "SELECT COUNT(*) FROM rooms";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();
            while (reader.Read())
            {
                noRooms = reader["COUNT(*)"].ToString();
            }
            reader.Close();

            query = "SELECT COUNT(*) FROM rooms WHERE type_of_room = 'Single'";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();
            while (reader.Read())
            {
                noSingleRooms = reader["COUNT(*)"].ToString();
            }
            reader.Close();

            query = "SELECT COUNT(*) FROM rooms WHERE type_of_room = 'Double'";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();
            while (reader.Read())
            {
                noDoubleRooms = reader["COUNT(*)"].ToString();
            }
            reader.Close();

            query = "SELECT COUNT(*) FROM rooms WHERE type_of_room = 'Suite'";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();
            while (reader.Read())
            {
                noSuites = reader["COUNT(*)"].ToString();
            }
            reader.Close();

            query = "SELECT reservations.*, rooms.type_of_room, COUNT(*) AS 'Num' FROM reservations INNER JOIN rooms ON reservations.Room = rooms.ID WHERE Start < CURRENT_DATE AND End > CURRENT_DATE AND rooms.type_of_room = 'Single'";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();
            while (reader.Read())
            {
                reservedSingle = reader["Num"].ToString();
            }
            reader.Close();

            query = "SELECT reservations.*, rooms.type_of_room, COUNT(*) AS 'Num' FROM reservations INNER JOIN rooms ON reservations.Room = rooms.ID WHERE Start < CURRENT_DATE AND End > CURRENT_DATE AND rooms.type_of_room = 'Double'";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();
            while (reader.Read())
            {
                reservedDouble = reader["Num"].ToString();
            }
            reader.Close();

            query = "SELECT reservations.*, rooms.type_of_room, COUNT(*) AS 'Num' FROM reservations INNER JOIN rooms ON reservations.Room = rooms.ID WHERE Start < CURRENT_DATE AND End > CURRENT_DATE AND rooms.type_of_room = 'Suite'";
            stmt = new MySql.Data.MySqlClient.MySqlCommand(query, con);
            reader = stmt.ExecuteReader();
            while (reader.Read())
            {
                reservedSuite = reader["Num"].ToString();
            }
            reader.Close();
            con.Close();

            
        }
    }
}

