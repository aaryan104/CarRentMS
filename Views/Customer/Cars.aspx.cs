using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentMS.Views.Customer
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static String eml = String.Empty;
        public static String car;
        public static String RentDate;
        public static String RetDate;
        public static int fees;
        public static int DPrice;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["s_eml"]!=null)
            {
                eml = Session["s_eml"].ToString();
                fnFetchUser();
                fnFetchid();
            }
            else
            {
                Response.Redirect("~/Views/LoginCRMS.aspx");
            }
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
                Response.Write(ex.ToString());
            }
        }

        public void fnFetchUser()
        {
            funcon();
            String qry = "SELECT CustName FROM CustomerTbl WHERE CustAdd=@u_eml";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@u_eml", eml);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtName.Text = dr["CustName"].ToString();
            }
        }


        public void fnFetchid()
        {
            funcon();
            String qry = "SELECT CustId FROM CustomerTbl WHERE CustAdd=@u_eml";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@u_eml", eml);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                id.Text = dr["CustId"].ToString();
            }
        }

        public void fungrid()
        {
            try
            {
                funcon();
                String qry = "SELECT * from CarTbl WHERE Status='Available'";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                CarList.DataSource = ds;
                CarList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        public void updatecar() 
        {
            try
            {
                //Response.Write(CustId);
                funcon();
                String Status = "Booked";
                String qry = "UPDATE CarTbl SET Status=@Status WHERE Cplatenum=@Cplatenum";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@Status", Status);
                cmd.Parameters.AddWithValue("@Cplatenum", CarList.SelectedRow.Cells[1].Text);
                
                int res = cmd.ExecuteNonQuery();
                fungrid();
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }

        protected void CarList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = CarList.SelectedRow;

            //LNumber = rw.Cells[1].Text;
            car = rw.Cells[1].Text;
            //RentDate = System.DateTime.Today.Date.ToString();
            //RetDate = ReturnDate.Value;
            DPrice = Convert.ToInt32(rw.Cells[4].Text);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            TimeSpan DDays = Convert.ToDateTime(ReturnDate.Value) - DateTime.Today.Date;
            int Days = DDays.Days;
            int fees = DPrice * Days;   

            try
            {
                if (string.IsNullOrEmpty(car))
                {
                    msg.InnerText = "Missing Information";
                }
                else
                {
                    RentDate = DateTime.Now.ToString("yyyy-MM-dd");
                    RetDate = Convert.ToDateTime(ReturnDate.Value).ToString("yyyy-MM-dd");

                    funcon();
                    string qry = "INSERT INTO TblRent(Car,Customer,RentDate,ReturnDate,Fees) VALUES(@car,@Customer,@RentDate,@RetDate,@fees)";
                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@car", car);
                    cmd.Parameters.AddWithValue("@Customer", id.Text);
                    cmd.Parameters.AddWithValue("@RentDate", RentDate);
                    cmd.Parameters.AddWithValue("@RetDate", RetDate);
                    cmd.Parameters.AddWithValue("@fees", fees);

                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        msg.InnerText = "Car booked.";

                        updatecar();
                        fungrid();
                    }
                    else
                    {
                        msg.InnerText = "Car booking failed.";
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }
    }
}