//
//  SideMenuItems.swift
//  GymApp
//
//  Created by Дмитрий Хероим on 01.08.2023.
//

import UIKit

enum SideMenuItems: CaseIterable {
  case gymTabBar
  case history
  case settings
  
  var title: String {
    switch self {
    case .gymTabBar:
      return "tabBar"
    case .history:
      return "history"
    case .settings:
      return "settings"
    }
  }
  var viewController: UIViewController {
    switch self {
    case .gymTabBar:
      return GymTabBarViewController.createFromStoryboard()
    case .history:
      return UIViewController()
    case .settings:
      return UIViewController()
    }
  }
  var menuIcon: UIImage? {
    switch self {
    case .gymTabBar:
      return nil
    case .history:
      return nil
    case .settings:
      return nil
    }
  }
}
