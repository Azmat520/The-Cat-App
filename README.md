# The-Cat-App

**Assessment:** Create an iOS application written in Swift that fetches a list of cats from an API endpoint and displays it in a nice looking list using up-to-date common iOS UI practices.
**Solution:** A SwiftUI app with Favorite, List and Detail screen.

Technical decisions with trade offs: <br>
- **Animal Protocol:** <br>
Add an animal protocol to make the app more testable and scalable. 
The trade off is you need check type before do something, for example in this app I need to check if the animal type is a cat everytime before adding to the favorite list.

- **Searchable Modifier** <br>
This modifier provides a convenient way to add search functionality to your views
The trade off is for example, you have limited control over the appearance and behavior of the search bar, search suggestions, or search result presentation.

**Future Improvement** <br>
- Everything I added in the project as comment
- Splash screen (remembered last minutes)
- Pagination (got same list from api for some reason)
- Hero animation
- Other animals like dog, bird etc..
- Dark mode
