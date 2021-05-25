### Documentation
Just read the code! It's pretty straightforward.
### Q&A
Q: So, how do I run this project?
A: Use "./run.sh".

It will
1. run "gen.sh" to render the website and the posts to "output"
2. copy the files from "static" directory to "output"
3. start a minimal http server at 0.0.0.0:80

Q: How do I add a new post?
A: Create a new file in "posts" directory. For example, for "2020-04-05.html", its first line will be rendered as title, the rest as the content. And of course you can use html code as you wish.
