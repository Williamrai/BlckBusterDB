# CinemaGo

BlckBusterDB is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

<!--- 📝 `NOTE - PASTE PART 2 SNIPPET HERE:` Paste the README template for part 2 of this assignment here at the top. This will show a history of your development process, which users stories you completed and how your app looked and functioned at each step. --->

---
## CinemaGo Part 2
### Features
- Latest Now Playing Movies 
- Superheroes Movie collection
- Watch the trailer of the Movies
- Overview of the movies

### Challenges
- Collection View Cell did not layout as I had wanted
- Tap Gesture was not responding to the tap
- variable were not being updated even after receiving value from API

### Solutions
- Had to learn some Math to layout the Collection View Cell
- Interaction checkbox was not checked in ImageView which was why Tap Gesture was not responding
- Variable was not updating because of the delay in getting data from the API, so had to use DispatchQueue.main.async to update the views in the main thread

### Walkthrough
<!-- <img src="https://media.giphy.com/media/OS2cwyzx29LuufBhek/giphy.gif" width=400><br> -->
![](unit2.gif)


---
## CinemaGo Part 1
<!---
### User Stories
`TODO://` In the **User Stories section below**, add an `x` in the `-[ ]` like this `- [x]` for any user story you complete. (🚫 Remove this paragraph after checking off completed user stories) --->

<!---
#### REQUIRED (10pts)
- [ ] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [ ] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [ ] (3pts) User can view the movie poster image for each movie. --->

<!---
#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device. --->
- The app gets list of latest movies from the Movie Database API. 
- The app list movies with their title, images and synopsis.
- The app supports both portrait and landscape mode.

### Challenges
- I had problems with **constraining** two lables and one Imageview inside table view cell
- I used auto layout to make them adaptive, they were adaptive but not how I wanted them to be. 
- The table view cell acted according to the largest content in the cell.
    - If the imageview was bigger then it set the height in reference to imageview
    - if the synopsis bigger was, then it set the height in reference to synopsis which made the view look super weird and there would be no consistency.
- The imageview had a fixed height. So, it was okay as it is alwasy fixed. But the **synopis label sizes dynamically** and if it had more content then table view cell **would be larger**
- I could have given a fixed number of lines but it would not look nice in landscape, since landscape has more free space

### Solutions
- I changed the number of lines to 5 programatically in MovieCell class to make it have no more than 5 lines in portrait mode
- When the phone is in landscape mode then I rechange the number of lines to 0.

### App Walkthrough
<!--- <img src="YOUR_GIF_URL_HERE" width=250><br> --->
![](ezgif.com-video-to-gif.gif)

