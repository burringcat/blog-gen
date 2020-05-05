### Documentation
Just read the code! It's very understandable.
### Q&A
Q: So, how do I run this project?
A: Use "./run.sh".
It will
1. run "gen.sh" to render the website and the posts to "output"
2. copy the files from "static" directory to "output"
3. start a minimal http server at 0.0.0.0:80

Q: How do I add a new post?
A: Create a new file in "posts" directory. For example, it's named "2020-04-05.html", then it's first line will be rendered as title, the rest as the content. And of course you can use any html code there if you wish.

Q: How do I stop it?
A: The http server I'm using here is called quark. You just run "sudo killall quark" to shut it down, or run the shell script called "down.sh".
