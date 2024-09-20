//
//  AppDelegate.m
//  objCTable
//
//  Created by Liron on 20/09/2024.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// This method is called when the application launches. It sets up the main window and root view controller.
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // This line creates a new UIWindow object. The window is the root of your app's interface and is required for displaying content on the screen. It's the container for all other UI elements
    //self.window = UIWindow.new;
    
    // This makes the window key (meaning it will receive keyboard and other non-touch related events) and visible. It's necessary to make the window visible; otherwise, your app would launch to a black screen.
   // [self.window makeKeyAndVisible];
    
    /*sets up the initial view hierarchy for your app:
    
    It creates a new instance of your custom ViewController.
    It wraps this ViewController in a UINavigationController. This provides the navigation bar at the top and allows for easy pushing and popping of view controllers.
    It sets this navigation controller as the root view controller of the window. This means it will be the first thing users see when your app launches.


    return YES;*/
    //Returning YES indicates that your app has successfully launched. If you return NO, the app terminates.
    //self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:ViewController.new];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle

// This method is part of the UISceneSession lifecycle and is called when a new scene session is being created
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

//  This method is called when the user discards a scene session
- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
