//
//  RegisterPage_ViewController.swift
//  Team4_MAPD714_ProjectMilestone2
//  Created on 2023-10-30.
//  Submitted on 2023-11-13.
//  For MAPD 714 Milestone 3 Submission
//  For Team 4 -
//      Rahul Edirisinghe (301369991)
//      Salisha Giri      (301369710)

//Version 2.0 after new changes from Milestone 2 - Created new GitHub:

import UIKit
//A simple dummy registration Page as per th requirements, not functional as the app
//is not yet connected to a database.
class RegisterPage_ViewController: UIViewController {

    //create reference for the currently only function view component: The back Button
    @IBOutlet weak var backToHome_Register: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //This function is used to go back to the Home Screen
    //when the Home UIButton is clicked,
    @IBAction func onBackButtonClicked(_ sender: UIButton) {
        //set control to go back to previous screen as per:
        let previousScreen = storyboard?.instantiateViewController(identifier: "cruise_home")
        as! HomePage_ViewController //
        
        
        //change the view and present the previousScreen object
        previousScreen.view.frame = view.frame
        present(previousScreen, animated: true)
    }
}
