//
//  ViewController.swift
//  SimpleTableView
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var myArr = [6, 5, 1, 10, 8, 2, 7, 3]
    private let myEtalonArr = [6, 5, 1, 10, 8, 2, 7, 3]
    private var isSorted = false  

    @IBOutlet weak var switchTypeSort: UISegmentedControl!
    @IBOutlet weak var buttonSort: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    @IBAction func reset(_ sender: UISegmentedControl) {
        resetData()
    }
    
    private func bubleSorting(){
        if !isSorted {
            Sorter.bubbleSort(values: &myArr)
            isSorted = true
        }
        for state in Sorter.statements{
            myTableView.moveRow(at: IndexPath(row : state.0, section : 0), to: IndexPath(row : state.1, section : 0))
            print(state)
            Sorter.statements.removeFirst()
            break
            
        }
    }
    
    private func resetData(){
        myArr = myEtalonArr
        isSorted = false
        myTableView.reloadData()
    }
    
    private func insertionSorting(){
        if !isSorted {
            Sorter.insertionSort(values: &myArr)
            isSorted = true
        }
        for state in Sorter.statements{
            myTableView.moveRow(at: IndexPath(row : state.0, section : 0), to: IndexPath(row : state.1, section : 0))
            print(state)
            Sorter.statements.removeFirst()
            break
            
        }
    }
    
    
    
    @IBAction func stepByStep(_ sender: UIButton) {
        switch switchTypeSort.selectedSegmentIndex {
        case 0: bubleSorting()
        case 1: insertionSorting()
        default: buttonSort.isEnabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myArr)
        //Sorter.insertionSort(values: &myArr)
        print(myArr)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellIdentifier", for: indexPath)
        cell.textLabel?.text = "\(myArr[indexPath.row])"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myArr.count;
    }
    
    
}

