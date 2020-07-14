//
//  BaseTableViewCell.swift
//  iOS-test
//
//  Created by Алина Кошманова on 13.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

protocol BaseTableViewCell {
    func configureWith(cellObject: BaseTableViewCellObject)
}
