#UICustomKennyVideoPlayer

```UICustomKennyVideoPlayer``` is a simple iOS video player written in Swift that is highly customizable through storyboard to your own preference!

![Promo](https://github.com/kennybatista/ui-components/blob/master/UICustomKennyVideoPlayer/uikennyvideoplayer.gif)

Hi! Thanks for checking out my component. Let me teach you how it work :)

### Usage - XCode 8 / Swift 3

```
# Store this code inside of an action ( such as when someone taps on a button ) to show UICustomKennyVideoPlayer

# URL to a video either stored locally or remotely
let linkToVideo = URL("http://bit.ly/2m1x9OM")

# Create an instance of UIKennyVideoPlayer
let kennyVideoPlayer = UIKennyVideoPlayer(urlToPlayMediaFrom: linkToVideo!)

# Present the controller
present(kennyVideoPlayer, animated: true, completion: nil)


# That's it! Super easy right? 

```

### Tips
- Go to the .xib file and modify the UI to look however you want it to!
