//
//  SettingsTableViewController.swift
//  Instabug Demo
//
//  Created by Aly Yakan on 7/3/18.
//  Copyright © 2018 Instabug. All rights reserved.
//

import UIKit
import Instabug

class SettingsTableViewController: UITableViewController {
    private var items = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        items = ["Change Invocation Event", "Change Theme", "Set Primary Color"]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath)
        cell?.textLabel?.text = items[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        if let aCell = cell {
            return aCell
        }
        return UITableViewCell()
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            showInvocationEventsActionSheet()
        } else if indexPath.row == 1 {
            showThemesActionSheet()
        } else if indexPath.row == 2 {
            showPrimaryColorSelectorActionSheet()
        }
    }
    
    // MARK: - Helpers
    
    func showInvocationEventsActionSheet() {
        
        let shakeAction = UIAlertAction.ibg_action(withTitle: "Shake", handler: { action in
            BugReporting.invocationEvents = [.shake]
        })
        
        let swipeAction = UIAlertAction.ibg_action(withTitle: "Swipe", handler: { action in
            BugReporting.invocationEvents = [.twoFingersSwipeLeft]
        })
        
        let screenshotAction = UIAlertAction.ibg_action(withTitle: "Screenshot", handler: { action in
            BugReporting.invocationEvents = [.screenshot]
        })
        
        let floatingButtonAction = UIAlertAction.ibg_action(withTitle: "Floating button", handler: { action in
            BugReporting.invocationEvents = [.floatingButton]
        })
        
        ibg_showAlert(withTitle: "Invocation Event",
                      message: "Select an invocation event",
                      actions: [shakeAction, swipeAction, screenshotAction, floatingButtonAction])
    }
    
    func showThemesActionSheet() {
        let lightAction = UIAlertAction.ibg_action(withTitle: "Light", handler: { action in
            Instabug.setColorTheme(.light)
        })
        
        let darkAction = UIAlertAction.ibg_action(withTitle: "Dark", handler: { action in
            Instabug.setColorTheme(.dark)
        })
        
        ibg_showAlert(withTitle: "Theme", message: "Select a theme", actions: [lightAction, darkAction])
    }
    
    func showPrimaryColorSelectorActionSheet() {
        let redColor = UIColor(red: 250.0 / 255.0, green: 38.0 / 255.0, blue: 22.0 / 255.0, alpha: 1.0)
        let greenColor = UIColor(red: 27.0 / 255.0, green: 128.0 / 255.0, blue: 18.0 / 255.0, alpha: 1.0)
        let blueColor = UIColor(red: 51.0 / 255.0, green: 87.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        let redAction = UIAlertAction.ibg_action(withTitle: "Red", handler: { action in
            Instabug.tintColor = redColor
        })
        let greenAction = UIAlertAction.ibg_action(withTitle: "Green", handler: { action in
            Instabug.tintColor = greenColor
        })
        let blueAction = UIAlertAction.ibg_action(withTitle: "Blue", handler: { action in
            Instabug.tintColor = blueColor
        })
        ibg_showAlert(withTitle: "Select Primary Color",
                      message: "Select a color to set as the primary color of the SDK",
                      actions: [redAction, greenAction, blueAction])
    }

}
