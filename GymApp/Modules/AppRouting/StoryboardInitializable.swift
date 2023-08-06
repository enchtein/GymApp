//
//  StoryboardInitializable.swift
//  GymApp
//
//  Created by Дмитрий Хероим on 31.07.2023.
//

import UIKit

protocol StoryboardInitializable {
  static var storyboardName: String { get }
  static var storyboardBundle: Bundle? { get }
  
  static func createFromStoryboard() -> Self
}

extension StoryboardInitializable where Self : UIViewController {
  
  static var storyboardName: String {
    return "Empty"
  }
  
  static var storyboardBundle: Bundle? {
    return nil
  }
  
  static var storyboardIdentifier: String {
    return String(describing: self)
  }
  
  static func createFromStoryboard() -> Self {
    let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
  }
  
}

extension StoryboardInitializable where Self : SideMenuMainViewController {
  static var storyboardName: String {
    return "SideMenu"
  }
}
extension StoryboardInitializable where Self : GymTabBarViewController {
  static var storyboardName: String {
    return "GymTabBar"
  }
}
extension StoryboardInitializable where Self : CurrentTrainingViewController {
  static var storyboardName: String {
    return "CurrentTraining"
  }
}
extension StoryboardInitializable where Self : TrainingPlannerViewController {
  static var storyboardName: String {
    return "TrainingPlanner"
  }
}
extension StoryboardInitializable where Self : TrainingCounterViewController {
  static var storyboardName: String {
    return "TrainingCounter"
  }
}
