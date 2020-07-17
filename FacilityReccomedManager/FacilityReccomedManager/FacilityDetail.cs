using Function;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FacilityReccomedManager
{
    public partial class FacilityDetail : Form
    {
        static DataTable data;
        static DataTable data2;
        public FacilityDetail(string faciId, string faciName)
        {
            InitializeComponent();
            txtID.Enabled = false;
            txtName.Enabled = false;
            txtSpecID.Enabled = false;
            txtSymptom.Enabled = false;
            txtID.Text = faciId;
            txtName.Text = faciName;
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            Thread t = new Thread(new ThreadStart(Back));
            t.Start();
            this.Hide();
            this.Close();
        }

        private void Back()
        {
            FacilityManage g = new FacilityManage();
            Application.Run(g);
        }

        private void FacilityDetail_Load(object sender, EventArgs e)
        {
            data = FacilityFunction.LoadSpecialityInFacility(txtID.Text);
            dgvSpeciality.DataSource = data;
            txtSpecID.DataBindings.Clear();
            txtSpecID.DataBindings.Add("Text", data, "id");

        }

        private void dgvSpeciality_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            data2 = FacilityFunction.LoadSymptomInFacility(txtID.Text, txtSpecID.Text);
            dgvSymptom.DataSource = data2;
        }

        private void btnRemoveSpec_Click(object sender, EventArgs e)
        {
            var confirm = MessageBox.Show("Bạn có muốn tất cả các mối quan hệ của Khoa này với cơ sở Y tế này không?",
                                     "Xác nhận xóa!!",
                                     MessageBoxButtons.YesNo);
            if (confirm == DialogResult.Yes)
            {
                if (txtSpecID.Text.Length != 0)
                {
                    string id = txtSpecID.Text;
                    bool result = FacilityFunction.RemoveSpeciality(id);
                    if (result)
                    {
                        MessageBox.Show("Xóa quan hệ thành công.");
                        FacilityDetail_Load(sender, e);
                    }
                }
                else
                {
                    MessageBox.Show("Mã Khoa không được đễ trống!");
                    txtID.Focus();
                }
            }
            else
            {
                FacilityDetail_Load(sender, e);
            }
        }

        private void btnRemoveSymp_Click(object sender, EventArgs e)
        {
            var confirm = MessageBox.Show("Bạn có muốn tất cả các mối quan hệ của triệu chứng được chọn với cơ sở Y tế này không?",
                                     "Xác nhận xóa!!",
                                     MessageBoxButtons.YesNo);
            if (confirm == DialogResult.Yes)
            {
                if (txtSymptom.Text.Length != 0)
                {
                    string faciId = txtID.Text;
                    string specId = txtSpecID.Text;
                    string sympId = txtSymptom.Text;
                    bool result = FacilityFunction.RemoveSymptom(faciId, specId,sympId);
                    if (result)
                    {
                        MessageBox.Show("Xóa quan hệ thành công.");
                        FacilityDetail_Load(sender, e);
                    }
                }
                else
                {
                    MessageBox.Show("Mã Khoa không được đễ trống!");
                    txtID.Focus();
                }
            }
            else
            {
                FacilityDetail_Load(sender, e);
            }
        }

        private void dgvSymptom_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtSymptom.DataBindings.Clear();
            txtSymptom.DataBindings.Add("Text", data2, "id");
        }

        private void txtSymptom_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void dgvSpeciality_CellContentClick(object sender, EventArgs e)
        {
            data2 = FacilityFunction.LoadSymptomInFacility(txtID.Text, txtSpecID.Text);
            dgvSymptom.DataSource = data2;
        }
    }
}
