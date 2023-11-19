<%@ page import="java.util.ArrayList" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie Index table</title>
</head>
<body>
	<h1>Popular Films Display</h1>
	<hr /> <br />
	<h4>Choose a movie to display.</h4>
	<form>
		<input type="checkbox" name="moviesCheck" value="Star Wars">Star Wars <br />
		<input type="checkbox" name="moviesCheck" value="Godzilla">Godzilla <br />
		<input type="checkbox" name="moviesCheck" value="Alien">Alien <br />
		<input type="checkbox" name="moviesCheck" value="Twister">Twister <br />
		<input type="checkbox" name="moviesCheck" value="War of the Worlds">War Of The Worlds <br />
		<input type="checkbox" name="moviesCheck" value="Close Encounters of the Third Kind">Close Encounters of the Third Kind <br />
		<input type="submit" value="Submit">
	</form>
	<!-- create book objects and array list for storing values -->
		
		<%
			class movie {
				String title;
				String director;
				int year;
				
				movie(String title, String director, int year){
					this.title = title;
					this.director = director;
					this.year = year;
				}
			}
			movie starWars = new movie("Star Wars", "George Lucas", 1977);
			movie godzilla = new movie("Godzilla", "Tomoyuki Tanaka", 1954);
			movie alien = new movie("Alien", "Ridley Scott", 1979);
			movie twister = new movie("Twister", "Jan de Bont", 1996);
			movie warOfTheWorlds = new movie("War of the Worlds", "Steven Spielberg", 2005);
			movie closeEncountersOfTheThirdKind = new movie("Close Encounters of the Third Kind", "Steven Spieldberg", 2008);
			
			ArrayList<movie> movies = new ArrayList<movie>();
			movies.add(starWars);
			movies.add(godzilla);
			movies.add(alien);
			movies.add(twister);
			movies.add(warOfTheWorlds);
			movies.add(closeEncountersOfTheThirdKind);
		%>
		<br />
		
		<!-- Get the selected items and display in table -->
		<table border="1">
		<tr>
			<th>Title</th><th>Author</th><th>Release Year</th>
		</tr>
		<%
			String[] selected = 
					request.getParameterValues("moviesCheck");
			
			
			if(selected != null && selected.length != 0){
				for(int i = 0; i < selected.length; i++){
					out.print("<tr>");
					for(movie Movie: movies){
						if(Movie.title.equals(selected[i])){
							out.print("<td>");
							out.println(Movie.title);
							out.print("</td>");
							out.print("<td>");
							out.println(Movie.director);
							out.print("</td>");
							out.print("<td>");
							out.println(Movie.year);
							out.print("</td>");
							out.print("<td>");
						}
					}
					out.print("</tr>");
				}
			}
			
		%>
	</table>
</body>
</html>