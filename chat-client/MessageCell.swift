//
//  MessageCell.swift
//  chat-client
//
//  Created by Andrew Yu on 2/17/16.
//  Copyright © 2016 Andrew Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
