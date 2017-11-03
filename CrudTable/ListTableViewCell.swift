//
//  ListTableViewCell.swift
//  CrudTable
//
//  Created by Fabio Ziviello on 27/10/17.
//  Copyright © 2017 Fabio Ziviello. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var lblNomeProdotto: UILabel!
    @IBOutlet weak var ImgProdotto: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
