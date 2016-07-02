//
//  ViewController.swift
//  UITableViewAccordionDemo
//
//  Created by wen on 16/7/2.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellHeight: CGFloat = 56
    let cellHeightExpanded: CGFloat = 360
    
    let cellCount = 24
    var cellStatus = [Bool](count: 24, repeatedValue: false)
    
    let onlyOneExpanded = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.separatorStyle = .None
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AccordionTableViewCell
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapTitleView(_:)))
        cell.titleView.tag = indexPath.row
        cell.titleView.addGestureRecognizer(tapGesture)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellStatus[indexPath.row] ? cellHeightExpanded : cellHeight
    }
    
    func tapTitleView(sender: UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            if cellStatus[tag] {
                cellStatus[tag] = false
            } else {
                if onlyOneExpanded {
                    cellStatus = [Bool](count: cellCount, repeatedValue: false)
                }
                cellStatus[tag] = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: tag, inSection: 0), atScrollPosition: .None, animated: true)
        }
    }
}

