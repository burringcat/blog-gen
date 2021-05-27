### Documentation
Just read the code. It's pretty straightforward.
### Q&A
Q: So, how can I generate the pages?
A: Run "./gen.sh".

It will
1. run "gen.sh" to render the website and the posts to "output"
2. copy the files from "static" directory to "output"

Q: How do I add a new post?
A: Create a new file in "posts" directory. For example, for "2020-04-05.html", its first line will be rendered as title, the rest as the content. And, you can use any html tag as you wish.
