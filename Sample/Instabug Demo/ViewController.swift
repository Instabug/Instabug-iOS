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
        items = ["Show Instabug", "Show intro message",  "Crash me", "Show NPS Survey", "Show Multiple Question Survey", "Show Feature Requests" , "Show unread messages count", "Settings"]
        executeHelloWorldRequest()
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier", for: indexPath)
        cell?.textLabel?.text = items[indexPath.row]
        if #available(iOS 8.2, *) {
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        }
        if indexPath.row == 7 {
            cell?.accessoryType = .disclosureIndicator
        }
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
            Instabug.showWelcomeMessage(with: .beta)
        } else if indexPath.row == 2 {
            crashMe()
        } else if indexPath.row == 3 {
            Instabug.showSurvey(withToken: "WTMvHW4ZQwQjsVCY9gsIgA")
        } else if indexPath.row == 4 {
            Instabug.showSurvey(withToken: "FeOS11wGXcuYgIukm4kFXw")
        } else if indexPath.row == 5 {
            Instabug.showFeatureRequests()
        } else if indexPath.row == 6 {
            showUnreadMessagesCount()
        } else if indexPath.row == 7 {
            performSegue(withIdentifier: "showSettings", sender: self)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Controller Methods
    
    func executeHelloWorldRequest() {
        let urlSession = URLSession(configuration: .default)
        guard let url = URL(string: "https://echo-api.3scale.net/helloworld") else {
            print("Invalid URL")
            return
        }
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            guard let resp = response else { print("Response is nil"); return; }
            print("Response: \(resp)")
        }
        dataTask.resume()
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
        let _ = [Any]()[100]
    }
}
