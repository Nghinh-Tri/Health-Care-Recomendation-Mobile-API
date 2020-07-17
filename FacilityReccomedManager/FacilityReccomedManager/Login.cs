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
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string phone = txtPhone.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (phone.Trim().Length == 0 || password.Trim().Length == 0)
            {
                MessageBox.Show("Nhập số điện thoại và mật khẩu tương ứng!!");
                return;
            }
            if (UserFunction.checkLogin(phone, password))
            {
                string role = UserFunction.getRole(phone, password);
                if (role.Equals("admin"))
                {
                    this.Hide();
                    Thread t = new Thread(new ThreadStart(loadAdminForm));
                    t.Start();
                    this.Close();

                }
                else
                {
                    MessageBox.Show("số điện thoại hoặc mật khẩu sai!!");
                }
                
            }
            else
            {
                MessageBox.Show("số điện thoại hoặc mật khẩu sai!!");
            }
        }

        public void loadAdminForm()
        {
            Admin a = new Admin();
            Application.Run(a);
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
