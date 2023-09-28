//
//  AlertListCell.swift
//  Drink
//
//  Created by 김주현 on 2023/09/26.
//

import UIKit

class AlertListCell: UITableViewCell {
    
    @IBOutlet weak var merideimLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
