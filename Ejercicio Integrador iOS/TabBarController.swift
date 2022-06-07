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
        
//        let activitiesTabTitle = "Activities"
//        let activitiesTabImage = UIImage(systemName: "list.dash")
//
//        let activitiesViewController = ActivitiesViewController(nibName: "ActivitiesViewController", bundle: nil)
//
//        activitiesViewController.title = activitiesTabTitle
//        activitiesViewController.tabBarItem = UITabBarItem(title: "Activities", image: activitiesTabImage, selectedImage: nil)
//
        
        
        
        
        
        
        let activitiesNavigationController = addView(tabTitle: "Activities", tabImageName: "list.dash", viewController: ActivitiesViewController.self)
        
        let suggestNavigationController = addView(tabTitle: "Random", tabImageName: "shuffle", viewController: SuggestViewController.self)
        
        
        
        
        viewControllers = [activitiesNavigationController, suggestNavigationController]
    }
    
    private func addView <T: UIViewController>(tabTitle: String, tabImageName: String, viewController: T.Type) -> UINavigationController {
        
        let ViewController = viewController.init(nibName: "\(viewController)", bundle: nil)

        ViewController.title = tabTitle
        ViewController.tabBarItem = UITabBarItem(title: tabTitle, image: UIImage(systemName: tabImageName), selectedImage: nil)

        let navigationController = UINavigationController(rootViewController: ViewController)

        return navigationController

    }

}
