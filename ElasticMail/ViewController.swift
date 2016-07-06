//
//  ViewController.swift
//  ElasticMail
//
//  Created by Satnam Sync on 05/07/16.
//  Copyright © 2016 com.silverseahog. All rights reserved.
//

import UIKit
import SwiftHTTP

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            //the url sent will be https://google.com?hello=world&param2=value2
            
            let opt = try HTTP.GET("https://api.elasticemail.com/v2/email/send", parameters: [
                "apikey": "xxxxxxx-x-xxxxxx-x-x-xx",
                "subject": "A test mail",
                "from" : "support@example.com",
                "fromName" : "Tester Singh",
                "sender" : "Tester",
                "senderName" : "Some Name",
                "msgFrom" : "From",
                "replyToName" : "Satnam",
                "to" : "support@example.com",
                "bodyHtml" : "<h2>This is html</h2>",
                "bodyText" : "This is text",
                ])
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    return //also notify app of failure as needed
                }
                print("opt finished: \(response.description)")
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

