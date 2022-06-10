//
//  SuggestViewController.swift
//  Ejercicio Integrador iOS
//
//  Created by Francisco Tomas Nasich on 06/06/2022.
//

import UIKit

protocol SuggestDelegate {
    func showData()
    func spinnerLoadingState(state: Bool)
}

class SuggestViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var suggestTitle: UILabel!
    @IBOutlet weak var participantsNumber: UILabel!
    @IBOutlet weak var price: UILabel!
    
    //Variables
    private var viewModel: SuggestViewModel?
    private let service = EventProvider()
    private var participants = ParticipantsManager.shared.participants ?? 0
    private var testActivity: EventM?
    private let errorMessage: String = "Not found an activity for "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = SuggestViewModel(service: service, delegate: self)
        self.viewModel?.loadData()
        spinnerLoadingState(state: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        ParticipantsManager.shared.activities = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if ParticipantsManager.shared.activities == nil {
            self.viewModel?.loadData()
        }
    }
    
    @IBAction func tryAnotherButton(_ sender: Any) {
        spinnerLoadingState(state: true)
        self.viewModel?.loadData()
    }
}

extension SuggestViewController: SuggestDelegate {
    func showData() {
        
        if viewModel?.testActivity?.activity != nil {
            self.suggestTitle.text = self.viewModel?.testActivity?.activity
            self.price.text = self.viewModel?.getPrice(price: (self.viewModel?.testActivity?.price)!)
            self.participantsNumber.text = String(self.participants)
            
        } else {
            self.suggestTitle.text = errorMessage + "\(participants) participants"
            self.price.isHidden = true
            self.participantsNumber.isHidden = true
            
        }
    }
    
    func spinnerLoadingState(state: Bool) {
        state ? self.showSpinner(onView: self.view) : self.removeSpinner()
    }
}
