//
//  TabBarController.swift
//  Ejercicio Integrador iOS
//
//  Created by Ivan Manuel Romero on 04/06/2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let activitiesNavigationController = addView(tabTitle: "Activities", tabImageName: "list.dash", viewController: ActivitiesViewController.self)
        let suggestNavigationController = addView(tabTitle: "Random", tabImageName: "shuffle", viewController: SuggestViewController.self)
        viewControllers = [activitiesNavigationController, suggestNavigationController]
    }
    
    private func addView <T: UIViewController>(tabTitle: String, tabImageName: String, viewController: T.Type) -> UINavigationController {
        
        let nibName = viewController.description().components(separatedBy: ".").last
        
        let vc = viewController.init(nibName: nibName, bundle: nil)

        vc.title = tabTitle
        vc.tabBarItem = UITabBarItem(title: tabTitle, image: UIImage(systemName: tabImageName), selectedImage: nil)

        let navigationController = UINavigationController(rootViewController: vc)

        return navigationController

    }

}
