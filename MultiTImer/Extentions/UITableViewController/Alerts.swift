//
//  Allerts.swift
//  MultiTImer
//
//  Created by macbookp on 04.07.2021.
//

import Foundation
import UIKit

extension UITableViewController {
    func alertWrongText(title: String) {
        let alertController = UIAlertController(title: title , message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ок", style: .default) { _ in }
        alertController.addAction(alertOk)
        present(alertController, animated: true , completion: nil)
    }
}
