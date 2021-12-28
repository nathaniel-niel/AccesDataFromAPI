//
//  TableViewCell.swift
//  Clima
//
//  Created by Nathaniel Andrian on 27/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "lama lama lama hahha"
        return label
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        setLabelAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setLabelAutoLayout(){
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10.0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10.0).isActive = true
    }

}
