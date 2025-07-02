using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace CarRentMS.Views.Admin
{
    public partial class Customer : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int CustId;

        protected void Page_Load(object sender, EventArgs e)
        {
            fungrid();
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
                msg.InnerText = ex.ToString();
            }
        }


        public void fungrid()
        {
            try
            {
                funcon();
                String qry = "SELECT * from CustomerTbl";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                CustomerList.DataSource = ds;
                CustomerList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }


        protected void add_Click(object sender, EventArgs e)
        {
            try
            {
                funcon();
                string qry = "INSERT INTO CustomerTbl(CustName,CustAdd,CustPhone,CustPassword) values(@CustName,@CustAdd,@CustPhone,@CustPassword)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@CustName", NameTb.Value);
                cmd.Parameters.AddWithValue("@CustAdd", AddTb.Value);
                cmd.Parameters.AddWithValue("@CustPhone", PhoneTb.Value);
                cmd.Parameters.AddWithValue("@CustPassword", PasswordTb.Value);

                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                    msg.InnerText = "data insert";
                else
                    msg.InnerText = "not insert";
                conn.Close();
                fungrid();
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }
        protected void CustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = CustomerList.SelectedRow;
            CustId = Convert.ToInt32(rw.Cells[1].Text);
            NameTb.Value = rw.Cells[2].Text;
            AddTb.Value = rw.Cells[3].Text;
            PhoneTb.Value = rw.Cells[4].Text;
            PasswordTb.Value = rw.Cells[5].Text;
            
        }

     
        protected void edit_Click(object sender, EventArgs e)
        {
            
            try
            {
                //Response.Write(CustId);
                funcon();

                String qry = "UPDATE CustomerTbl SET CustName=@CustName,CustAdd=@CustAdd,CustPhone=@CustPhone,CustPassword=@CustPassword WHERE CustId=@CustId";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@CustName", NameTb.Value);
                cmd.Parameters.AddWithValue("@CustAdd", AddTb.Value);
                cmd.Parameters.AddWithValue("@CustPhone", PhoneTb.Value);
                cmd.Parameters.AddWithValue("@CustPassword", PasswordTb.Value);
                cmd.Parameters.AddWithValue("@CustId", CustId);

                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    msg.InnerText = "Data Update!";
                }
                else
                {
                    msg.InnerText = "Data not Update!";
                    conn.Close();
                }
                fungrid();
            }
            catch (Exception ex)
            {

                msg.InnerText = ex.ToString();

            }
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            

            try
            {
                funcon();
                String qry = "DELETE FROM CustomerTbl WHERE CustId=@CustID";
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("CustId", CustId);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    msg.InnerText = "Data Removed!";
                }
                else
                {
                    msg.InnerText = "Data not Removed!";
                    conn.Close();
                }
                fungrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

    }
}