using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Function
{
    public class FacilityFunction
    {
        static string connection = @"server=localhost;user id=root;database=healthcaredb;password=12345";
        static MySqlConnection con;
        static MySqlCommand cmd;
        static MySqlDataReader reader;

        public static DataTable LoadFacility()
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "select id, name as 'Tên', address as 'Địa chỉ', phone as 'Số điện thoại', image from facilities";
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


        public static bool CheckFacilityHasRelationship(string id)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Select facilitiesdetails_id from facilitiesdetails where facility_id=@id";
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

        public static bool RemoveFacility(string id)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Delete from facilities where id=@id";
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

        public static bool UpdateFacility(Facilities fac)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Update facilities set name=@name, address=@address, phone=@phone where id=@id";
                cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", fac.id);
                cmd.Parameters.AddWithValue("@name", fac.name);
                cmd.Parameters.AddWithValue("@address", fac.address);
                cmd.Parameters.AddWithValue("@phone", fac.phone);

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

        public static DataTable LoadSpecialityInFacility(string faciId)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "SELECT distinct spec.id, spec.translation as 'Khoa' FROM facilitiesdetails facd, specialities spec where facd.speciality_id = spec.id and facility_id=@id";
                cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", faciId);
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

        public static DataTable LoadSymptomInFacility(string faciId, string SpecId)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "SELECT symp.id, symp.translation as 'Triệu chứng' FROM facilitiesdetails facd, specialities spec, symptoms symp where facd.speciality_id = spec.id and facd.symptom_id = symp.id and facility_id = @id and spec.id = @specId";
                cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", faciId);
                cmd.Parameters.AddWithValue("@specId", SpecId);
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

        public static bool RemoveSpeciality(string id)
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Delete from facilitiesdetails where speciality_id=@id";
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

        public static bool RemoveSymptom(string faciId, string specID, string sympID )
        {
            try
            {
                con = new MySqlConnection(connection);
                con.Open();
                string sql = "Delete from facilitiesdetails where facility_id=@faciID and speciality_id=@specID and symptom_id=@sympId";
                cmd = new MySqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@faciID", faciId);
                cmd.Parameters.AddWithValue("@specID", specID);
                cmd.Parameters.AddWithValue("@sympId", sympID);
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
