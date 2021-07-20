<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GstionUser.aspx.cs" Inherits="Blog.GstionUser" MasterPageFile="~/Gestion.Master"%>

<asp:Content runat="server" ContentPlaceHolderID="gestion">
	 <form id="form1" runat="server">
    <div>
    

        <table>
            <tr>
				<th>User ID </th>
                <th>User Name </th>
                <th>Password</th>
            </tr>
            <%
				foreach (var bl in users)
                {  %>

            <tr>
               
				  <td> <%=bl.IdB %></td>
                  <td> <%=bl.username %></td>
                  <td> <%=bl.pswrd %></td>
              
            </tr>

            <% } %>
        </table>
    </div>
       

        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" style="margin-right: 41px" Text="Insert" />
        <asp:TextBox ID="TextBox4" runat="server">Num Client</asp:TextBox>
        <asp:Button ID="Button2" runat="server" style="margin-bottom: 0px" Text="delete" />
        <asp:Button ID="Button3" runat="server" Text="update" />


		 <br /><br /><br /><br /><br /><br />



		 <input runat="server" type="text" id="UserName"/>
		 <input runat="server" type="text" id="Password"/><br />
		 <input runat="server" type="button" value="insert" onserverclick="Ajouter_Click"/>

		 <br />

		 <input runat="server" type="text" id="NumClient" value="Num Client"/>
		 <br />
		 <input runat="server" type="button" value="delete" id="delete" onserverclick="Delete_Click"/>
		 <input runat="server" type="button" value="update" id="update" onserverclick="Update_Click"/>


    </form>


</asp:Content>
