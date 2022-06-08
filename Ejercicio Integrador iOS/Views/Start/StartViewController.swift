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
    }
    
    //MARK: Start Button
    
    @IBAction func startButton(_ sender: Any) {
        if textField.hasText {
            let participants: Int? = Int(textField.text!)
            
            if let number = participants, number > 0{
                ParticipantsManager.shared.participants = number
                goToView(TabBarController.self)
            } else {
                callAlert()
            }
        } else {
            goToView(TabBarController.self)
        }
    }
    
    //MARK: Terms And Conditions Button
    
    @IBAction func termsButton(_ sender: Any) {
        goToView(TermViewController.self)
    }
    
    //MARK: Functions
    private func callAlert(){
        let alert = UIAlertController(title: "Error", message: "Por favor Ingrese un numero correcto", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
            self.textField.text = ""
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    private func goToView <T: UIViewController>(_ viewController: T.Type){
        let vc = viewController.init()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}
