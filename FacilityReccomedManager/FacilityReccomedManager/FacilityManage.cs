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
using System.Drawing.Drawing2D;
using System.IO;
using System.Drawing.Imaging;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Net;
using System.Web;

namespace FacilityReccomedManager
{
    public partial class FacilityManage : Form
    {
        static DataTable data;
        public FacilityManage()
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

        private void btnRemove_Click(object sender, EventArgs e)
        {
            var confirm = MessageBox.Show("Bạn có muốn xóa cơ sở này không?",
                                     "Xác nhận xóa!!",
                                     MessageBoxButtons.YesNo);
            if (confirm == DialogResult.Yes)
            {
                if (txtID.Text.Length != 0)
                {
                    string id = txtID.Text;
                    if (FacilityFunction.CheckFacilityHasRelationship(txtID.Text))
                    {
                        MessageBox.Show("Không thể xóa cơ sở này vì có liên kết với triệu chứng hoặc khoa.");
                        return;
                    }
                    bool result = FacilityFunction.RemoveFacility(id);
                    if (result)
                    {
                        MessageBox.Show("Xóa cơ sở thành công.");
                        FacilityManage_Load(sender, e);
                    }
                }
                else
                {
                    MessageBox.Show("Mã sơ sở không được đễ trống!");
                    txtID.Focus();
                }
            }
            else
            {
                FacilityManage_Load(sender, e);
            }
        }

        private void FacilityManage_Load(object sender, EventArgs e)
        {
            data = FacilityFunction.LoadFacility();
            dgvFacility.DataSource = data;

            txtID.DataBindings.Clear();
            txtName.DataBindings.Clear();
            txtAddress.DataBindings.Clear();
            txtPhone.DataBindings.Clear();
            txtUrl.DataBindings.Clear();


            txtID.DataBindings.Add("Text", data, "id");
            txtName.DataBindings.Add("Text", data, "Tên");
            txtAddress.DataBindings.Add("Text", data, "Địa chỉ");
            txtPhone.DataBindings.Add("Text", data, "Số điện thoại");
            txtUrl.DataBindings.Add("Text", data, "image");
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            var confirm = MessageBox.Show("Bạn có muốn sửa thông tin cơ sở này không?",
                                     "Xác nhận sửa!!",
                                     MessageBoxButtons.YesNo);
            if (confirm == DialogResult.Yes)
            {
                if (txtID.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Mã cơ sở không được để trống!");
                    txtID.Focus();
                    return;
                }

                if (txtName.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Tên cơ sở không được để trống!");
                    txtName.Focus();
                    return;
                }

                if (txtAddress.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Địa chỉ cơ sở không được để trống!");
                    txtAddress.Focus();
                    return;
                }

                if (txtPhone.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Số điện thoại cơ sở không được để trống!");
                    txtPhone.Focus();
                    return;
                }
                Facilities facility = new Facilities
                {
                    id = int.Parse(txtID.Text),
                    name = txtName.Text,
                    address = txtAddress.Text,
                    phone = txtPhone.Text

                };
                bool result = FacilityFunction.UpdateFacility(facility); ;
                if (result)
                {
                    MessageBox.Show("Cập nhật thành công.");
                    FacilityManage_Load(sender, e);
                }
            }
            else
            {

            }
        }

        private void btnInfo_Click(object sender, EventArgs e)
        {
            FacilityInformation();
            this.Hide();
            this.Close();
        }

        private void FacilityInformation()
        {
            FacilityDetail g = new FacilityDetail(txtID.Text, txtName.Text);
            g.ShowDialog();
        }

        private void txtUrlChanged(object sender, EventArgs e)
        {
            var base64Data = Regex.Match(txtUrl.Text, @"data:image/(?<type>.+?),(?<data>.+)").Groups["data"].Value;
            var binData = Convert.FromBase64String(base64Data);
            using (var stream = new MemoryStream(binData))
            {
                ptbImage.Image = new Bitmap(stream);
            };
        }
    }
}
