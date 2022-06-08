//
//  SuggestViewController.swift
//  Ejercicio Integrador iOS
//
//  Created by Francisco Tomas Nasich on 06/06/2022.
//

import UIKit

protocol SuggestDelegate {
    func loadData(category: EventM)
}

class SuggestViewController: UIViewController {
    
    @IBOutlet weak var suggestTitle: UILabel!
    @IBOutlet weak var participantsNumber: UILabel!
    @IBOutlet weak var price: UILabel!
    
    private var viewModel: SuggestViewModel?
    private let service = EventProvider()
    private var participants = ParticipantsManager.shared.participants ?? 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
//        self.viewModel = SuggestViewModel(service: SuggestService())
=======
        self.viewModel = SuggestViewModel(service: service, delegate: self)
        self.viewModel?.getCategory()
>>>>>>> suggest_view
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        ParticipantsManager.shared.activities = nil
      }
    
    @IBAction func tryAnotherButton(_ sender: Any) {
    }
}

extension SuggestViewController: SuggestDelegate {
    func loadData(category: EventM) {
        self.suggestTitle.text = category.activity
        self.price.text = String(category.price)
        self.participantsNumber.text = String(participants)
    }
}
