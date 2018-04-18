//
//  ViewController.swift
//  toDo
//
//  Created by David Baldwin on 4/18/18.
//  Copyright © 2018 David Baldwin. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var listItem : [DataItem] = [DataItem]()
    
    @IBOutlet weak var tabel_View: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        for i in 1...20 {
          
            listItem.append(DataItem(toDoitem: "To Do list item #\(i)"))
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tabel_View.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let item = listItem[indexPath.row]
            
            cell.textLabel?.text = item.toDoitem
            cell.detailTextLabel?.text = item.toDoitem
            return cell
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listItem.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            tabel_View.setEditing(true, animated: true)
        } else {
            tabel_View.setEditing(false, animated: true)
        }
    }

}

