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

###OVERVIEW OF TIMER APP

The classes within our app are going to talk to each other with NSNotifications. 

| Notification Name               | When Posted                               | Who Posts        | Who Observes                              |
|---------------------------------|-------------------------------------------|------------------|-------------------------------------------|
| ```SecondTickNotification```    | every second tick while timer is active   | Timer            | TimerViewController                       |
| ```RoundCompleteNotification``` | on completion of round (aka timer expiry) | Timer            | TimerViewController, RoundsViewController |
| ```NewRoundNotification```      | when a new round is "selected"            | RoundsController | TimerViewController                       |

###Step 2: Add the interface to the TimerViewController

The Timer View Controller displays a countdown of the current round and has a Start button to start the timer.

- Add a label and button to the timer screen using a XIB
- Add IBOutlets for the ```timerButton``` and ```timerLabel```
- Add an IBAction for the ```timerButton``` that will trigger the timer (leave method empty for now)

###Step 3: Create a RoundsController

- Create a ```sharedInstance``` class method on ```RoundsController``` that returns a singleton ```RoundsController``` instance
- Add a public, readonly property of type NSArray called ```roundTimes```
	- In the implementaion file, override the roundTimes getter method and return this array ```@[@25, @5, @25, @5, @25, @5, @25, @15]```
- Add a public property of type NSInteger called ```currentRound```

###Step 4: Create a timer class

Use a separate [Timer]() class to manage the timer. This timer class holds the minutes and seconds and has a method to begin counting down. 
Pay attention to what the class does for you, walk through each method, understand what it is doing.

- Create a ```POTimer``` Class as a Shared Instance
- Add public properties of type NSInteger for ```minutes``` and ```seconds```
- Create public static NSStrings with names from above table (```SecondTickNotification```, ```RoundCompleteNotification```, ```NewRoundNotification```)
- Add a private BOOL property called ```isOn``` to allow you to check if the timer is active
- Add a public void method called ```startTimer```
  - ```startTimer``` should turn ```isOn``` to YES
  - ```startTimer``` should call ```checkActive``` (which you will write below)
- Add a private void method called ```endTimer```
  - ```endTimer``` should turn ```isOn``` to NO and send a ```RoundCompleteNotification``` that the timer has finished
- Add a private void method called ```decreaseSecond```
  - ```decreaseSecond``` should decrease one second from the remaining time and send a ```SecondTickNotification``` notification that one second passed
  	- don't forget to change minutes, if necessary
  	- if the timer has elpased, then call ```endTimer```
- Add a private void method called ```checkActive```
  - ```checkActive``` should check if the timer is on (```self.isOn```), and if so, call the ```decreaseSecond``` method, then it should call itself in one second
  - before the if statement, make sure you cancel previous perform requests
- Add a public void method called ```cancelTimer```
  - ```cancelTimer``` should turn ```isOn``` to NO
  - ```cancelTimer``` should cancel previous perform requests