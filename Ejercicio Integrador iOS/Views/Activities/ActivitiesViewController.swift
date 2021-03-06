//
//  ActivitiesViewController.swift
//  Ejercicio Integrador iOS
//
//  Created by Ivan Manuel Romero on 04/06/2022.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    private var viewModel = ActivitiesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
    }
    
    func setupTableview(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 75
        self.tableView.reloadData()
        self.tableView.layoutMargins = .init(top: 0.0, left: 25.0, bottom: 0.0, right: 25.0)
        self.tableView.separatorInset = tableView.layoutMargins
    }
}

//MARK: TableViewDataSource

extension ActivitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.listActivities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.viewModel.listActivities[indexPath.row]
        setupUICell(cell)
        return cell
    }
    
    func setupUICell(_ cell: UITableViewCell){
        cell.backgroundColor = UIColor(red: 224, green: 245, blue: 254, alpha: 0)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25.0)
        
    }
}

//MARK: TableViewDelegate

extension ActivitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        ParticipantsManager.shared.activities = viewModel.getActivity(at: indexPath.row)
        showSuggest(at: indexPath.row)
    }
    
    func showSuggest(at index: Int) {
        let suggestViewController = SuggestViewController()
        suggestViewController.title = viewModel.getActivity(at: index)
        suggestViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(suggestViewController, animated: true)
    }
}
