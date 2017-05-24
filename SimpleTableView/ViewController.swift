//
//  ViewController.swift
//  SimpleTableView
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var myArr = [6, 5, 1, 10, 8, 2, 7]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(myArr)
        let arr = Sorter.mergeSort(values: myArr, leftIndex: 0, rightIndex : myArr.count - 1)
        print(arr)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellIdentifier", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number = 0;
        
        if (section == 0)
        {
            number = 5
        } else
        {
            number = 7
        }
        return number;
    }
}

