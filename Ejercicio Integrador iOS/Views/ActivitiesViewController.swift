//
//  ActivitiesViewController.swift
//  Ejercicio Integrador iOS
//
//  Created by Ivan Manuel Romero on 04/06/2022.
//

import UIKit

class ActivitiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

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
    }
    
}
	
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
        cell.textLabel?.font = UIFont(name: "System - System", size: CGFloat(15.0))
    }
    
    
}

extension ActivitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
