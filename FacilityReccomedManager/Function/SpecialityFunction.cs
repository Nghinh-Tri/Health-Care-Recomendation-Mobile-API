using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Function
{
    public static class SpecialityFunction
    {
        static string connection = @"server=localhost;user id=root;database=healthcaredb;password=12345";
        static MySqlConnection con;
        static MySqlCommand cmd;
        static MySqlDataReader reader;

        public static DataTable LoadSpeciality()
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "select id, translation as 'Khoa' from specialities";
                cmd = new MySqlCommand(sql, con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable data = new DataTable();
                da.Fill(data);
                return data;
            }
            catch (MySqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public static bool CheckSpecialityHasRelationship(string id)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Select facilitiesdetails_id from facilitiesdetails where speciality_id=@id";
                cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);
                reader = cmd.ExecuteReader();
                return reader.HasRows;
            }
            catch (MySqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public static bool RemoveSpeciality(string id)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Delete from specialities where id=@id";
                cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);
                int count = cmd.ExecuteNonQuery();
                return count > 0;
            }
            catch (MySqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}
