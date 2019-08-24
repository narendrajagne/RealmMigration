//
//  NKJagne.swift
//  RealmDatabseMigration
//
//  Created by NK Jagne on 24/08/19.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift


final class NKJagne: Object {
    
    /* old version database properties */
    dynamic var pickUpArea = ""
    dynamic var dropingArea = ""
    dynamic var cab_No = 0
    
    /* in new version , you need to add one new properties */
    dynamic var tripType = ""
}
