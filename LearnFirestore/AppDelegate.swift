//
//  AppDelegate.swift
//  LearnFirestore
//
//  Created by Mohamed on 11/1/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        let db = Firestore.firestore()
        
        
        // intailize document to add fields
        
        var documnets:DocumentReference? = nil
        
        
        
        documnets = db.collection("Users").addDocument(data: ["Name" : "Mohamed"], completion: { (error) in
            
            
            if let error = error {
                
                print(error.localizedDescription)
            }else{
                
                print("data added successfully")
            }
            
        })
        
        
        // read data
        
        
        db.collection("Users").getDocuments { (snapQuery, error) in
            
            if let error = error {
                
                
                print(error.localizedDescription)
            }else{
                
                for document in snapQuery!.documents {
                    
                    
                    print(document["Name"] as! String)
                }
            }
            
            
        }
        

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

