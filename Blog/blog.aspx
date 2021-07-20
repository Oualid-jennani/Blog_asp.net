<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="Blog.WebForm1" MasterPageFile="~/Blog.Master" %>


<asp:Content runat="server" ContentPlaceHolderID="Main">
            		 <%		
						 string title = Request.Params.Get("poste");
						 if(title != "" && title != null)
						 {
							 
							 var p = Bg.poste.Where(x => x.title == title).First();
							 p.viewCount++;

							 %>

								<article class="post">

         						<div class="primary">

									<h2><a href="index.aspx"><%=p.title %></a></h2>

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

							<div class="post-bottom-section">
								<h4><%=p.comment.Count() %></h4>
								<div class="primary">

            						<ol class="commentlist">

											<li class="depth-1">

												<%foreach(var com in p.comment)
												{%>
													<div class="comment-info">
													<img alt="" src="images/gravatar.jpg" class="avatar" height="42" width="42" />
													<cite>
														<a href="index.html"><%=com.nameCom %>.</a> Says: <br />
														<span class="comment-data"><a href="#comment-63" title="">January 31st, 2010 at 10:00 pm</a></span>
													</cite>
												</div>

												<div class="comment-text">
													<p><%=com.messageC %></p>

													<div class="reply">
														<a rel="nofollow" class="comment-reply-link" href="index.html">Reply</a>
		 											</div>
												</div>

												<%}
												%>
											</li>
										</ol>

									</div>

								</div>





	
						 <div class="post-bottom-section">

							<h4>Leave a Reply</h4>

							<div class="primary">

            					<form action="blog.aspx?btn=1&id=<%=p.idp %>" method="post" id="commentform">

               						<div>
										<label for="name">Name <span>*</span></label>
										<input id="name" name="name" value="Your Name" type="text" tabindex="1" />
									</div>
									<div>
										<label for="email">Email Address <span>*</span></label>
										<input id="email" name="email" value="Your Email" type="text" tabindex="2" />
									</div>
									<div>
										<label for="website">Website</label>
										<input id="website" name="website" value="Your Website" type="text" tabindex="3" />
									</div>
									<div>
										<label for="message">Your Message <span>*</span></label>
										<textarea id="message" name="message" rows="10" cols="18" tabindex="4"></textarea>
									</div>
									<div class="no-border">
										<input class="button" type="submit" value="Submit Comment" tabindex="5" />
									</div>

							   </form>

							</div>

						 </div>

					<% 
					}
			%>
</asp:Content>
