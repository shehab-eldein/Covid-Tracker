//
//  AllCountryVC.swift
//  COVID Tracker
//
//  Created by shehab ahmed on 18/01/2022.
//

import UIKit

class AllCountryVC: UIViewController {
@IBOutlet weak var tabelView: UITableView!
    var infoArr: [information] = []
    let indecator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeTabelView()
        getData()
        navigationController?.navigationBar.isHidden = false
        title = "All Country List"
        showActivityIndecator(tabelview: tabelView, indecator: indecator)
    }
    
    private func activeTabelView() {
        tabelView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tabelView.delegate = self
        tabelView.dataSource = self
        
    }
    private func getData() {
        NetworkingManager.get(country: nil, Date: nil, spinner: indecator) { (error, result,resultNum)  in
            if let finalResult = result {
                self.infoArr = finalResult
                
                self.tabelView.reloadData()
            }
        }

    }

}
// MARK: - Table view Extension
extension AllCountryVC: UITableViewDelegate,UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
       return 1
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
        170
    }
}
