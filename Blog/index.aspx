<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Blog.index" MasterPageFile="~/Blog.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">


			 <%		
			
					 foreach (Blog.poste p in CTG)
					 { %>

								<article class="post">

         						<div class="primary">

									<h2><a href="blog.aspx?poste=<%=p.title %>"><%=p.title %></a></h2>

									<p class="post-info">
										<span>Filed under</span><a href="index.aspx"><%=p.category.names %></a>
									</p>
									 <div class="image-section">
              							<img src="<%=p.image %>" alt="image post" height="206" width="498"/>
         							</div>

									<%=p.content %>

									<p><a class="more" href="blog.aspx?poste=<%=p.title %>">continue reading &raquo;</a></p>


								</div>

								<aside>


									<% DateTime dt = DateTime.Parse(p.datePublication.ToString()); %>
            						<p class="dateinfo"> <%=dt.ToString("MMM") %><span><%=dt.Day %></span></p>

									<div class="post-meta">
               							<h4>Post Info</h4>
                  						<ul>
                     						<li class="user"><a href="#"><%=p.bloguser.username %></a></li>
											<li class="time"><a href="#"><%=dt.ToString("h:mm:ss tt") %></a></li>
											<li class="comment"><a href="#"><%=p.comment.Count %> Comments</a></li>
											<li class="permalink"><a href="#">Permalink</a></li>
										</ul>
									</div>

								</aside>

							</article>

					<% 
					}
			%>


</asp:Content>

