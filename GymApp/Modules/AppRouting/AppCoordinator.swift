//
//  AppCoordinator.swift
//  GymApp
//
//  Created by Дмитрий Хероим on 29.07.2023.
//

import UIKit

class AppCoordinator: NSObject {
  static let shared = AppCoordinator()
  private(set) var currentNavigator: UINavigationController?
  private(set) var sideMenu: SideMenuMainViewController?
  
  override init() {
    super.init()
  }
  
  func start(with window: UIWindow) {
    let gymTabBarVC = instantiate(.tabBar)
    currentNavigator = UINavigationController(rootViewController: gymTabBarVC)
    currentNavigator?.navigationBar.isTranslucent = false
    currentNavigator?.navigationBar.barStyle = .default
    currentNavigator?.navigationBar.tintColor = .white
    currentNavigator?.navigationBar.barTintColor = #colorLiteral(red: 0.1450980392, green: 0.1803921569, blue: 0.2509803922, alpha: 1)
    currentNavigator?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    currentNavigator?.setNavigationBarHidden(true, animated: true)
    window.rootViewController = currentNavigator
    
    window.makeKeyAndVisible()
    
    activateRoot()
  }
  
  func push(_ controller: AppViewController, animated: Bool = true) {
    let vc = instantiate(controller)
    currentNavigator?.pushViewController(vc, animated: animated)
  }

  func present(_ controller: AppViewController, animated: Bool) {
    let vc = instantiate(controller)
    UIApplication.topViewController()?.present(vc, animated: animated, completion: nil)
  }
  
  private func instantiate(_ item: AppViewController) -> UIViewController {
    switch item {
    case .rootWithLeftSideMenu:
      let vc = SideMenuMainViewController.createFromStoryboard()
      self.sideMenu = vc
      return vc
    case .tabBar:
      let vc = TabBarViewController.createFromStoryboard()
      return vc
    default: return UIViewController()
//    case .trainingPlanner:
//      <#code#>
//    case .trainingProgress:
//      <#code#>
//    case .currentTraining:
//      <#code#>
//    case .trainingHistory:
//      <#code#>
//    case .settings:
//      <#code#>
    }
  }
  
  func activateRoot() {
    guard let currentNavigator else { fatalError("currentNavigator - is not initilized") }
    currentNavigator.popToRootViewController(animated: false)
    currentNavigator.setNavigationBarHidden(true, animated: true)
    push(.rootWithLeftSideMenu)
  }
}
