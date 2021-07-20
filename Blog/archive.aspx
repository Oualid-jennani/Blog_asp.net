<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="archive.aspx.cs" Inherits="Blog.WebForm2" MasterPageFile="~/Blog.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">

			<div class="main-content">

      		    <h2><a href="<%=Bg.menuLink.First().nameM%>.aspx">Archives for <%=anneArch[indexAnne] %></a></h2>

				<div class="navigation clearfix">

					<div><a href="?anne=<%=anneArch[indexAnne]%>_pres">&laquo; Older Entries</a></div>
					<div><a href="?anne=<%=anneArch[indexAnne]%>_suiv">Newer Entries &raquo; </a></div>

				</div>
				<ul class="archive">

				<%

					var ar = Bg.poste.ToList();
					foreach(var p in ar)
					{
						DateTime dt = DateTime.Parse(p.datePublication.ToString());

						if (dt.Year == anneArch[indexAnne])
						{%>
							<li>
								<div class="post-title"><a href="<%=Bg.menuLink.First().nameM%>.aspx"><%=p.title %></a></div>
								<div class="post-details">Posted on <a href="<%=Bg.menuLink.First().nameM%>.aspx"><%=dt.ToString("MMM") %> <%=dt.Day %>st, <%=dt.Year %></a> <span>|</span> Filed under <a href="<%=Bg.menuLink.First().nameM%>.aspx"><%=p.category.names %></a></div>
							</li>
						<%}

					}
			  %>
				</ul>


				<div class="navigation clear">
					<div><a href="?anne=<%=anneArch[indexAnne]%>_pres">&laquo; Older Entries</a></div>
					<div><a href="?anne=<%=anneArch[indexAnne]%>_suiv">Newer Entries &raquo; </a></div>
				</div>

            </div>

</asp:Content>