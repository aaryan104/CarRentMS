using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentMS.Views.Admin
{
    public partial class Cars : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
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
                String qry = "SELECT * from CarTbl";
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
                msg.InnerText = ex.ToString();

            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            try
            {
                funcon();
                string qry = "INSERT INTO CarTbl(CPlateNum,Brand,Model,Price,Color,Status) values(@CPlateNum,@Brand,@Model,@Price,@Color,@Status)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@CPlateNum", LNumberTb.Value);
                cmd.Parameters.AddWithValue("@Brand", BrandTb.Value);
                cmd.Parameters.AddWithValue("@Model", ModelTb.Value);
                cmd.Parameters.AddWithValue("@Price", PriceTb.Value);
                cmd.Parameters.AddWithValue("@Color", ColorTb.Value);
                cmd.Parameters.AddWithValue("@Status", AvailableCb.SelectedValue);

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

        protected void CarList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = CarList.SelectedRow;
            LNumberTb.Value = rw.Cells[1].Text;
            BrandTb.Value = rw.Cells[2].Text;
            ModelTb.Value = rw.Cells[3].Text;
            PriceTb.Value = rw.Cells[4].Text;
            ColorTb.Value = rw.Cells[5].Text;
            AvailableCb.SelectedValue = rw.Cells[6].Text;

        }
        protected void edit_Click(object sender, EventArgs e)
        {
            String CPlateNum = LNumberTb.Value.ToString();
            try
            {
                funcon();

                String qry = "UPDATE CarTbl SET Brand=@Brand,Model=@Model,Price=@Price,Color=@Color,Status=@Status WHERE CPlateNum=@CPlateNum";
                cmd = new SqlCommand(qry, conn);

                cmd.Parameters.AddWithValue("@Brand", BrandTb.Value);
                cmd.Parameters.AddWithValue("@Model", ModelTb.Value);
                cmd.Parameters.AddWithValue("@Price", PriceTb.Value);
                cmd.Parameters.AddWithValue("@Color", ColorTb.Value);
                cmd.Parameters.AddWithValue("@Status", AvailableCb.SelectedValue);
                cmd.Parameters.AddWithValue("@CPlateNum", CPlateNum);

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

            String CPlateNum = LNumberTb.Value.ToString();

            try
            {
                funcon();
                String qry = "DELETE FROM CarTbl WHERE CPlateNum=@CPlateNum";
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("CPlateNum", CPlateNum);
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