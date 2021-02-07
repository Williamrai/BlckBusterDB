# BlckBusterDB

BlckBusterDB is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

<!--- 📝 `NOTE - PASTE PART 2 SNIPPET HERE:` Paste the README template for part 2 of this assignment here at the top. This will show a history of your development process, which users stories you completed and how your app looked and functioned at each step. --->

---

## BlckBusterDB Part 1
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

### App Walkthrough
<!--- <img src="YOUR_GIF_URL_HERE" width=250><br> --->
![](ezgif.com-video-to-gif.gif)

### Challenges
- I had set two lables and one Imageview and it became difficult to layout them inside table view cell
- I used auto layout to make them adaptive, they were adaptive. However, the table view cell acted according to the largest content in the cell.
- If the imageview was bigger then it set the height in reference to imageview
- if the bigger was synopsis, then it set the height in reference to synopsis.
- The imageview had a fixed height. So, it was okay as it is alwasy fixed. But the synopis label sizes dynamically and if it had more content then table view cell would be larger
- 
