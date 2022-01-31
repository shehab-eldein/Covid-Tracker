//
//  ViewController.swift
//  COVID Tracker
//
//  Created by shehab ahmed on 17/01/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var covidIcon: UIImageView!
    @IBOutlet weak var covidLabel: UILabel!
    @IBOutlet weak var trackerLabel: UILabel!
    @IBOutlet weak var allStatisticsBtn: UIButton!
    @IBOutlet weak var countryStatisticsBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateWordsOpen()
        navigationController?.navigationBar.isHidden = true
        
    }
    private func animateWordsOpen() {
        UIView.animate(withDuration: 3, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.allOutOfScreen()
            self.covidLabel.transform = CGAffineTransform(translationX: -70, y: 0)
            self.trackerLabel.transform = CGAffineTransform(translationX: self.view.bounds.width/10, y: 0)
        }) { _ in
            self.animateLogoUp()
        }
    }
    private func allOutOfScreen () {
        UIView.animate(withDuration: 1) {
            self.covidIcon.isHidden = true
            self.allStatisticsBtn.isHidden = true
            self.countryStatisticsBtn.isHidden = true
            self.covidIcon.transform = CGAffineTransform(translationX: 0, y: 100)
            self.allStatisticsBtn.transform = CGAffineTransform(translationX: -self.view.bounds.width/1.5, y: 0)
            self.countryStatisticsBtn.transform = CGAffineTransform(translationX: self.view.bounds.width/1.5, y: 0)
        }
    }
    private func animateLogoUp() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: [.curveEaseInOut], animations: {
            self.covidIcon.isHidden = false
            self.covidIcon.transform = .identity
        }) { _ in
            self.animateWordsClose()
        }
    }
    private func animateWordsClose() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 5, options: [.curveEaseInOut], animations: {
            self.covidLabel.transform = .identity
            self.trackerLabel.transform = .identity
            self.delay(seconds: 0.8) {
                self.flyBtn1Right()
                self.delay(seconds: 0.5) {
                    self.flyBtn2Left()
                }
            }
        })
    }
    
    private func flyBtn1Right () {
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [.curveEaseInOut], animations: {
            self.allStatisticsBtn.isHidden = false
            self.allStatisticsBtn.transform = .identity
        }, completion: nil)
    }
    private func flyBtn2Left () {
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [.curveEaseInOut], animations: {
            self.countryStatisticsBtn.isHidden = false
            self.countryStatisticsBtn.transform = .identity
        }, completion: nil)
    }
    
    
    private func delay(seconds: Double, completion: @escaping ()-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
    }
    
    @IBAction func allStatisticsTapped(_ sender: Any) {
            let allCountryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AllCountryVC" ) as! AllCountryVC
        navigationController?.pushViewController(allCountryVC, animated: true)
    }
    
    @IBAction func countryStatistecsTapped(_ sender: Any) {
        let searchCountryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchCountryVC" ) as! SearchCountryVC
    navigationController?.pushViewController(searchCountryVC, animated: true)
    }
}

