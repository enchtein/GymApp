//
//  GymTabBarViewController.swift
//  GymApp
//
//  Created by Дмитрий Хероим on 31.07.2023.
//

import UIKit

class GymTabBarViewController: UITabBarController, StoryboardInitializable {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    /* If view controller is a direct child of UINavigationController */
    self.title = "Title Hereee"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    tabBar.items?.enumerated().forEach { item in
      switch item.offset {
      case 0: item.element.title = "Planner"
      case 1: item.element.title = "Current"
      case 2: item.element.title = "Counter"
      default: break
      }
    }
    AppCoordinator.shared.sideMenu?.navTitle.title = tabBar.selectedItem?.title
  }
  
  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//    super.tabBar(tabBar, didSelect: item)
    
    let selectedItemTitle = item.title
//    AppCoordinator.shared.currentNavigator?.navigationItem.title = selectedItemTitle
    AppCoordinator.shared.sideMenu?.navTitle.title = selectedItemTitle
  }
}
