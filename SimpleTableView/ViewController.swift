//
//  ViewController.swift
//  SimpleTableView
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var myArr = [6, 5, 1, 10, 8, 2, 7]
    private let myEtalonArr = [6, 5, 1, 10, 8, 2, 7]
    private var isSorted = false
    private var isMergeSort = false
    private var curentState = [[Int]]()
    @IBOutlet weak var switchTypeSort: UISegmentedControl!
    @IBOutlet weak var buttonSort: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    @IBAction func reset(_ sender: UISegmentedControl) {
        resetData()
    }
    
    private func bubleSorting(){
        if !isSorted {
            Sorter.bubbleSortVisual(values: &myArr)
            isSorted = true
        }
        if let state = Sorter.states.first{
            myTableView.moveRow(at: IndexPath(row : state.0, section : 0), to: IndexPath(row : state.1, section : 0))
            Sorter.states.removeFirst()
            buttonSort.isEnabled = !Sorter.states.isEmpty
        }
    }
    
    private func resetData(){
        myArr = myEtalonArr
        isSorted = false
        isMergeSort = false
        myTableView.reloadData()
        buttonSort.isEnabled = true
    }
    
    private func insertionSorting(){
        if !isSorted {
            Sorter.insertionSortVisual(values: &myArr)
            isSorted = true
        }
        if let state = Sorter.states.first{
            myTableView.moveRow(at: IndexPath(row : state.0, section : 0), to: IndexPath(row : state.1, section : 0))
            Sorter.states.removeFirst()
            buttonSort.isEnabled = !Sorter.states.isEmpty
        }
    }
    
    private func mergeIterationSorting(){
        myTableView.beginUpdates()
        for i in 0..<myTableView.numberOfSections{
            for j in 0..<myTableView.numberOfRows(inSection: i){
                myTableView.deleteRows(at: [IndexPath(row : j, section : i)], with: .automatic)
            }
        }
        if !isSorted {
            Sorter.mergeIterationSortVisual(values: myArr)
            isSorted = true
            curentState = Sorter.statesMerge.first!
            myTableView.deleteSections(IndexSet([0]), with: .automatic)
            isMergeSort = true
            myTableView.insertSections(IndexSet(0..<curentState.count), with: .automatic)
            Sorter.statesMerge.removeFirst()
        }else{
            if let first = Sorter.statesMerge.first{
                myTableView.deleteSections(IndexSet(0..<curentState.count), with: .automatic)
                curentState = first
                myTableView.insertSections(IndexSet(0..<curentState.count), with: .automatic)
                Sorter.statesMerge.removeFirst()
                buttonSort.isEnabled = !Sorter.statesMerge.isEmpty
            }
        }
        myTableView.endUpdates()
    }
    
    @IBAction func stepByStep(_ sender: UIButton) {
        switch switchTypeSort.selectedSegmentIndex {
        case 0: bubleSorting()
        case 1: insertionSorting()
        case 2: mergeIterationSorting()
        default: buttonSort.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var arr = myArr
        print(arr)
        Sorter.mergeRecSort(values: &arr)
        print(arr)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellIdentifier", for: indexPath)
        if isMergeSort{
            cell.textLabel?.text = "\(curentState[indexPath.section][indexPath.row])"
        }else{
            cell.textLabel?.text = "\(myArr[indexPath.row])"
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        if isMergeSort{
            return curentState.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isMergeSort{
            return curentState[section].count
        }
        return myArr.count
    }
}

