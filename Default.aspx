<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="jquery-1.6.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("table tr").click(function () {
                $("table tr").css("background-color", "white");
                $(".insertitem").css("background-color", "gray");
                $(this).css("background-color", "blue");
            });
            $("")
        });
        function text() {
            var a, n;
            a = document.getElementById("text");
            n = parseInt("<%=txtpostback.Text%>",10);
            //n = Number(a);
            if (!isNaN(n)) {
                a.innerHTML = "数字是<%=txtpostback.Text%>";
                return true;
            }
            else {
                alert("请输入一个数字");
                return false;
            }
        }
        function checkform() {
            var title = document.getElementById("txttitle").value;
            var artist = document.getElementById("txtartist").value;
            var country = document.getElementById("txtcountry").value;
            var company = document.getElementById("txtcompany").value;
            var price = document.getElementById("txtprice").value;
            var year = document.getElementById("txtyear").value;
            if (title == "" || artist == "" || country == "" || company == "" || price == "" || year == "") {
                alert("请输入完整的信息!!");
                return false;
            }
            if (isNaN(parseFloat(price)) || isNaN(parseInt(year, 10))) {
                alert("请输入数字");
                return false;
            }
            return true;    
        }
    </script>
    <title>learing</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="member" runat="server" Visible="False">
            <HeaderTemplate>
                <table border="1" cellpadding="1" id="membershow">
                    <tr>
                        <th>
                            Title
                        </th>
                        <th>
                            Artist
                        </th>
                        <th>
                            Country
                        </th>
                        <th>
                            Company
                        </th>
                        <th>
                            Price
                        </th>
                        <th>
                            Year
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["title"]%></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["artist"] %></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["country"] %></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["company"] %></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["price"] %></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["year"]%></td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="insertitem">
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["title"]%></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["artist"] %></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["country"] %></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["company"] %></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["price"] %></td>
                    <td><%# ((System.Data.DataRowView)Container.DataItem)["year"]%></td>
                </tr>                
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table><br />
            </FooterTemplate>
        </asp:Repeater>
        <div>
            <asp:Button ID="order" Text="排序" CssClass="mybutton" runat="server" OnClick="order_Click"/>
        </div>
    </div>
    <div>
        <asp:TextBox ID="txtpostback" runat="server" AutoPostBack="True"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="scripttext" runat="server" Text="测试脚本" OnClientClick="return text()" />
    </div>
    <div id="text" runat="server">
    </div>
    <div>
        titile: <asp:TextBox ID="txttitle" runat="server"></asp:TextBox>
        artist:<asp:TextBox ID="txtartist" runat="server"></asp:TextBox>
        country:<asp:TextBox ID="txtcountry" runat="server"></asp:TextBox>
        company:<asp:TextBox ID="txtcompany" runat="server"></asp:TextBox>
        price:<asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
        year:<asp:TextBox ID="txtyear" runat="server"></asp:TextBox><br />
        <asp:Button ID="savexml" runat="server" OnClientClick="return checkform()" 
            onclick="savexml_Click" Text="保存" />
    </div>
    </form>
</body>
</html>
