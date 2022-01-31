//
//  UIViewController+Alert.swift
//  COVID Tracker
//
//  Created by shehab ahmed on 30/01/2022.
//

import UIKit
extension UIViewController {
    func alert(message:String){
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
         }
    func showActivityIndecator(tabelview: UITableView, indecator: UIActivityIndicatorView ) {
       indecator.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
       indecator.startAnimating()
       tabelview.addSubview(indecator)
       indecator.center = CGPoint(
           x:self.view.frame.size.width/2,
           y: self.view.frame.size.height/4
       )
       
   }
    
}
