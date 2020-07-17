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
    public partial class Admin : Form
    {
        public Admin()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnSymptom_Click(object sender, EventArgs e)
        {
            Thread t = new Thread(new ThreadStart(Symptom));
            t.Start();
            this.Hide();
            this.Close();
        }

        private void btnSpecciality_Click(object sender, EventArgs e)
        {
            Thread t = new Thread(new ThreadStart(Speciality));
            t.Start();
            this.Hide();
            this.Close();
        }

        private void btnFacility_Click(object sender, EventArgs e)
        {
            Thread t = new Thread(new ThreadStart(Facility));
            t.Start();
            this.Hide();
            this.Close();
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            var confirm = MessageBox.Show("Bạn có muốn đăng xuất không?",
                                     "Xác nhận xóa!!",
                                     MessageBoxButtons.YesNo);
            if (confirm == DialogResult.Yes)
            {
                Thread t = new Thread(new ThreadStart(Logout));
                t.Start();
                this.Hide();
                this.Close();
            }
            else
            {

            }
        }

        private void Logout()
        {
            Login g = new Login();
            Application.Run(g);
        }

        private void Symptom()
        {
            SymptomManage g = new SymptomManage();
            Application.Run(g);
        }

        private void Facility()
        {
            FacilityManage g = new FacilityManage();
            Application.Run(g);
        }

        private void Speciality()
        {
            SpecialityManage g = new SpecialityManage();
            Application.Run(g);
        }
    }
}
