//
//  DataDisplayViewController.swift
//  learnGetDataFromAPI
//
//  Created by Nathaniel Andrian on 27/12/21.
//

import UIKit

class DataDisplayViewController: UIViewController{
  
    // MARK: - Variable Declaration
    let dataDisplayView = DataDisplayView()
    var apiService = APIService()
    var arrOfAnimal: [Animal] = []
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dataDisplayView.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        dataDisplayView.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        dataDisplayView.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0).isActive = true
        dataDisplayView.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - Setup
    private func setup(){
        view.backgroundColor = .white
        navigationItem.title = "Animal Data"
        view.addSubview(dataDisplayView.tableView)
        
        // setup delegate
        dataDisplayView.tableView.delegate = self
        dataDisplayView.tableView.dataSource = self
        
        // register tableView cell
        dataDisplayView.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Binding Data
    func bindData(){
        apiService.fetchData { data in
            self.arrOfAnimal = data
            DispatchQueue.main.async {
                self.dataDisplayView.tableView.reloadData()
            }
        }
    }
}


// MARK: - TableViewDelegate and TableViewDataSource
extension DataDisplayViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfAnimal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.selectionStyle = .none
        cell.nameLabel.text = arrOfAnimal[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrOfAnimal[indexPath.row].name)
    }

}
