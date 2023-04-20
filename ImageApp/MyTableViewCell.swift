//
//  MyTableViewCell.swift
//  ImageApp
//
//  Created by Kresimir Ivanjko on 23.03.2023..
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var myLabel1: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myLabel1.textAlignment = .center
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }

}
