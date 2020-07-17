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
    public partial class SymptomManage : Form
    {
        static DataTable data;
        public SymptomManage()
        {
            InitializeComponent();
            txtID.Enabled = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var confirm = MessageBox.Show("Bạn có muốn xóa Triệu chứng này không?",
                                     "Xác nhận xóa!!",
                                     MessageBoxButtons.YesNo);
            if (confirm == DialogResult.Yes)
            {
                if (txtID.Text.Length != 0)
                {
                    string id = txtID.Text;
                    if (SymptomFunction.CheckSymptomHasRelationship(txtID.Text))
                    {
                        MessageBox.Show("Không thể xóa triệu chứng này vì có liên kết với bệnh viện.");
                        return;
                    }
                    bool result = SymptomFunction.RemoveSymptom(id);
                    if (result)
                    {
                        MessageBox.Show("Xóa triệu chứng thành công.");
                        SymptomManage_Load(sender, e);
                    }
                }
                else
                {
                    MessageBox.Show("Mã triệu chứng không được đễ trống!");
                    txtID.Focus();
                }
            }
            else
            {
                SymptomManage_Load(sender, e);
            }
        }

        private void SymptomManage_Load(object sender, EventArgs e)
        {
            data = SymptomFunction.LoadSymptom();
            dgvSymptom.DataSource = data;

            txtID.DataBindings.Clear();
            txtName.DataBindings.Clear();


            txtID.DataBindings.Add("Text", data, "id");
            txtName.DataBindings.Add("Text", data, "Triệu chứng");
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
    }
}
