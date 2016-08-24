using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //txtpostback.Text = Page.IsPostBack.ToString();
        if (!Page.IsPostBack)
        {
            Response.Write("true" + " <br />");
            DataSet mymember = new DataSet();
            mymember.ReadXml(Server.MapPath(@"XMLFile.xml"));
            //mymember.ReadXml("G:/workspace/website1/XMLFile.xml");
            member.DataSource = mymember.Tables[0];
            member.DataBind();

            initpage();
        }


    }
    protected void initpage()
    {
 
        txtartist.Text = txtcountry.Text = txtcompany.Text = txtpostback.Text = txtprice.Text = txttitle.Text = txtyear.Text = string.Empty;
    }
    protected void order_Click(object sender, EventArgs e)
    {
        if (member.Visible)
        {
            member.Visible = false;
        }
        else
        {
            member.Visible = true;
            
        }
        //txtpostback.Text = Page.IsPostBack.ToString();
        
        
    }
    protected void savexml_Click(object sender, EventArgs e)
    {
        XmlDocument myxml = new XmlDocument();
        String path = Server.MapPath(@"XMLFile.xml");
        myxml.Load(path);
        XmlNode root = myxml.SelectSingleNode("catalog");

        XmlElement elementcd = myxml.CreateElement("cd");
        root.AppendChild(elementcd);

        XmlElement elementtitle = myxml.CreateElement("title");
        elementtitle.InnerText = txttitle.Text;
        elementcd.AppendChild(elementtitle);

        XmlElement elementartist = myxml.CreateElement("artist");
        elementartist.InnerText = txtartist.Text;
        elementcd.AppendChild(elementartist);

        XmlElement elementcountry = myxml.CreateElement("country");
        elementcountry.InnerText = txtcountry.Text;
        elementcd.AppendChild(elementcountry);

        XmlElement elementcompany = myxml.CreateElement("company");
        elementcompany.InnerText = txtcompany.Text;
        elementcd.AppendChild(elementcompany);

        XmlElement elementprice = myxml.CreateElement("price");
        elementprice.InnerText = txtprice.Text;
        elementcd.AppendChild(elementprice);

        XmlElement elementyear = myxml.CreateElement("year");
        elementyear.InnerText = txtyear.Text;
        elementcd.AppendChild(elementyear);

        myxml.Save(path);
        //member.DataBind();
        Response.Redirect("Default.aspx");
    }
}