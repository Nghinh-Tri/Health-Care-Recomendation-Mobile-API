namespace FacilityReccomedManager
{
    partial class FacilityDetail
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
            this.btnBack = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dgvSpeciality = new System.Windows.Forms.DataGridView();
            this.dgvSymptom = new System.Windows.Forms.DataGridView();
            this.txtID = new System.Windows.Forms.TextBox();
            this.txtName = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.txtSpecID = new System.Windows.Forms.TextBox();
            this.btnRemoveSpec = new System.Windows.Forms.Button();
            this.btnRemoveSymp = new System.Windows.Forms.Button();
            this.txtSymptom = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSpeciality)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSymptom)).BeginInit();
            this.SuspendLayout();
            // 
            // btnBack
            // 
            this.btnBack.Image = global::FacilityReccomedManager.Properties.Resources.go_back_16px;
            this.btnBack.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBack.Location = new System.Drawing.Point(915, 15);
            this.btnBack.Margin = new System.Windows.Forms.Padding(4);
            this.btnBack.Name = "btnBack";
            this.btnBack.Size = new System.Drawing.Size(93, 38);
            this.btnBack.TabIndex = 7;
            this.btnBack.Text = "Quay lại";
            this.btnBack.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBack.UseVisualStyleBackColor = true;
            this.btnBack.Click += new System.EventHandler(this.btnBack_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.label1.Location = new System.Drawing.Point(187, 89);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(92, 16);
            this.label1.TabIndex = 8;
            this.label1.Text = "Mã  cơ sở Y tế";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.SystemColors.Control;
            this.label2.Location = new System.Drawing.Point(187, 140);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(94, 16);
            this.label2.TabIndex = 9;
            this.label2.Text = "Tên cơ sở Y tế";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // dgvSpeciality
            // 
            this.dgvSpeciality.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSpeciality.Location = new System.Drawing.Point(107, 214);
            this.dgvSpeciality.Margin = new System.Windows.Forms.Padding(4);
            this.dgvSpeciality.Name = "dgvSpeciality";
            this.dgvSpeciality.Size = new System.Drawing.Size(244, 293);
            this.dgvSpeciality.TabIndex = 10;
            this.dgvSpeciality.DataSourceChanged += new System.EventHandler(this.dgvSpeciality_CellContentClick);
            this.dgvSpeciality.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvSpeciality_CellContentClick);
            // 
            // dgvSymptom
            // 
            this.dgvSymptom.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSymptom.Location = new System.Drawing.Point(511, 214);
            this.dgvSymptom.Margin = new System.Windows.Forms.Padding(4);
            this.dgvSymptom.Name = "dgvSymptom";
            this.dgvSymptom.Size = new System.Drawing.Size(244, 293);
            this.dgvSymptom.TabIndex = 11;
            this.dgvSymptom.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvSymptom_CellContentClick);
            // 
            // txtID
            // 
            this.txtID.Location = new System.Drawing.Point(308, 89);
            this.txtID.Margin = new System.Windows.Forms.Padding(4);
            this.txtID.Name = "txtID";
            this.txtID.Size = new System.Drawing.Size(75, 22);
            this.txtID.TabIndex = 12;
            // 
            // txtName
            // 
            this.txtName.Location = new System.Drawing.Point(308, 140);
            this.txtName.Margin = new System.Windows.Forms.Padding(4);
            this.txtName.Name = "txtName";
            this.txtName.Size = new System.Drawing.Size(301, 22);
            this.txtName.TabIndex = 13;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.SystemColors.Control;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Red;
            this.label3.Location = new System.Drawing.Point(185, 180);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 25);
            this.label3.TabIndex = 14;
            this.label3.Text = "Khoa";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.SystemColors.Control;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Red;
            this.label4.Location = new System.Drawing.Point(564, 180);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(137, 25);
            this.label4.TabIndex = 15;
            this.label4.Text = "Triệu chứng";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.Red;
            this.label5.Location = new System.Drawing.Point(335, 15);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(274, 31);
            this.label5.TabIndex = 16;
            this.label5.Text = "Thông tin cơ sở Y tế";
            // 
            // txtSpecID
            // 
            this.txtSpecID.Location = new System.Drawing.Point(264, 321);
            this.txtSpecID.Margin = new System.Windows.Forms.Padding(4);
            this.txtSpecID.Name = "txtSpecID";
            this.txtSpecID.Size = new System.Drawing.Size(45, 22);
            this.txtSpecID.TabIndex = 17;
            // 
            // btnRemoveSpec
            // 
            this.btnRemoveSpec.BackColor = System.Drawing.Color.AntiqueWhite;
            this.btnRemoveSpec.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRemoveSpec.ForeColor = System.Drawing.Color.Red;
            this.btnRemoveSpec.Location = new System.Drawing.Point(837, 286);
            this.btnRemoveSpec.Margin = new System.Windows.Forms.Padding(4);
            this.btnRemoveSpec.Name = "btnRemoveSpec";
            this.btnRemoveSpec.Size = new System.Drawing.Size(171, 57);
            this.btnRemoveSpec.TabIndex = 18;
            this.btnRemoveSpec.Text = "Xóa Khoa";
            this.btnRemoveSpec.UseVisualStyleBackColor = false;
            this.btnRemoveSpec.Click += new System.EventHandler(this.btnRemoveSpec_Click);
            // 
            // btnRemoveSymp
            // 
            this.btnRemoveSymp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRemoveSymp.ForeColor = System.Drawing.Color.Red;
            this.btnRemoveSymp.Location = new System.Drawing.Point(837, 386);
            this.btnRemoveSymp.Margin = new System.Windows.Forms.Padding(4);
            this.btnRemoveSymp.Name = "btnRemoveSymp";
            this.btnRemoveSymp.Size = new System.Drawing.Size(171, 57);
            this.btnRemoveSymp.TabIndex = 19;
            this.btnRemoveSymp.Text = "Xóa triệu chứng";
            this.btnRemoveSymp.UseVisualStyleBackColor = true;
            this.btnRemoveSymp.Click += new System.EventHandler(this.btnRemoveSymp_Click);
            // 
            // txtSymptom
            // 
            this.txtSymptom.Location = new System.Drawing.Point(610, 351);
            this.txtSymptom.Name = "txtSymptom";
            this.txtSymptom.Size = new System.Drawing.Size(37, 22);
            this.txtSymptom.TabIndex = 20;
            this.txtSymptom.TextChanged += new System.EventHandler(this.txtSymptom_TextChanged);
            // 
            // FacilityDetail
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.ClientSize = new System.Drawing.Size(1067, 554);
            this.Controls.Add(this.dgvSymptom);
            this.Controls.Add(this.btnRemoveSymp);
            this.Controls.Add(this.btnRemoveSpec);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtName);
            this.Controls.Add(this.txtID);
            this.Controls.Add(this.dgvSpeciality);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnBack);
            this.Controls.Add(this.txtSpecID);
            this.Controls.Add(this.txtSymptom);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FacilityDetail";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FacilityDetail";
            this.Load += new System.EventHandler(this.FacilityDetail_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSpeciality)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSymptom)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnBack;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dgvSpeciality;
        private System.Windows.Forms.DataGridView dgvSymptom;
        private System.Windows.Forms.TextBox txtID;
        private System.Windows.Forms.TextBox txtName;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtSpecID;
        private System.Windows.Forms.Button btnRemoveSpec;
        private System.Windows.Forms.Button btnRemoveSymp;
        private System.Windows.Forms.TextBox txtSymptom;
    }
}