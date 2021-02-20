# Knight Travails Project
The program begins with the knight_moves function under the Knight class. The arguments of a start and end coordinate are passed through this function. The result is the shortest path the knight can take from start to finish in the form of both a set of coordinates as well as a display on a chessboard rendition

Repl.it: https://repl.it/@NicholasBarizo/knight-travails#knight.rb

# Reflections
Progress was slow at the beginning. I started small by having a completion message saying the destination was reached, however, this only worked if the finish coordinate was one move away from the start. It would also discard any move that went out of the chessboard. This was a good start. With the win condition and it checking for valid moves, all that had to be done was deeper travel. It made sense to me that BFS was the best way to go about it. I created a queue and after plenty of tweaking, it worked regardless of the distance between the start and finish.

At the very beginning of the project, I created an 8x8 chessboard representation. Much later in the project I realized that there had to be a better solution than creating 64 variables. That's when I split the board into 8 rows that would be stacked on top of each other. I still thought that 8 variables was not ideal. I then knew to split the 8 rows into 8 cells. These cells then determine if they are one of the tiles the knight passes by considering the row number and index of the cell creation loop.

# From The Odin Project
https://www.theodinproject.com/courses/ruby-programming/lessons/knights-travails