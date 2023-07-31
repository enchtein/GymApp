//
//  TabBarViewController.swift
//  GymApp
//
//  Created by Дмитрий Хероим on 31.07.2023.
//

import UIKit

class TabBarViewController: UITabBarController, StoryboardInitializable {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    /* If view controller is a direct child of UINavigationController */
    self.title = "Title Hereee"
  }
}
