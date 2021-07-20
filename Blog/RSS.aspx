<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RSS.aspx.cs" Inherits="Blog.RSS" MasterPageFile="~/Blog.Master"%>

<asp:Content runat="server" ContentPlaceHolderID="Main">

<?xml version="1.0" encoding="utf-8" ?>
<rss version="2.0">
	<channel>
		<title>Le nom de votre site web</title>
		<link>http://www.lien de votre site.com</link>
		<description>Description de votre site</description>


		<asp:Repeater ID="RepeaterRSS" runat="server">
	<HeaderTemplate>
		<rss version="2.0">
		<channel>
		<title>Liste Postes</title>
		<link>http://www.tdi.com</link>
		<description>Ceci est le site de TDI</description>
	</HeaderTemplate>

		<ItemTemplate>
		<poste>
			<title><%# Eval("Title")%></title>
			<content><%# Eval("content")%></content>
			<images><%# Eval("images")%></images>
			<datePublication><%# Eval("datePublication")%></datePublication>
			<viewCount><%# Eval("viewCount")%></viewCount>
		</poste>
		</ItemTemplate>

	<FooterTemplate>
		</channel>
		</rss>
	</FooterTemplate>
		</asp:Repeater>

	</channel>
</rss>



</asp:Content>
