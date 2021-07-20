<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionMenu.aspx.cs" Inherits="Blog.GestionMenu" MasterPageFile="~/Gestion.Master"%>

<asp:Content runat="server" ContentPlaceHolderID="gestion">
    <form id="form1" runat="server">


        <div>
			<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IdM" DataSourceID="SqlDataSource1">
				<Columns>
					<asp:BoundField DataField="IdM" HeaderText="IdM" InsertVisible="False" ReadOnly="True" SortExpression="IdM" />
					<asp:BoundField DataField="nameM" HeaderText="nameM" SortExpression="nameM" />
					<asp:BoundField DataField="linkOrder" HeaderText="linkOrder" SortExpression="linkOrder" />
					<asp:CommandField ShowEditButton="True" />
					<asp:CommandField ShowDeleteButton="True" />
				</Columns>
			</asp:GridView>
        	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:blogConnectionString %>" SelectCommand="SELECT * FROM [menuLink]" UpdateCommand="update menuLink set nameM = @nameM ,linkOrder=@linkOrder where idM=@idM" DeleteCommand="delete from menuLink where idM=@idM"></asp:SqlDataSource>
        </div>



    	<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Lucida Sans" Font-Size="Large" ForeColor="#CC0000" Text="Name Menu"></asp:Label>
    	<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
		<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Lucida Sans" Font-Size="Large" ForeColor="#CC0000" Text="Link Order"></asp:Label>
		<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
		<asp:Button ID="Button1" runat="server" Text="Ajouter" OnClick="Button1_Click" />
    	<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
		<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="RegularExpressionValidator" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
    </form>
</asp:Content>