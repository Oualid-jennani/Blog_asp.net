<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionPost.aspx.cs" Inherits="Blog.GestionPost" MasterPageFile="~/Gestion.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="gestion">
	<form runat="server" action="GestionPost.aspx">
    <div>
        <div>
            <asp:TextBox id="TextBox1" runat="server"></asp:TextBox>
            <asp:TextBox id="TextArea1" TextMode="multiline" Columns="50" Rows="5" runat="server" />
        
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>

        <asp:GridView ID="GridView1" runat="server" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Title" />
                <asp:BoundField DataField="content" HeaderText="Content" />
                <asp:BoundField DataField="image" HeaderText="Image" />
                <asp:BoundField DataField="dateP" HeaderText="Date Publier" />
                <asp:BoundField DataField="categryId" HeaderText="Category" />
                <asp:BoundField DataField="userId" HeaderText="user" />
                <asp:BoundField DataField="viewCount" HeaderText="Count view" />
                <asp:TemplateField HeaderText="Option">
                    <ItemTemplate>
                          <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick=" return confirm('are you sure?')" OnClick="LinkButton1_Click">delete</asp:LinkButton>
                          <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick=" return confirm('are you sure?')"  OnClick="LinkButton2_Click">edit</asp:LinkButton>
                          <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("idP") %>'  />
                    </ItemTemplate>
                </asp:TemplateField>
            
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </div>
    </form>

</asp:Content>

