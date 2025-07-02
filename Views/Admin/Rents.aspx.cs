using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CarRentMS.Views.Admin
{
    public partial class Rents : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static String car;
        public static int id;
        public static String date;

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
                Response.Write(ex.ToString());
            }
        }

        public void fungrid()
        {
            try
            {
                funcon();
                String qry = "SELECT * FROM TblRent";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                RentCar.DataSource = ds;
                RentCar.DataBind();
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
                String Status = "Available";
                String qry = "UPDATE CarTbl SET Status=@Status WHERE Cplatenum=@Cplatenum";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@Status", Status);
                cmd.Parameters.AddWithValue("@Cplatenum", RentCar.SelectedRow.Cells[2].Text);

                int res = cmd.ExecuteNonQuery();
                fungrid();
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }

        public void Deletecar()
        {
            try
            {
                //Response.Write(CustId);
                funcon();
                String qry = "Delete from TblRent WHERE Rentid=@rid";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@rid", RentCar.SelectedRow.Cells[1].Text);

                int res = cmd.ExecuteNonQuery();
                fungrid();
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }

        protected void Cars_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = RentCar.SelectedRow;

            car = rw.Cells[2].Text;
            id = Convert.ToInt32(rw.Cells[3].Text);
            date = DateTime.Now.ToString("yyyy-MM-dd");
        }

        protected void SaveBtn_Click1(object sender, EventArgs e)
        {
            try
            {
                funcon();
                string qry = "INSERT INTO ReturnTbl(Car,Customer,[Date],Delay,Fine) VALUES(@car,@Customer,@Date,@delay,@Fine)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@car", car);
                cmd.Parameters.AddWithValue("@Customer", id);
                cmd.Parameters.AddWithValue("@Date", date);
                cmd.Parameters.AddWithValue("@delay", txtDelay.Text);
                cmd.Parameters.AddWithValue("@Fine", txtFine.Text);

                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    msg.InnerText = "Car Returns.";

                    updatecar();
                    Deletecar();
                    fungrid();
                }
                else
                {
                    msg.InnerText = "Car Return failed";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }
        
    }
}