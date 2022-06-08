//
//  SuggestViewController.swift
//  Ejercicio Integrador iOS
//
//  Created by Francisco Tomas Nasich on 06/06/2022.
//

import UIKit

class SuggestViewController: UIViewController {
    
    @IBOutlet weak var suggestTitle: UILabel!
    @IBOutlet weak var participantsNumber: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var viewModel: SuggestViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = SuggestViewModel(service: SuggestService())
    }
    
    @IBAction func tryAnotherButton(_ sender: Any) {
    }
    
    //MARK: Price
    func getPrice(price: Double) -> String {
        switch price {
        case 0:
            return "Free"
        case 0.1...0.3:
            return "Low"
        case 0.3...0.6:
            return "Medium"
        case 0.7...0.9 :
            return "High"
        default:
            return "Free"
        }
    }

}
