using System;
using System.Collections.Generic;
using System.Data;
using MySql.Data.MySqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Function
{
    public static class UserFunction
    {
        static string connection = @"server=34.87.101.18;user id=tritnse130094;database=healthcaredb;password=GNM2mCCCjcAHb6ui";
        static MySqlConnection con;
        static MySqlCommand cmd;
        static MySqlDataReader reader;

        public static bool checkLogin(string phone, string password)
        {
            try
            {   
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Select fullname from users where phone = @phone and passwords = @password";
                cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@password", password);

                reader = cmd.ExecuteReader();
                return reader.HasRows;
            }
            catch (MySqlException e)
            {
                    throw new Exception(e.Message);
            }
            finally
            {
                con.Close();
            }
        }


        public static string getRole(string phone, string password)
        {

            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Select roles from users where phone = @phone and passwords = @password";
                cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@password", password);


                reader = cmd.ExecuteReader();
                // note : have to read before get...
                reader.Read();
                return Convert.ToString(reader["roles"]);
            }
            catch (MySqlException e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                con.Close();
            }

        }
    }
}
