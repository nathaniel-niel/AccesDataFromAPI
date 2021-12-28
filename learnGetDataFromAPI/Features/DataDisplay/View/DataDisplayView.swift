//
//  DataDisplayView.swift
//  learnGetDataFromAPI
//
//  Created by Nathaniel Andrian on 28/12/21.
//

import UIKit

class DataDisplayView: UIView {

    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()

}
