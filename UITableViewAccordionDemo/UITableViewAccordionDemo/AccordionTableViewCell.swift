//
//  AccordionTableViewCell.swift
//  UITableViewAccordionDemo
//
//  Created by wen on 16/7/2.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

class AccordionTableViewCell: UITableViewCell {

    @IBOutlet weak var wrapView: UIView!
    @IBOutlet weak var titleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .None
        
        wrapView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        wrapView.layer.cornerRadius = 4
        wrapView.layer.masksToBounds = true
        
        titleView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        titleView.layer.cornerRadius = 4
        titleView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
