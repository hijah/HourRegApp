//
//  ArbejdsopgaveViewController.swift
//  PNRustfriApp
//
//  Created by Casper on 12/12/2018.
//  Copyright © 2018 Casper. All rights reserved.
//

import UIKit
import Alamofire


class ArbejdsopgaveViewController: UIViewController {

    @IBOutlet weak var arbejdstimer: UITextField!
    
    @IBOutlet weak var køretimer: UITextField!
    
    @IBOutlet weak var eksternjob: UITextField!
    
    @IBOutlet weak var internjob: UITextField!
    
    @IBOutlet weak var overtid: UITextField!
    
    @IBOutlet weak var afspadsering: UITextField!
    
    @IBOutlet weak var sted: UITextField!
    
    @IBOutlet weak var fritvalgskonto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendarbejdsopgave(_ sender: Any) {
        
        
        let url = "http://hoursregisteringrestservice.azurewebsites.net/Service1.svc/addDay"
        let parameters: Parameters = ["WorkHour": arbejdstimer.text!,
                                      "DriveHour": køretimer.text!,
                                      "ExternJobNr" : eksternjob.text!,
                                      "InternJobNr": internjob.text!,
                                      "Overtime": overtid.text!,
                                      "PlaceId": sted.text!,
                                      "TimeOff": afspadsering.text!,
                                      "FritValgsKonto": fritvalgskonto.text!,
                                      "Date": "/Date(1542326400000+0000)/",
                                      "UserId": "1"]
    
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
            print(response)
        }
            .responseData { response in
                print("DataResponse")
        }
            .responseJSON { reponse in
                print("JSON RESPONSE")
        }
            .responsePropertyList { response in
                print("Property list")
                
           
            
        }
        
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
