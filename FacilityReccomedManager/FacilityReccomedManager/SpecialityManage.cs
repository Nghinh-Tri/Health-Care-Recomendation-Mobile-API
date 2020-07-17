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
using Function;

namespace FacilityReccomedManager
{
    public partial class SpecialityManage : Form
    {
        static DataTable data;
        public SpecialityManage()
        {
            InitializeComponent();
            txtID.Enabled = false;
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
            Admin g = new Admin();
            Application.Run(g);
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnRemove_Click(object sender, EventArgs e)
        {
            var confirm = MessageBox.Show("Bạn có muốn xóa Khoa này không?",
                                     "Xác nhận xóa!!",
                                     MessageBoxButtons.YesNo);
            if (confirm == DialogResult.Yes)
            {
                if (txtID.Text.Length != 0)
                {
                    string id = txtID.Text;
                    if (SpecialityFunction.CheckSpecialityHasRelationship(txtID.Text))
                    {
                        MessageBox.Show("Không thể xóa Khoa này vì đã có liên kết với bênh viện.");
                        return;
                    }
                    bool result = SpecialityFunction.RemoveSpeciality(id);
                    if (result)
                    {
                        MessageBox.Show("Xóa Khoa thành công.");
                        SpecialityManage_Load(sender, e);
                    }
                }
                else
                {
                    MessageBox.Show("Mã Khoa không được để trống!");
                    txtID.Focus();
                }
            }
            else
            {
                SpecialityManage_Load(sender, e);
            }
        }

        private void SpecialityManage_Load(object sender, EventArgs e)
        {
            data = SpecialityFunction.LoadSpeciality();
            dgvSpeciality.DataSource = data;

            txtID.DataBindings.Clear();
            txtName.DataBindings.Clear();


            txtID.DataBindings.Add("Text", data, "id");
            txtName.DataBindings.Add("Text", data, "Khoa");
        }
    }
}
