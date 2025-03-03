# 🎮 Mental Maze

Uncertain paths, confining walls, and inescapable dead ends—like a maze, mental health challenges can be difficult to navigate and make us feel lost, trapped, and alone. By blending lighthearted, interactive gameplay with a powerful message, Mental Maze serves as both a game and a conversation starter to encourage greater awareness, empathy, and access to resources.

[Mental Maze on Devpost](https://devpost.com/software/mental-maze)

---

## 💡 Inspiration 
We were inspired to build the project due to the importance of raising mental health awareness and continuing to diminish any stigma towards these disorders. Very often, people may not take mental health struggles seriously or those who do struggle will feel lonely in the battle, which is why we wanted to send a message while still keeping things lighthearted and enjoyable with an interactive, user-friendly game. Not only does the game remind others that they are not alone in their mental health challenges and that their mental health truly is important and should be taken seriously, but the game also displays resources and information to lightheartedly encourage people to get the help they may need. This could even give a better understanding to those who may not recognize the seriousness of mental health issues and that it is not something that can just be pushed away or immediately solved. 

## ⚙️ What It Does
Mental maze is a game where the user controls a player that navigates through a variety of randomly generated mazes. There are different levels of mazes, and within each level, there is a specific type of mob that represents a mental illness, such as an anxiety disorder. The player is welcomed by the start screen and begins the game by clicking the start button. They are spawned in a maze and can use the arrow keys to move up, down, left, and right. They must find their way out, but there are multiple mobs that spawn randomly within the maze. The mobs target the player and if the player is touched by a mob, the player loses one of their three lives. The player must run to avoid the mobs and try to find their way out of the maze. When the player dies or if the player wins and escapes the maze, there are pop-ups of information and resources relating to the mental illness that the mob represents on that level. After all three lives are lost, the maze changes to a randomly generated, different maze.

## 🛠️ How We Built It
Since Godot is a popular, open source game engine known for efficiently organizing and simplifying the game development process, we decided to use it despite having no experience with it beforehand. From its layout, where all the code is done within the application, to its own language, which is similar to python, Godot was a helpful platform to use. We had one member focusing on creating all the player and mobs functionality, another member focusing on user interface screens and message pop-ups, and the other member focusing on the creation of the maze and how it interacts with entities. 

## 🚧 Challenges We Faced
We experienced many challenges that served as valuable learning experiences. These include merge conflicts, complex features, unexpected behavior, new layouts and information to navigate, and issues with other outside resources. Godot involved numerous different files that led to major merge conflicts when we pushed to our shared Github repository. However, once we adjusted to how Godot works and its influence on other files from changes in different files, we reduced the occurrence of merge conflicts and understood how to resolve them faster. Complex features led to unexpected behaviors that were difficult to understand what caused them. It took a lot of research, debugging, testing, and more to figure out the issue. For example, implementing the mob spawning functionality involved loading the mob scene within the main scene and creating multiple spawn points and a timer to time when the next mob would spawn. The process needed a deeper understanding of Godot’s language and layout to understand how to use it for instantiating and for global use of singletons, which led to numerous errors and confusion initially.

## 🌟 Accomplishments We’re Proud Of
As first-time hackers with little to no experience with game development, we are very proud of learning how to use Godot quickly and being able to overcome numerous issues we faced through mentor consultations, testing, and more. More specifically, we are proud to have implemented a working maze that a player can smoothly navigate through with their keyboard keys and run from the mobs that we successfully spawned in and made compatible with the maze as well. Being able to combine all our work together and have the final product work as intended with our integrations was also a huge accomplishment for us.

## 📘 Lessons Learned
We learned a numerous variety of things, such as how the Godot game engine and game development works, how to collaborate with other team members in a time-constrained situation, and how to problem solve and conduct helpful research that leads to the most efficient outcome. Since we lacked game development experience in general, we learned about so many features, such as how to connect animations with sprites, how to implement responses for collision areas, how to customize a consistently changing user interface, and more. With this event being our first hackathon, we learned to communicate well with each other and split tasks evenly along with adapting to potential changes in our initial plan due to our time limit and technical issues. We made sure to make the best use of our time while still attending workshops and social events to have an enjoyable hackathon experience. 

## 🚀 Future Plans for Mental Maze
If we had more time, we could develop this game more by adding more mobs that represent different mental illnesses such as depression, bipolar disorder, etc., which would lead to more stages that a player can experience and complete. Each stage could have certain fitting themes, unique mob attacks, and more. We could implement more animations, a way to track and display player statistics, and a smoother, more complex combat style with a way for players to kill mobs too. Overall, this was a wonderful experience that taught us many valuable lessons and will prepare us well for our future ambitions.

---

## 📅 Hackathon Experience
Developed during a 36-hour hackathon, **WiNGHacks**, with a team of 3 members:
- **Collaborators**: Willow McGinley, and Anna Sicoli.
- **Languages and Tools**: Built using Godot and GDScript, with version control managed via Git/GitHub.
- **Presentation**: Successfully showcased to a panel of 9 judges, emphasizing the game’s mental health focus and gameplay design.
