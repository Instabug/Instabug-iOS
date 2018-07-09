//  UIViewController+DefaultAlertController.m
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//

import UIKit

extension UIViewController {
    func ibg_showAlert(withTitle title: String?, message: String?, actions: [UIAlertAction]?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for action: UIAlertAction? in actions ?? [UIAlertAction?]() {
            if let anAction = action {
                alertController.addAction(anAction)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
