//
//  ViewController.swift
//  calender.clonecoding
//
//  Created by Soojin Lee on 2020/08/23.
//  Copyright © 2020 Suzie Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var current_year_string = "11"
    var current_month_string = "11"
    var current_day_string = "11"
    var current_weekday_string = "11"
    var current_year = 1
    var current_month = 1
    var current_day = 1
    var current_weekday = 1
    
    
    
    
    private var dateList: [Date] = []
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDateList()
        dateToString()
        dateCollectionView.delegate =  self
        dateCollectionView.dataSource = self
//          var formatter_year = DateFormatter()
//          formatter_year.dateFormat = "yyyy"
//          var current_year_string = formatter_year.string(from: Date())
//          print(current_year_string)
//
//          var formatter_month = DateFormatter()
//          formatter_month.dateFormat = "MM"
//          var current_month_string = formatter_month.string(from: Date())
//          print(current_month_string)
//
//          var formatter_day = DateFormatter()
//          formatter_day.dateFormat = "dd"
//          var current_day_string = formatter_day.string(from: Date())
//          print(current_day_string)
      
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(numOfDaysInMonth[(Int(current_month_string) ?? 0)-1])
        return numOfDaysInMonth[current_month-1]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dateCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath)
            as? DateCollectionViewCell else { return UICollectionViewCell() }
//        dateCell.set(dateList[indexPath.row])
        return dateCell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width) / 7, height: collectionView.frame.height / 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController {
    private func dateToString(){
        
        let date = Date()
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        
//        print(calendar.dateComponents(.isLeapMonth, from: date))
        
        var formatter_year = DateFormatter()
        formatter_year.dateFormat = "yyyy"
        current_year_string = formatter_year.string(from: Date())
        print(current_year_string)
        current_year=Int(current_year_string) ?? 0
        
        var formatter_month = DateFormatter()
        formatter_month.dateFormat = "MM"
        current_month_string = formatter_month.string(from: Date())
        print(current_month_string)
        current_month=Int(current_month_string) ?? 0
        
        var formatter_day = DateFormatter()
        formatter_day.dateFormat = "dd"
        current_day_string = formatter_day.string(from: Date())
        print(current_day_string)
        current_day=Int(current_day_string) ?? 0
        
//        var formatter_weekday = DateFormatter()
//        formatter_weekday.dateFormat = "dd"
//        var current_weekday_string = formatter_day.string(from: Date())
//        print(current_weekday_string)
//
        let formatter_weekday = DateFormatter()
        current_weekday_string = formatter_weekday.weekdaySymbols[Calendar.current.component(.weekday, from: Date())]
        print(current_weekday_string)
        
        if(current_weekday_string == "Monday"){
            current_weekday = 1
            
        }
        else if(current_weekday_string == "Tuesday"){
            current_weekday = 2
            
        }
        else if(current_weekday_string == "Wednesday"){
            current_weekday = 3
            
        }
        else if(current_weekday_string == "Thursday"){
            current_weekday = 4
            
        }
        else if(current_weekday_string == "Friday"){
            current_weekday = 5
            
        }
        else if(current_weekday_string == "Saturday"){
            current_weekday = 6
            
        }
        else if(current_weekday_string == "Sunday"){
            current_weekday = 7
            
        }
        else {
            current_weekday = 0
        }
        
//        var formatter_isLeapMonth = DateFormatter()
//        formatter_isLeapMonth.dateFormat = "isLeapMonth"
        //        var current_isLeapMonth_string = formatter_isLeapMonth.string(from: Date())
        //        print(current_isLeapMonth_string)
        //
        
    }
    private func setDateList(){
        
    }
    
    private func findFirstDay(){
        
        firstDayWeekday = (current_day - current_weekday)% 7
    }
    
    
    
}

