//
//  BaseTableViewCellObject.swift
//  iOS-test
//
//  Created by Алина Кошманова on 13.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

protocol BaseTableViewCellObject {
    func cellReuseIdentifier() -> String
    func height() -> CGFloat
}
