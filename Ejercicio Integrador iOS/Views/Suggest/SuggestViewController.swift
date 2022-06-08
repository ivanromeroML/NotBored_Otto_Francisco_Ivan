//
//  SuggestViewController.swift
//  Ejercicio Integrador iOS
//
//  Created by Francisco Tomas Nasich on 06/06/2022.
//

import UIKit

protocol SuggestDelegate {
    func loadData()
}

class SuggestViewController: UIViewController {
    
    @IBOutlet weak var suggestTitle: UILabel!
    @IBOutlet weak var participantsNumber: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    private var viewModel: SuggestViewModel?
    private let service = EventProvider()
    private var participants = ParticipantsManager.shared.participants ?? 0
    private var testActivity: EventM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = SuggestViewModel(service: service, delegate: self)
        loadData()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        ParticipantsManager.shared.activities = nil
      }
    
    @IBAction func tryAnotherButton(_ sender: Any) {
    }
}

extension SuggestViewController: SuggestDelegate {
    func loadData() {
        service.getInfoActivities { activityInfo in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.testActivity = activityInfo
                self.suggestTitle.text = testActivity?.activity
                self.price.text = ""
                self.participantsNumber.text = ""
            }
        }
    }
}
