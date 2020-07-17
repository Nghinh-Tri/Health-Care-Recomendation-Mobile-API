namespace FacilityReccomedManager
{
    partial class Admin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnLogout = new System.Windows.Forms.Button();
            this.btnSpecciality = new System.Windows.Forms.Button();
            this.btnFacility = new System.Windows.Forms.Button();
            this.btnSymptom = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnLogout
            // 
            this.btnLogout.Image = global::FacilityReccomedManager.Properties.Resources.exit_100px;
            this.btnLogout.Location = new System.Drawing.Point(726, -1);
            this.btnLogout.Name = "btnLogout";
            this.btnLogout.Size = new System.Drawing.Size(75, 69);
            this.btnLogout.TabIndex = 3;
            this.btnLogout.UseVisualStyleBackColor = true;
            this.btnLogout.Click += new System.EventHandler(this.btnLogout_Click);
            // 
            // btnSpecciality
            // 
            this.btnSpecciality.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSpecciality.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btnSpecciality.Image = global::FacilityReccomedManager.Properties.Resources.rsz_medical_specialties;
            this.btnSpecciality.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnSpecciality.Location = new System.Drawing.Point(285, 87);
            this.btnSpecciality.Name = "btnSpecciality";
            this.btnSpecciality.Size = new System.Drawing.Size(239, 290);
            this.btnSpecciality.TabIndex = 2;
            this.btnSpecciality.Text = "Khoa";
            this.btnSpecciality.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnSpecciality.UseVisualStyleBackColor = true;
            this.btnSpecciality.Click += new System.EventHandler(this.btnSpecciality_Click);
            // 
            // btnFacility
            // 
            this.btnFacility.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFacility.Image = global::FacilityReccomedManager.Properties.Resources.rsz_rural_hospital_access;
            this.btnFacility.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnFacility.Location = new System.Drawing.Point(549, 87);
            this.btnFacility.Name = "btnFacility";
            this.btnFacility.Size = new System.Drawing.Size(239, 290);
            this.btnFacility.TabIndex = 1;
            this.btnFacility.Text = "Cơ sở Y tế";
            this.btnFacility.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnFacility.UseVisualStyleBackColor = true;
            this.btnFacility.Click += new System.EventHandler(this.btnFacility_Click);
            // 
            // btnSymptom
            // 
            this.btnSymptom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSymptom.Image = global::FacilityReccomedManager.Properties.Resources.symptom_1_826300;
            this.btnSymptom.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnSymptom.Location = new System.Drawing.Point(12, 87);
            this.btnSymptom.Name = "btnSymptom";
            this.btnSymptom.Size = new System.Drawing.Size(239, 290);
            this.btnSymptom.TabIndex = 0;
            this.btnSymptom.Text = "Triệu chứng";
            this.btnSymptom.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnSymptom.UseVisualStyleBackColor = true;
            this.btnSymptom.Click += new System.EventHandler(this.btnSymptom_Click);
            // 
            // Admin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnLogout);
            this.Controls.Add(this.btnSpecciality);
            this.Controls.Add(this.btnFacility);
            this.Controls.Add(this.btnSymptom);
            this.Name = "Admin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Admin";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnSymptom;
        private System.Windows.Forms.Button btnFacility;
        private System.Windows.Forms.Button btnSpecciality;
        private System.Windows.Forms.Button btnLogout;
    }
}