using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace CarRentMS.Views
{
    public partial class Ragistration : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void funcon()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
                conn = new SqlConnection(conStr);
                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    // Response.Write("connection success");
                }
                else
                {
                    Response.Write("not connect");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        public void fnCustIns()
        {
            String yn = tbYn.Text;

            if (yn == "Yes")
            {
                try
                {
                    funcon();
                    string qry = "INSERT INTO CustomerTbl(CustName,CustAdd,CustPhone,CustPassword) values(@CustName,@CustAdd,@CustPhone,@CustPassword)";
                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@CustName", tbName.Text);
                    cmd.Parameters.AddWithValue("@CustAdd", tbEmail.Text);
                    cmd.Parameters.AddWithValue("@CustPhone", tbPhone.Text);
                    cmd.Parameters.AddWithValue("@CustPassword", tbPass.Text);

                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                        Response.Redirect("~/Views/Customer/Cars.aspx");
                    else
                        msg.InnerText = "not insert";
                    conn.Close();
                }
                catch (Exception ex)
                {
                    msg.InnerText = ex.ToString();
                }
            }
            else
            {
                lblMessage.Text = "● You Have No Licence, So You Arre Not Eligible For Cars!";
            }

            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            fnCustIns();
        }
    }
}