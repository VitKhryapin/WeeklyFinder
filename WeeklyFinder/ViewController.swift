//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Vitaly Khryapin on 01.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var mothTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var yearTF: UITextField!
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTF.text, let month = mothTF.text, let year = yearTF.text else {
            return
        }
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        resultLabel.text = capitalizedWeekday
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

