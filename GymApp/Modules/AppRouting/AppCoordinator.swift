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
  
  override init() {
    super.init()
  }
  
  func start(with window: UIWindow) {
    let gymTabBarVC = UIViewController()
    currentNavigator = UINavigationController(rootViewController: gymTabBarVC)
    currentNavigator?.navigationBar.isTranslucent = false
    currentNavigator?.navigationBar.barStyle = .default
    currentNavigator?.navigationBar.tintColor = .white
    currentNavigator?.navigationBar.barTintColor = #colorLiteral(red: 0.1450980392, green: 0.1803921569, blue: 0.2509803922, alpha: 1)
    currentNavigator?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    currentNavigator?.setNavigationBarHidden(true, animated: true)
    window.rootViewController = currentNavigator
    
    window.makeKeyAndVisible()
  }
  
  func activateRoot(fromLogin: Bool = false) {
    guard let currentNavigator else { fatalError("currentNavigator - is not initilized") }
    
    currentNavigator.popToRootViewController(animated: false)
    currentNavigator.setNavigationBarHidden(true, animated: true)
  }
  
//  func push(_ controller: AppViewController, animated: Bool = true) {
//    let vc = instantiate(controller)
//    currentNavigator?.pushViewController(vc, animated: animated)
//  }
//
//  func present(_ controller: AppViewController, animated: Bool) {
//    let vc = instantiate(controller)
//    UIApplication.topViewController()?.present(vc, animated: animated, completion: nil)
//  }
  
//  private func instantiate(_ controller: AppViewController) -> UIViewController {
//    switch controller {
//    case .login: return LoginViewController.createFromStoryboard()
//    case .rootWithLeftSideMenu:
//      let vc = SideMenuMainViewController.createFromStoryboard()
//      self.sideMenu = vc
//      return vc
//    case .editDriverAvailability(let newStatus, let model, let completion):
//      let vc = DriverAvailabilityEditViewController.createFromStoryboard()
//      vc.isNewStatus = newStatus
//      vc.model = model
//      vc.completion = completion
//      let navVC = UINavigationController(rootViewController: vc)
//      return navVC
//    case .addTripDocument(let tripNumber, let tripId, let truckId, let completion):
//      let vc = AddTripDocumentViewController.createFromStoryboard()
//      vc.tripId = tripId
//      vc.tripNumber = tripNumber
//      vc.truckId = truckId
//      vc.completion = completion
//      let navVC = UINavigationController(rootViewController: vc)
//      return navVC
//    case .photoPresent(let image):
//      let configuration = ImageViewerConfiguration { config in
//        config.imageView = image
//      }
//      let photoPresentingVC = ImageViewerController(configuration: configuration)
//      return photoPresentingVC
//    case .pdfPresent(let document, let number):
//      let vc = PDFPresentingViewController(document: document, tripNumber: number)
//      let navVC = UINavigationController(rootViewController: vc)
//      navVC.navigationBar.prefersLargeTitles = true
//      vc.tripNumber = number
//      vc.pdfDocument = document
//      return navVC
//    case .compressionQuality(let delegate):
//      let vc = CompressionQualityViewController.createFromStoryboard()
//      let navVC = UINavigationController(rootViewController: vc)
//      vc.title = SettingsTitleEnum.imageCompressionQuality.localized
//      vc.compressionDelegate = delegate
//      return navVC
//    case .driverNote(let eventId, let note, let completion):
//      let vc = EventDriverNoteViewController.createFromStoryboard()
//      vc.eventId = eventId
//      vc.completion = completion
//      vc.note = note
//      return vc
//    case .uploadDocumentsAlert(let delegate, let error):
//      let vc = UploadDocumentsFailedViewController.createFromStoryboard()
//      vc.delegate = delegate
//      vc.error = error
//      return vc
//    case .confirmationAlert(let type, let answers):
//      let vc = ConfirmationViewController.createFromStoryboard()
//      vc.configurator = ConfirmationAlert.getConfigurator(for: type,
//                                                          with: answers)
//      vc.modalPresentationStyle = .overFullScreen
//      return vc
//    case .locatioEmulation(let delegate):
//      let vc = LocatioEmulationViewController.createFromStoryboard()
//      vc.locationDelegate = delegate
//      return vc
//    case .wrongWay:
//      let vc = WrongWayViewController.createFromStoryboard()
//      vc.modalPresentationStyle = .overFullScreen
//      return vc
//    case .databaseTestModels:
//      let vc = DataBaseTestModelsViewController.createFromStoryboard()
//      return UINavigationController(rootViewController: vc)
//    case .databaseTestActions(let type):
//      let vc = DataBaseTestActionsViewController.createFromStoryboard()
//      vc.type = type
//      return vc
//    case .databaseTestPresentor(let type, let action):
//      let vc = DataBaseTestPresentorViewController.createFromStoryboard()
//      vc.type = type
//      vc.action = action
//      return vc
//    case .custom (let vc):
//      return vc
//    }
//  }
}
