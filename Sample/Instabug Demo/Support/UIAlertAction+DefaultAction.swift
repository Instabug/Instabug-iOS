//  UIAlertAction+DefaultAction.m
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//

import UIKit

extension UIAlertAction {
    static func ibg_action(withTitle title: String?,
                           handler: @escaping (_ action: UIAlertAction?) -> Void) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: .default, handler: handler)
        return action
    }
}
