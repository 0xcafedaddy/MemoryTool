//
//  AppDelegate.swift
//  MemoryTool
//
//  Created by 高庆华 on 16/6/8.
//  Copyright © 2016年 高庆华. All rights reserved.
//

import UIKit
import XCGLogger
import SVProgressHUD

let log: XCGLogger = {
    let log = XCGLogger.defaultInstance()
    log.setup(.Debug, showThreadName: true, showLogLevel: false, showFileNames: true, showLineNumbers: true, writeToFile: nil, fileLogLevel: .Debug)
    //设置时间格式
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd hh:mma"
    dateFormatter.locale = NSLocale.currentLocale()
    log.dateFormatter = dateFormatter
    
    return log
}()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //配置全局log
        configLog()
        //配置全局导航栏和状态栏
        configNavigationBar()
        //配置全局SVProgressHUD
        configSVProgressHUD()
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = MainTabBarController()
        window!.makeKeyAndVisible()
        
        return true
    }
    
    func configLog() {
        //设置日志颜色
        log.xcodeColorsEnabled = true // Or set the XcodeColors environment variable in your scheme to YES
        log.xcodeColors = [
            .Verbose: .lightGrey,
            .Debug: .darkGrey,
            .Info: .darkGreen,
            .Warning: .orange,
            .Error: XCGLogger.XcodeColor(fg: UIColor.redColor(), bg: UIColor.whiteColor()), // Optionally use a UIColor
            .Severe: XCGLogger.XcodeColor(fg: (255, 255, 255), bg: (255, 0, 0)) // Optionally use RGB values directly
        ]
    }
    func configNavigationBar() {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    }
    func configSVProgressHUD() {
        SVProgressHUD.setMinimumDismissTimeInterval(1)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

