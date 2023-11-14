//
//  CruiseDetail_ViewController.swift
//  Team4_MAPD714_ProjectMilestone2
//  Created on 2023-10-30.
//  Submitted on 2023-11-13.
//  For MAPD 714 Milestone 3 Submission
//  For Team 4 -
//      Rahul Edirisinghe (301369991)
//      Salisha Giri      (301369710)

//Version 2.0 after new changes from Milestone 2 - Created new GitHub:

import UIKit
//This is the detail page, here we will display details about the selected
//from the previous screen. Includes 3 images are per requirements.
class CruiseDetail_ViewController: UIViewController {
    
    //image credentails:---------------
    
    //Photo by Mikhail Nilov: https://www.pexels.com/photo/aerial-view-of-the-reef-at-atlantis-9400822/
    // - Cruise1_DetailImage_Main
    //Photo by Jan Tang: https://www.pexels.com/photo/view-of-a-coast-and-cruise-ship-on-the-sea-in-split-croatia-18759971/
    // - Cruise1_DetailImage_Side
    
    //Photo by Michael Block: https://www.pexels.com/photo/colorful-cliffside-village-3225528/
    // - Cruise2_DetailImage_Main
    //Photo by Luis Quintero: https://www.pexels.com/photo/buildings-near-the-beach-1559699/
    // - Cruise2_DetailImage_Side
    
    //Photo by Дмитрий Трепольский: https://www.pexels.com/photo/panoramic-view-of-havana-cuba-18395257/
    // - Cruise3_DetailImage_Main
    //Photo by Gerhard Lipold: https://www.pexels.com/photo/palm-trees-on-beach-11011175/
    // - Cruise3_DetailImage_Side
    
    //Photo by Timo Volz: https://www.pexels.com/photo/gardens-by-the-bay-singapore-1842332/
    // - Cruise4_DetailImage_Main
    //Photo by Asad Photo Maldives: https://www.pexels.com/photo/aerial-view-of-a-beautiful-island-resort-3601425/
    // - Cruise4_DetailImage_Side
    
    //Photo by Bagus Pangestu: https://www.pexels.com/photo/close-up-photography-of-cherry-blossom-tree-1440476/Photo by
    // - Cruise5_DetailImage_Main
    //Pixabay: https://www.pexels.com/photo/blue-lake-surrounded-by-mountains-and-green-leaved-trees-during-daytime-163874/
    // - Cruise5_DetailImage_Side
    
    //---------------------------------

    //create and initialize variables to be used to store the incoming cruise details from
    //the previous page using the naviagtion controller hcscreenChange
    var duration:Int = 0
    var cruiseName:String = ""
    var visitingPlaces:String = ""
    var cruiseImage:String = ""
    var cruisePrice:Double = 0.0
    var cruiseStartDate: String = ""
    var cruiseEndDate: String = ""
    
    //create and initialize variables to be used to store the incoming cruise relevant images:
    //added var_ at the front of the variables to better destinguish them from the UI Image View refererences
    var var_MainImage:String = ""
    var var_sideImage_1:String = ""
    var var_sideImage_2:String = ""
    
    //create references form the UILabels that will be used to display the information
    @IBOutlet weak var label_cruiseName: UILabel!
    @IBOutlet weak var label_cruiseDuration: UILabel!
    
    @IBOutlet weak var para_cruiseVistingPlaces: UITextView!
    @IBOutlet weak var label_cruisePrice: UILabel!
    @IBOutlet weak var label_cruiseStartDate: UILabel!
    @IBOutlet weak var label_cruiseEndDate: UILabel!
    
    //create references form the UIImageViews that will be used to display the images relevant to the selected cruise
    @IBOutlet weak var image_Main: UIImageView!
    @IBOutlet weak var image_Side_1: UIImageView!
    @IBOutlet weak var image_Side_2: UIImageView!
    
    //create reference for the back UIButton
    @IBOutlet weak var button_backToSelectScreen: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //set the recieved cruise information to the created UILabel references
        label_cruiseName.text = cruiseName
        label_cruisePrice.text = String(cruisePrice)
        label_cruiseDuration.text = String(duration)
        para_cruiseVistingPlaces.text = visitingPlaces
        label_cruiseStartDate.text =  cruiseStartDate
        label_cruiseEndDate.text = cruiseEndDate
        
        //set the images for the detail page:
        image_Main.image = UIImage(named: var_MainImage)
        image_Side_1.image = UIImage(named: var_sideImage_1)
        image_Side_2.image = UIImage(named: var_sideImage_2)
        
        //Set title of view controller:
        self.navigationItem.title = cruiseName
        
    }

    /*
    //go back to the Cruise Select Screen when the Back UIButton is clicked, same functionality as the
    //Home button in the cruise Select Page
    @IBAction func backButtonClicked(_ sender: UIButton) {
        //set control to go back to previous screen as per:
        let previousScreen = storyboard?.instantiateViewController(identifier: "cruise_select")
        as! CruiseSelect_ViewController //
        
        
        //change the view and present the previousScreen object
        previousScreen.view.frame = view.frame
        present(previousScreen, animated: true)
    }*/
    
    //When the Book Now button is clicked move to the booking details entry page:
    @IBAction func bookNowButtonClicked(_ sender: UIButton){
        //code--
        //now uses segues - (push depreceated) to move to next page using the navigation controller set up for this app.
        //call the correct segue using its id
        performSegue(withIdentifier: "to_booking", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check if the correct segue was called/used
        if segue.identifier == "to_booking"{
            if let bookingDetailScreenChange = segue.destination as? BookingDetails_ViewController {
                //pass on the required information to the next page using the segue, as we would with a
                //controller
                    bookingDetailScreenChange.b_cruiseName = cruiseName
                    bookingDetailScreenChange.b_visitingPlaces = visitingPlaces
                    bookingDetailScreenChange.b_duration = cruiseStartDate + " to " + cruiseEndDate
                    bookingDetailScreenChange.b_cruisePrice = cruisePrice
                bookingDetailScreenChange.b_numOfNights = duration
                
                
                //this process will be used for all pages going forward in this app.
            }
        }
    }
}
