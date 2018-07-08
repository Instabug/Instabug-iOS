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
        items = ["Show Instabug", "Show intro message",  "Crash me", "Show NPS Survey", "Show Multiple Question Survey", "Show Feature Requests", "Settings"]
        executeHelloWorldRequest()
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier", for: indexPath)
        cell?.textLabel?.text = items[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        if indexPath.row == 6 {
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
            BugReporting.invoke()
        } else if indexPath.row == 1 {
            Instabug.showWelcomeMessage(with: .beta)
        } else if indexPath.row == 2 {
            crashMe()
        } else if indexPath.row == 3 {
            Surveys.showSurvey(withToken: "WTMvHW4ZQwQjsVCY9gsIgA")
        } else if indexPath.row == 4 {
            Surveys.showSurvey(withToken: "FeOS11wGXcuYgIukm4kFXw")
        } else if indexPath.row == 5 {
            FeatureRequests.show()
        } else if indexPath.row == 6 {
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
    
    func crashMe() {
        let _ = [Any]()[100]
    }
}
