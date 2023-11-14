//
//  Confirmation_ViewController.swift
//  Team4_MAPD714_ProjectMilestone2
//  Created and Submitted on 2023-11-13.
//  For MAPD 714 Milestone 3 Submission
//  For Team 4 -
//      Rahul Edirisinghe (301369991)
//      Salisha Giri      (301369710)


//Version 2.0 after new changes from Milestone 2 - Created new GitHub:


import UIKit
//This is the lightest page, only used to display the information obtained from the
//previous pages of the app.
class Confirmation_ViewController: UIViewController {
    //declare the variables that will be used to hold recieved information
    var c_numOfNights:Int = 0
    var c_cruiseName:String = ""
    var c_visitingPlaces:String = ""
    var c_totalPrice:Double = 0.0
    
    var c_cruiseDuration:String = ""
    var c_cityCountry:String = ""
    var c_numOfGuests:Int = 0
    var c_customerName:String = ""
    var c_customerAddress:String = ""
    
    //declare lables that will be used to display the variables
    @IBOutlet weak var display_cutomerName: UILabel!
    
    @IBOutlet weak var display_customerAddress: UITextView!
    @IBOutlet weak var display_cityCountry: UILabel!
    @IBOutlet weak var display_cruiseType: UILabel!
    @IBOutlet weak var display_visitingPlaces: UITextView!
    @IBOutlet weak var display_numOfGuests: UILabel!
    @IBOutlet weak var display_numOfNights: UILabel!
    @IBOutlet weak var display_finalPrice: UILabel!
    @IBOutlet weak var display_cruiseDuration: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //set the labels's value with the corresponding information as needed.
        display_cruiseType.text = c_cruiseName
        
        display_finalPrice.text = String(c_totalPrice)
        
        display_cityCountry.text = c_cityCountry
        
        display_numOfGuests.text = String(c_numOfGuests)
        
        display_cutomerName.text = c_customerName
        
        display_visitingPlaces.text = c_visitingPlaces
        
        display_customerAddress.text = c_customerAddress
        
        display_cruiseDuration.text = c_cruiseDuration
        
        display_numOfNights.text = String(c_numOfNights)
        
    }
    

}
