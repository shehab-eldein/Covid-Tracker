//
//  InfoCell.swift
//  COVID Tracker
//
//  Created by shehab ahmed on 18/01/2022.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var testesLabel: UILabel!
    @IBOutlet weak var totalCasesLabel: UILabel!
    @IBOutlet weak var recCasesLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var continentLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var deathesLabel: UILabel!
    @IBOutlet weak var totalDeasthesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
}
    func configureCell (infoArr: [information],indexPath: IndexPath) {
        countryLabel.text = infoArr[indexPath.row].country
        continentLabel.text = infoArr[indexPath.row].continent ?? "-"
        populationLabel.text = String(infoArr[indexPath.row].population ?? 0)
        newCasesLabel.text = infoArr[indexPath.row].cases?.new ?? "0"
        recCasesLabel.text = String(infoArr[indexPath.row].cases?.recovered ?? 0)
        totalCasesLabel.text = String(infoArr[indexPath.row].cases?.total ?? 0)
        testesLabel.text = String(infoArr[indexPath.row].tests?.total ?? 0)
        deathesLabel.text = infoArr[indexPath.row].deaths?.new ?? "-"
        totalDeasthesLabel.text = String(infoArr[indexPath.row].deaths?.total ?? 0)
    }
    
    
}
