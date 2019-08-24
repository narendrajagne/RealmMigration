//
//  ViewController.swift
//  RealmDatabseMigration
//
//  Created by NK Jagne on 24/08/19.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NKJagneLocalStorage.tripStore()
    }


}

