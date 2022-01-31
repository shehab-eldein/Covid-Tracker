//
//  SearchCountryVC.swift
//  COVID Tracker
//
//  Created by shehab ahmed on 29/01/2022.
//

import UIKit

class SearchCountryVC: UIViewController {
    
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var searchBar: UISearchBar!
    var infoArr: [information] = []
    var country: String = ""
    let indecator = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        
        super.viewDidLoad()
        activeTabelView()
        searchBar.delegate = self
        indecator.isHidden = true
        navigationController?.navigationBar.isHidden = false
        title = "Search by Country "
        datePickerConfigure()
    }
    
    private func datePickerConfigure() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        let date = Date()
        datePicker.maximumDate = date
    }
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: datePicker.date)
        return date
    }
    
    private func getData() {
        NetworkingManager.get(country: country, Date: getDate(), spinner: indecator) { (error, result,resultNum) in
            if let finalResult = result {
                self.infoArr = finalResult
                self.resultsNumHandlling(result: resultNum)
                self.tabelView.reloadData()
            }
            if let error = error {
                self.alert(message: error.localizedDescription)
            }
        }
    }
    private func resultsNumHandlling (result: Int?) {
        if result == 0 {
            alert(message: "No Matching Results")
            
        }
    }
    private func hidePicker () {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.datePicker.alpha = 0
            self.tabelView.transform = CGAffineTransform(translationX: 0, y:-60 )
        }, completion: nil)
    }
    private func showPicker () {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.tabelView.transform = .identity
        }, completion: {_ in
            self.datePicker.alpha = 1
        })
    }
}
extension SearchCountryVC: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let search = searchBar.text {
            country = search
            getData()
            showActivityIndecator(tabelview: tabelView, indecator: indecator)
            hidePicker()
        }
        if searchBar.text?.isEmpty == true {
            alert(message: "The Search Field is Empty!")
        }
    }
    func  searchBar(_ searchBar: UISearchBar, textDidChange: String) {
        showPicker()
    }
}
extension SearchCountryVC: UITableViewDelegate,UITableViewDataSource {
    private func activeTabelView() {
        tabelView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tabelView.delegate = self
        tabelView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
        cell.configureCell(infoArr: infoArr, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
