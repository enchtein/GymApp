//
//  AppDelegate.swift
//  GymApp
//
//  Created by Дмитрий Хероим on 29.07.2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    guard let window = window else {
      assertionFailure("Please, choose launch storyboard")
      return false
    }
    setAppApperance()
    AppCoordinator.shared.start(with: window)
    
    return true
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
      /*
       The persistent container for the application. This implementation
       creates and returns a container, having loaded the store for the
       application to it. This property is optional since there are legitimate
       error conditions that could cause the creation of the store to fail.
      */
      let container = NSPersistentContainer(name: "GymApp")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              // Replace this implementation with code to handle the error appropriately.
              // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
               
              /*
               Typical reasons for an error here include:
               * The parent directory does not exist, cannot be created, or disallows writing.
               * The persistent store is not accessible, due to permissions or data protection when the device is locked.
               * The device is out of space.
               * The store could not be migrated to the current model version.
               Check the error message to determine what the actual problem was.
               */
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()

  // MARK: - Core Data Saving support

  func saveContext () {
      let context = persistentContainer.viewContext
      if context.hasChanges {
          do {
              try context.save()
          } catch {
              // Replace this implementation with code to handle the error appropriately.
              // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
              let nserror = error as NSError
              fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
      }
  }

  
  private func setAppApperance() {
    let largeTitleSize = UIDevice.current.userInterfaceIdiom == .pad ? 30 : 26
    UITableView.appearance().tableFooterView = UIView()
    if #available(iOS 15.0, *) {
      let appearance = UINavigationBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = .red//AppColor.main
      appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 18.0), .foregroundColor: UIColor.white]
//      appearance.titleTextAttributes = [.font: AppFont.font(type: .mainMedium ,size: 18), .foregroundColor: UIColor.white]
      appearance.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: CGFloat(largeTitleSize), weight: .bold), .foregroundColor : UIColor.white]
//      appearance.largeTitleTextAttributes = [.font: AppFont.font(type: .mainBold, size: largeTitleSize), .foregroundColor : UIColor.white]
      UINavigationBar.appearance().standardAppearance = appearance
      UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
      UIView.appearance(whenContainedInInstancesOf: [UITableView.self])
      UITableView.appearance().sectionHeaderTopPadding = .zero
    } else {
      UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.systemFont(ofSize: 18.0), .foregroundColor: UIColor.white]
//      UINavigationBar.appearance().titleTextAttributes = [.font: AppFont.font(type: .mainMedium ,size: 18), .foregroundColor: UIColor.white]
      UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: CGFloat(largeTitleSize), weight: .bold), .foregroundColor : UIColor.white]
//      UINavigationBar.appearance().largeTitleTextAttributes = [.font: AppFont.font(type: .mainBold, size: largeTitleSize), .foregroundColor : UIColor.white]
      UINavigationBar.appearance().barTintColor = .red//AppColor.main
      UINavigationBar.appearance().isTranslucent = false
      UINavigationBar.appearance().backgroundColor = .red//AppColor.main
    }
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().barTintColor = .red//AppColor.main
    UITabBar.appearance().tintColor = .systemBlue//AppColor.mainButtonColor
    UITabBar.appearance().backgroundColor = .green//AppColor.mainBackgroundColor
    UITabBar.appearance().barTintColor = .green//AppColor.mainBackgroundColor
    UITabBar.appearance().isTranslucent = false
    UIStackView.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).spacing = -7
  }
}

