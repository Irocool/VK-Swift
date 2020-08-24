//
//  FriendsTableViewCell.swift
//  wether
//
//  Created by Catalina on 24/08/2020.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var AvatarFriend: UIImageView!
    
    @IBOutlet weak var NameFriend: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
