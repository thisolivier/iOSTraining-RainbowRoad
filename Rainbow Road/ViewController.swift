//
//  ViewController.swift
//  Rainbow Road
//
//  Created by Olivier Butler on 12/09/2017.
//  Copyright © 2017 Olivier Butler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var raindowTable: UITableView!
    var colours:[UIColor] = []
    
    func buildColours () {
        let rgbVals:[(CGFloat,CGFloat,CGFloat)] = [
            (250,90,90),
            (240,196,25),
            (120,186,114),
            (57,214,195),
            (51,142,219),
            (149,91,165)
        ]
        for index in 0..<rgbVals.count{
            let newCol = UIColor.init(
                red: rgbVals[index].0 / 255,
                green: rgbVals[index].1 / 255,
                blue: rgbVals[index].2 / 255,
                alpha: 1
            )
            self.colours.append(newCol)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildColours()
        raindowTable.dataSource = self
        raindowTable.delegate = self
        raindowTable.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let protoCell = raindowTable.dequeueReusableCell(withIdentifier: "stripe", for: indexPath)
        
        protoCell.backgroundColor = colours[indexPath.row]
        return protoCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let height = raindowTable.frame.height
        let newHeight = Int(height) / raindowTable.numberOfRows(inSection: 0)
        return CGFloat(newHeight)
    }
}
