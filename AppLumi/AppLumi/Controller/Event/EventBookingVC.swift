//
//  EventBookingVC.swift
//  AppLumi
//
//  Created by mac on 12/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EventBookingVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var eventBooking = [EventBookingDetail]()
    var date:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        getEventBookingDetails { (sucess) in
            if sucess{
                print("sucess")
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnWastapped(_ sender: UIButton) {
        
    }
    
    func getEventBookingDetails(completion:@escaping CompletionHandler){
        AF.request(BOOKING_EVENT_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                guard let data = response.data else {return}
                DispatchQueue.main.async {
                    self.parseDataUsingCodable(data: data)
                    self.tableView.reloadData()
                }
                completion(true)
            }else{
                debugPrint(response.error?.localizedDescription)
                completion(false)
            }
        }
    }
    
    func parseDataUsingCodable(data:Data){
        print(data)
        do{
            let eventDetail = try JSONDecoder().decode(EventBooking.self, from: data)
            for item in eventDetail.data{
                eventBooking.append(item)
            }
            print(eventBooking.count)
            
            
        }catch let error{
            print(error.localizedDescription)
        }
    }

}

//MARK:Extension for uitableview delegate and datasource method

extension EventBookingVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = eventBooking.isEmpty ? 0 : eventBooking.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookingCell") as? BookingCell else {return UITableViewCell()}
        if eventBooking.isEmpty{
            return UITableViewCell()
        }else{
            cell.addressLbl.text = eventBooking[indexPath.row].eventInfo.address
            cell.amountLbl.text = "$ \(eventBooking[indexPath.row].eventInfo.price)"
           // cell.evetntDateLbl.text = "\(String(describing: convertdate!))"
            cell.resutrantNameLbl.text = eventBooking[indexPath.row].eventInfo.name
            cell.eventDetailsBtn.addTarget(self, action: #selector(openEventDetails), for: .touchUpInside)
             var isoDate = eventBooking[indexPath.row].eventInfo.date
                   let end = isoDate.index(isoDate.endIndex, offsetBy: -5) //this line remove 5 digit at the end
                   isoDate =  String(isoDate.prefix(upTo: end))
                   
                   let isoFormatter = ISO8601DateFormatter()
                   let chatDate = isoFormatter.date(from: isoDate.appending("Z"))
                   print(chatDate)
                   
                   let newFormatter = DateFormatter()
                   newFormatter.dateFormat = "MMM d, h:mm a"
                   
                   if let finalDate = chatDate{
                       let finalDate = newFormatter.string(from: finalDate)
                    cell.evetntDateLbl.text = finalDate
                   }
            return cell

        }
        
        
    }
    
   
    
    @objc func openEventDetails(sender:UIButton){
        let buttonPostion = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPostion)
        let cell = self.tableView.cellForRow(at: indexPath!) as? BookingCell
        guard let bookingVc = self.storyboard?.instantiateViewController(withIdentifier: "BookingDetailVC") as? BookingDetailVC else {return}
//        bookingVc.price = (cell?.amountLbl.text)!
//        bookingVc.eventDate = cell?.evetntDateLbl.text
//        bookingVc.resturantAddress = cell?.addressLbl.text
//        bookingVc.resturantName = cell?.resutrantNameLbl.text
        self.navigationController?.pushViewController(bookingVc, animated: true)
    }
    
    
}
