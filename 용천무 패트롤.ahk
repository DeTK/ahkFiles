using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp4
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void textbox_text(object sender, EventArgs e)
        {
            try
            {
                label1.Text = (int.Parse(textBox1.Text) + int.Parse(textBox2.Text)).ToString();
            }
            catch { }
        }
        private void textbox1_text(object sender, EventArgs e)
        {
            try
            {
                label2.Text = (int.Parse(textBox3.Text) - int.Parse(textBox4.Text)).ToString();
            }
            catch { }
        }
        private void textbox2_text(object sender, EventArgs e)
        {
            try
            {
                label3.Text = (int.Parse(textBox5.Text) * int.Parse(textBox6.Text)).ToString();
            }
                catch { }
        }
        private void textbox3_text(object sender, EventArgs e)
        {
            try
            {
                label4.Text = (int.Parse(textBox7.Text) / int.Parse(textBox8.Text)).ToString();
            }
            catch { }
        }
    }
}
