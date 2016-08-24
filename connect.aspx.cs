using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class connect : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionString = "server=.;database=mysql;user=sa;pwd=zolan123";
        SqlConnection conn = new SqlConnection(connectionString);
        SqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "select * from userinfo";
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                Response.Write(rd[0]+" "+rd[1]+" "+rd[3]+"\n");
            }
        }
        conn.Close();
    }
}