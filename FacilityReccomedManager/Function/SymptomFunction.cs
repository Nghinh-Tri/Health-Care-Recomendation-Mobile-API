using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;

namespace Function
{
    public static class SymptomFunction
    {
        static string connection = @"server=localhost;user id=root;database=healthcaredb;password=12345";
        static MySqlConnection con;
        static MySqlCommand cmd;
        static MySqlDataReader reader;

        public static DataTable LoadSymptom()
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "select id, translation as 'Triệu chứng' from symptoms";
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

        public static bool CheckSymptomHasRelationship(string id)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Select facilitiesdetails_id from facilitiesdetails where symptom_id=@id";
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

        public static bool RemoveSymptom(string id)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Delete from symptoms where id=@id";
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
