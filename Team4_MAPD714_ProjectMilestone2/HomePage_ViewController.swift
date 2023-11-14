//
//  HomePage_ViewController.swift
//  Team4_MAPD714_ProjectMilestone2
//  Created on 2023-10-30.
//  Submitted on 2023-11-13.
//  For MAPD 714 Milestone 3 Submission
//  For Team 4 -
//      Rahul Edirisinghe (301369991)
//      Salisha Giri      (301369710)

//Version 2.0 after new changes from Milestone 2 - Created new GitHub:

//Project Desctiption:
/*
 The goal of this milestone is to complete three more pages of the proposed cruise application:
Booking Details Page, Payment Information Page and the Confirmation Detail Page.
 The pages need to have proper
 formatting for both Iphone and Ipad. The app now uses a Navigation Controller to Move
 around the pages of the app. Once a cruise is chosen, the customer needs to enter details about
 the booking, then proceed to payment information whilst selecting a payment type and entering
 thier payment information, then the app shows the details of the reservation.
 */

import UIKit

//This will be the second lightest page and will be used as the home/introdutory
//page/screen of the cruise application.

//Now has Navigation Controller via Editor -> Embed In
class HomePage_ViewController: UIViewController {

    //Create references for the UI elements that used to create the home screen
    @IBOutlet weak var navigationToolBar: UIToolbar! //This is a UIToolbar not a navigation bar
    @IBOutlet weak var homeScreenHeader: UILabel!
    @IBOutlet weak var loginBarButton: UIBarButtonItem!
    @IBOutlet weak var registerBarButton: UIBarButtonItem!
    @IBOutlet weak var selectCruiseBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Navigation of this App by the home screen is handled by the toolbar with its bar button Items.
    //The bar item's onClicks are handled below as such:
    
    
    //This function will be used to create a control object that will be used to send the
    //user to cruise select page once they click on the Cruise Select Option in the toolbar
    
    //The application will use this method to move from screen to screen
    @IBAction func onCruiseSelectClicked(_ sender: UITabBarItem){
        
        let screenChange = storyboard?.instantiateViewController(identifier: "cruise_select")
        as! CruiseSelect_ViewController //
        
        //no information is required to be passed over
        
        //change the view and present the screenChange object
        screenChange.view.frame = view.frame
        present(screenChange, animated: true)
    }
    
    //This function will be used to create a control object that will be used to send the
    //user to Login page once they click on the Login Option in the toolbar
    @IBAction func onLoginClicked(_ sender: UITabBarItem) {
        let screenChange = storyboard?.instantiateViewController(identifier: "cruise_login")
        as! LoginPage_ViewController //
        
        //no information is required to be passed over
        
        //change the view and present the screenChange object
        screenChange.view.frame = view.frame
        present(screenChange, animated: true)
    }
    
    //This function will be used to create a control object that will be used to send the
    //user to Register page once they click on the Register Option in the toolbar
    @IBAction func onRegisterClicked(_ sender: UITabBarItem) {
            let screenChange = storyboard?.instantiateViewController(identifier: "cruise_register")
            as! RegisterPage_ViewController //
            
            //no information is required to be passed over
            
            //change the view and present the screenChange object
            screenChange.view.frame = view.frame
            present(screenChange, animated: true)
    }
}

