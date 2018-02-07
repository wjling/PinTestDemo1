//
//  ViewController.swift
//  PinTestDemo1
//
//  Created by WangJinling on 2018/1/30.
//  Copyright © 2018年 wjl. All rights reserved.
//

import UIKit
import PinLayout

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let kCommonCellIdentifier = "kCommonCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCommonCellIdentifier)
        tableView.backgroundColor = .red
        view.addSubview(tableView)
        
        // a view has applied some transformation
        tableView.transform = .init(rotationAngle: CGFloat.pi * 0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        /* PinLayout and manual layout do the same thing, but manual layout is what I want. This is my problem.
         If a view has applied some transformation, I think is hard to use top(), left() or other constraints to layout it.
         The reference system has been changed because of transformation
         */
        tableView.pin.top().left().right().marginTop(80).height(100)
        
        
        // This is what I want. The same frame as that the view before transforming
        
//        tableView.frame = CGRect.init(origin: .init(x: 0, y: 80), size: CGSize.init(width: view.frame.width, height: 100))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCommonCellIdentifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // some testing code
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
}

