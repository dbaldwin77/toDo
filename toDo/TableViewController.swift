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


}

