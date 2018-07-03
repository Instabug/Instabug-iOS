//  The converted code is limited to 4 KB.
//  Upgrade your plan to remove this limitation.
//
//  Converted to Swift 4 by Swiftify v4.1.6751 - https://objectivec2swift.com/
//
//  ViewController.m
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//
import Instabug


class ViewController: UITableViewController {
    private var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ["Show Instabug", "Invocation event", "Change theme", "Invoke with different modes...", "Set primary color", "Show intro message", "Show unread messages count", "Crash me"]
    }

// MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier", for: indexPath)
        cell?.textLabel?.text = items[indexPath.row]
        if let aCell = cell {
            return aCell
        }
        return UITableViewCell()
    }
 // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            Instabug.invoke()
        } else if indexPath.row == 1 {
            showInvocationEventsActionSheet()
        } else if indexPath.row == 2 {
            showThemesActionSheet()
        } else if indexPath.row == 3 {
            showInvocationModesActionSheet()
        } else if indexPath.row == 4 {
            showPrimaryColorSelectorActionSheet()
        } else if indexPath.row == 5 {
            Instabug.showIntroMessage()
        } else if indexPath.row == 6 {
            showUnreadMessagesCount()
        } else if indexPath.row == 7 {
            crashMe()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
// MARK: - Controller Methods
    func showInvocationEventsActionSheet() {
        
        let shakeAction = UIAlertAction.ibg_action(withTitle: "Shake", handler: { action in
            Instabug.setInvocationEvent(.shake)
        })
        
        let swipeAction = UIAlertAction.ibg_action(withTitle: "Swipe", handler: { action in
            Instabug.setInvocationEvent(.twoFingersSwipeLeft)
        })
        
        let screenshotAction = UIAlertAction.ibg_action(withTitle: "Screenshot", handler: { action in
            Instabug.setInvocationEvent(.screenshot)
        })
        
        let floatingButtonAction = UIAlertAction.ibg_action(withTitle: "Floating button", handler: { action in
            Instabug.setInvocationEvent(.floatingButton)
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
 
            
    func showInvocationModesActionSheet() {
        let newBugAction = UIAlertAction.ibg_action(withTitle: "New bug", handler: { action in
            Instabug.invoke(with: .newBug)
        })
        let newFeedbackAction = UIAlertAction.ibg_action(withTitle: "New feedback", handler: { action in
            Instabug.invoke(with: .newFeedback)
        })
        let newChatAction = UIAlertAction.ibg_action(withTitle: "New chat", handler: { action in
            Instabug.invoke(with: .newChat)
        })
        let chatsListAction = UIAlertAction.ibg_action(withTitle: "Chats list", handler: { action in
            Instabug.invoke(with: .chatsList)
        })
        ibg_showAlert(withTitle: "Invocation Events",
                      message: "Select an invocation event",
                      actions: [newBugAction, newFeedbackAction, newChatAction, chatsListAction])
    }

    func showPrimaryColorSelectorActionSheet() {
        let redColor = UIColor(red: 250.0 / 255.0, green: 38.0 / 255.0, blue: 22.0 / 255.0, alpha: 1.0)
        let greenColor = UIColor(red: 27.0 / 255.0, green: 128.0 / 255.0, blue: 18.0 / 255.0, alpha: 1.0)
        let blueColor = UIColor(red: 51.0 / 255.0, green: 87.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        let redAction = UIAlertAction.ibg_action(withTitle: "Red", handler: { action in
            Instabug.setPrimaryColor(redColor)
        })
        let greenAction = UIAlertAction.ibg_action(withTitle: "Green", handler: { action in
            Instabug.setPrimaryColor(greenColor)
        })
        let blueAction = UIAlertAction.ibg_action(withTitle: "Blue", handler: { action in
            Instabug.setPrimaryColor(blueColor)
        })
        ibg_showAlert(withTitle: "Select Primary Color",
                      message: "Select a color to set as the primary color of the SDK",
                      actions: [redAction, greenAction, blueAction])
    }
    
    func showUnreadMessagesCount() {
        let unreadMessagesCount = Instabug.getUnreadMessagesCount()
        let unreadMessagesCountString = "You have \(unreadMessagesCount) unread message(s)."
        let alertController = UIAlertController(title: "Unread Messages", message: unreadMessagesCountString, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
    
    func crashMe() {
        [Any]()[100]
    }
}
