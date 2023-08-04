//
//  SideMenuMainViewController.swift
//  GymApp
//
//  Created by Дмитрий Хероим on 01.08.2023.
//

import UIKit
import SideMenu

class SideMenuMainViewController: UIViewController, StoryboardInitializable {
  @IBOutlet weak var navBar: UINavigationBar!
  @IBOutlet weak var navTitle: UINavigationItem!
  @IBOutlet weak var leadingButton: UIBarButtonItem!
  @IBOutlet weak var menuContainer: UIView!
  
  weak var sideMenuNavigation: SideMenuNavigationController? = nil
  var lastSelectedMenuTitle: SideMenuItems? = nil {
    didSet { }
  }
  var permissionShowedOnSelectedTab: Bool = false
  var selectedMenuTitle: SideMenuItems? = nil {
    didSet {
      if let oldValue {
        lastSelectedMenuTitle = oldValue
      }
    }
  }
  
  var activeController: UIViewController? {
    didSet {
      remove(asChildViewController: oldValue)
      updateActiveViewController()
      sideMenuNavigation?.dismiss(animated: true)
    }
  }
  override var preferredStatusBarStyle: UIStatusBarStyle {
      .lightContent
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      setupSideMenu()
      updateMenus()
      defaultVC()
      sideMenuNavigation?.sideMenuDelegate = self
    }
  
  private func defaultVC() {
    let availiableCases = SideMenuItems.allCases
    let defaultVC = availiableCases.first(where: {$0 == .tabBar}) ?? availiableCases.first
    
    self.activeController = defaultVC?.viewController
    self.navTitle.title = defaultVC?.title
    self.selectedMenuTitle = defaultVC
    self.lastSelectedMenuTitle = defaultVC
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
    self.sideMenuNavigation = sideMenuNavigationController
    sideMenuNavigationController.settings = makeSettings()
    if let sideTableVC = sideMenuNavigationController.topViewController as? SideMenuViewController {
      sideTableVC.rootController = self
    }
  }
  
  private final func updateActiveViewController() {
    guard let activeVC = self.activeController else { return }
    self.addChild(activeVC)
    activeVC.view.frame = menuContainer.bounds
    menuContainer.addSubview(activeVC.view)
    activeVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    activeVC.didMove(toParent: self)
    self.view.layoutSubviews()
    self.title = activeVC.title
  }
  
//  final func setSelectedMenuVC(to item: SideMenuItems) {
//    let vc = item.viewController
//    guard type(of: vc) != type(of: activeController ?? UIViewController()) else {
//      self.selectedMenuTitle = item
//      self.dismiss(animated: true)
//      return
//    }
//
//    DispatchQueue.main.async {
//      self.navTitle.rightBarButtonItems?.removeAll()
//      self.activeController = vc
//      self.navTitle.title = item.localized
//      self.selectedMenuTitle = item
//    }
//  }
  
  
  private final func remove(asChildViewController viewController: UIViewController?) {
    viewController?.willMove(toParent: nil)
    viewController?.view.removeFromSuperview()
    viewController?.removeFromParent()
  }
  
  private final func setupSideMenu() {
    // Define the menus
    
    guard let sideMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as? SideMenuNavigationController else { return }
    self.sideMenuNavigation = sideMenuNavigationController
    sideMenuNavigationController.settings = makeSettings()
    if let sideTableVC = sideMenuNavigationController.topViewController as? SideMenuViewController {
      sideTableVC.rootController = self
    }
    
    SideMenuManager.default.leftMenuNavigationController = sideMenuNavigationController
    SideMenuManager.default.addPanGestureToPresent(toView: navigationController!.navigationBar)
    SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view, forMenu: .left)
  }
  
  private final func updateMenus() {
    let settings = makeSettings()
    SideMenuManager.default.leftMenuNavigationController?.settings = settings
  }
  
  private final func makeSettings() -> SideMenuSettings {
    let presentationStyle = SideMenuPresentationStyle.menuSlideIn
    presentationStyle.backgroundColor = #colorLiteral(red: 0.1969315112, green: 0.2438022494, blue: 0.3149579763, alpha: 1)
    presentationStyle.menuStartAlpha = 1.0
    presentationStyle.menuScaleFactor = 1.0
    presentationStyle.onTopShadowOpacity = 1.0
    presentationStyle.presentingEndAlpha = 0.4
    presentationStyle.presentingScaleFactor = 1.0
    
    var settings = SideMenuSettings()
    settings.presentationStyle = presentationStyle
    if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
      settings.menuWidth = min(view.frame.width, view.frame.height) * 0.4
    } else {
      settings.menuWidth = min(view.frame.width, view.frame.height) * 0.85
    }
    settings.blurEffectStyle = nil
    settings.dismissOnRotation = false
    settings.statusBarEndAlpha = 0
    
    return settings
  }

}

//NARK: - SideMenuNavigationControllerDelegate
extension SideMenuMainViewController: SideMenuNavigationControllerDelegate {
  func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
    // Show permission dialog on newly open tab ONCE
  }
}
