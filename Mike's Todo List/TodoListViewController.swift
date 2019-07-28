//
//  ViewController.swift
//  Mike's Todo List
//
//  Created by Manh Phuc on 7/26/19.
//  Copyright © 2019 Mike Nguyen. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var arrayContent = ["Do homework", "Buy vestable", "Buy eggs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayContent.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        cell.textLabel?.text = arrayContent[indexPath.row]
  
        
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print(indexPath.row)
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
//        print ("hit Plus")
        var textFieldEntered = UITextField()
        
        let alert = UIAlertController.init(title: "Add new task here babi!", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "Add task", style: .default) { (alertAction) in
//            print ("hit Add task button")
            self.arrayContent.append(textFieldEntered.text!)
            self.tableView.reloadData()
//            print (self.arrayContent)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter new task"
            textFieldEntered = alertTextField
//            print (alertTextField.text!)
        }
        
        present(alert, animated: true)
        
        alert.addAction(action)
        
        
        
    }
    
}

