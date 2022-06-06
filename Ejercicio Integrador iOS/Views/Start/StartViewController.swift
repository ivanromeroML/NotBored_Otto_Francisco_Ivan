//
//  StartViewController.swift
//  Ejercicio Integrador iOS
//
//  Created by Ivan Manuel Romero on 03/06/2022.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Start Button
    
    @IBAction func startButton(_ sender: Any) {
        
        if textField.hasText {
            let participants: Int? = Int(textField.text!)
            
            if let number = participants {
                goToTabBar()
            } else {
                callAlert()
            }
            
        } else {
            
        }
        
    }
    
    //MARK: Terms And Conditions Button
    
    @IBAction func termsButton(_ sender: Any) {
        let termsVC = TermViewController()
        termsVC.modalPresentationStyle = .overFullScreen
        self.present(termsVC, animated: true)
    }
    
    //MARK: funciones
    func callAlert(){
        let alert = UIAlertController(title: "Error", message: "Por favor Ingrese un numero correcto", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
            self.textField.text = ""
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    func goToTabBar(){
        let vc = TabBarController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}
