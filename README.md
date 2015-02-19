# The-Pomodoro-iOS8
============

An iOS pomodoro timer app (including history ♦︎). A pomodoro app has 'Rounds' of time for focusing and taking breaks. Take a look at some sample Pomodoro apps in the app store, or run the solution code to see what you are building.

For more information and examples of Pomodoro:

* [Wired In](https://itunes.apple.com/US/app/id953366135)
* [LifeHacker on Pomodoro](http://lifehacker.com/productivity-101-a-primer-to-the-pomodoro-technique-1598992730)

Remember, the solution code is here as a resource. Do not copy and paste. Understand, walk through it *line by line*, and write it yourself.

## Day 1 - UITabBarController and NSNotifications

###Step 1: Initialize and Add the UITabBarController as the RootViewController

- Add view controllers (```TimerViewController```, ```RoundsViewController```) to project (include a XIB for the ```TimerViewController```)

- In the app delegate, initialize the ```TimerViewController``` and ```RoundsViewController```

- Place the instance of ```RoundsViewController``` in a NavigationController

- Set each viewcontroller's ```tabBarItem.title``` and ```tabBarItem.image``` (find two fitting icons on icons8.com, import them into the Images.xcassets file)

- Initialize a UITabBarController

- Set the ```viewControllers``` property on the UITabBarController to an array containing your navigation controller with a ```TimerViewController``` instance and your ```RoundsViewController``` instance

- Set the tab bar controller as ```rootViewController``` of ```window```.