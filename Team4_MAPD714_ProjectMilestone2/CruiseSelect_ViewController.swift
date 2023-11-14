//
//  CruiseSelect_ViewController.swift
//  Team4_MAPD714_ProjectMilestone2
//  Created on 2023-10-30.
//  Submitted on 2023-11-13.
//  For MAPD 714 Milestone 3 Submission
//  For Team 4 -
//      Rahul Edirisinghe (301369991)
//      Salisha Giri      (301369710)

//Version 2.0 after new changes from Milestone 2 - Created new GitHub:

import UIKit

//This screen/view controller is the current biggest one.
//This screen will be used to show the cruise options avaible from Cente
//Cruises, there are currently 5 as outlined in the assignment instructions.
class CruiseSelect_ViewController: UIViewController {

    //create a struct for a custom class called Cruise,
    //this object will be used to store data about each cruise and
    //be used to display information about it for the detail page
    struct Cruise {
        var cruiseName: String
        var price: Double
        var visitingPlaces: String
        var duration: Int
        var imageLinkMain: String//
        var imageLinkSide: String
        var imageLinkShip: String
        var startDate: String
        var endDate:String
        
        //create constructor to initialize a class object
        init(cruiseName: String, price: Double, visitingPlaces: String, duration: Int, imageLinkMain: String, imageLinkSide:String, imageLinkShip: String, startDate: String, endDate: String) {
            self.cruiseName = cruiseName
            self.price = price
            self.visitingPlaces = visitingPlaces
            self.duration = duration
            self.imageLinkMain = imageLinkMain
            self.imageLinkSide = imageLinkSide
            self.imageLinkShip = imageLinkShip
            self.startDate = startDate
            self.endDate = endDate
        }
    }
    
    //create empty array of Cruise objects to hold all cruise options
    var cruiseListings: [Cruise] = []
    
    //image credits:---------------------- for the images used for this page
    //<a href="https://www.freepik.com/free-photo/big-luxurious-cruise-ship-docked-nice-harbor-ai-generative_41369162.htm#query=cruise%20ship&position=14&from_view=search&track=ais">Image by chandlervid85</a> on Freepik
    //- Cruise1_SelectionImage
    
    //Photo by GEORGE DESIPRIS: https://www.pexels.com/photo/white-cruise-ship-on-the-sea-945177/
    //- Cruise2_SelectionImage 
    
    //Photo by Pixabay: https://www.pexels.com/photo/white-cruise-ship-on-blue-body-of-water-during-daytime-144237/
    //- Cruise3_SelectionImage 
    
    //Photo by David Dibert: https://www.pexels.com/photo/cruise-ship-635512/
    //- Cruise4_SelectionImage
    
    //Photo by Diego F. Parra: https://www.pexels.com/photo/white-cruise-ship-on-dock-3663915/
    //- Cruise5_SelectionImage
    //------------------------------------
    
    
    //Why are the variables titled cruise_1, etc?
        /*
         This is beacuse the code was approached in a modular format and a bit of the future
        planned in mined, therefore they were not given the names of the cruises themselves.
        To prevent confusion the default postions are given below:
         */
    //Key:
    //Cruise 1 : Bahamas
    //Cruise 2 : Caribbean
    //Cruise 3 : Cuba
    //Cruise 4 : Sampler
    //Cruise 5 : Star
    
    //create refernces for the UILabels that will be used to display the:
    
    //names of the cruises available
    @IBOutlet weak var cruiseName_1: UILabel!
    @IBOutlet weak var cruiseName_2: UILabel!
    @IBOutlet weak var cruiseName_3: UILabel!
    @IBOutlet weak var cruiseName_4: UILabel!
    @IBOutlet weak var cruiseName_5: UILabel!
    
    //Prices of the cruises available
    @IBOutlet weak var cruisePrice_1: UILabel!
    @IBOutlet weak var cruisePrice_2: UILabel!
    @IBOutlet weak var cruisePrice_3: UILabel!
    @IBOutlet weak var cruisePrice_4: UILabel!
    @IBOutlet weak var cruisePrice_5: UILabel!
    
    
    //duration of the cruises avaliable
    @IBOutlet weak var cruiseDuration_1: UILabel!
    @IBOutlet weak var cruiseDuration_2: UILabel!
    @IBOutlet weak var cruiseDuration_3: UILabel!
    @IBOutlet weak var cruiseDuration_4: UILabel!
    @IBOutlet weak var cruiseDuration_5: UILabel!
    
    //create references for the UIButtons that will be used to display
    //select a cruise to see the details
    @IBOutlet weak var selectButton_Cruise_1: UIButton!
    @IBOutlet weak var selectButton_Cruise_2: UIButton!
    @IBOutlet weak var selectButton_Cruise_3: UIButton!
    @IBOutlet weak var selectButton_Cruise_4: UIButton!
    @IBOutlet weak var bookNow_Cruise_5: UIButton!
    
    //create references for the UIImageviews that will be used to display
    //a small image of the cruise ship used for the cruise
    @IBOutlet weak var image_Cruise_1: UIImageView!
    @IBOutlet weak var image_Cruise_2: UIImageView!
    @IBOutlet weak var image_Cruise_3: UIImageView!
    @IBOutlet weak var image_Cruise_4: UIImageView!
    @IBOutlet weak var image_Cruise_5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //create the list of cruises that we will use for the list/array
        //by appending a new Cruise object to the previously created empty array
        
        //Dates: Start and End Date kept as Strings for now. also store
        //Why designed like this?
            /*
             To potentailly allow for future integration of databse into app by designing it like this
             also allows us to reuse the same design page instead of creating a new one for each cruise
             listed.
             */
        //set the corresponding information for each cruise object:
        cruiseListings.append(Cruise(cruiseName: "Bahamas Cruise", price: 559.0, visitingPlaces: "Florida, Bahamas", duration: 5, imageLinkMain: "Bahamas_DetailImage_Main", imageLinkSide: "Bahamas_DetailImage_Side", imageLinkShip: "Bahamas_SelectionImage", startDate: "19-12-2024", endDate: "23-12-2024"))
        
        cruiseListings.append(Cruise(cruiseName: "Caribbean Cruise", price: 759.0, visitingPlaces: "Italy, Egypt, Greece, Spain", duration: 10, imageLinkMain: "Caribbean_DetailImage_Main", imageLinkSide: "Caribbean_DetailImage_Side", imageLinkShip: "Caribbean_SelectionImage",  startDate: "19-09-2025", endDate: "29-09-2025"))
        
        cruiseListings.append(Cruise(cruiseName: "Cuban Cruise", price: 359.0, visitingPlaces: "Cuba, Haiti, Dominican Republic", duration: 4, imageLinkMain: "Cuba_DetailImage_Main", imageLinkSide: "Cuba_DetailImage_Side", imageLinkShip: "Cuba_SelectionImage", startDate: "16-05-2024", endDate: "20-05-2024"))
        
        cruiseListings.append(Cruise(cruiseName: "Sampler Cruise", price: 459.0, visitingPlaces: "Singapore, Malaysia", duration: 7, imageLinkMain: "Sampler_DetailImage_Main", imageLinkSide: "Sampler_DetailImage_Side", imageLinkShip: "Sampler_SelectionImage", startDate: "04-04-2025", endDate: "11-04-2025"))
        
        cruiseListings.append(Cruise(cruiseName: "Star Cruise", price: 859.0, visitingPlaces: "Japan, China, Philipines, Australia", duration: 16, imageLinkMain: "Star_DetailImage_Main", imageLinkSide: "Star_DetailImage_Side", imageLinkShip: "Star_SelectionImage", startDate: "09-06-2025", endDate: "25-06-2025"))
        
        //update the labels and image views to show the cruise option information
        //They will initially be displayed sorted by Name ASC
        
        //set initial/default Label information
        cruiseName_1.text = cruiseListings[0].cruiseName
        cruiseName_2.text = cruiseListings[1].cruiseName
        cruiseName_3.text = cruiseListings[2].cruiseName
        cruiseName_4.text = cruiseListings[3].cruiseName
        cruiseName_5.text = cruiseListings[4].cruiseName
        
        //set initial/default Image information
        image_Cruise_1.image = UIImage(named: cruiseListings[0].imageLinkShip)
        image_Cruise_2.image = UIImage(named: cruiseListings[1].imageLinkShip)
        image_Cruise_3.image = UIImage(named: cruiseListings[2].imageLinkShip)
        image_Cruise_4.image = UIImage(named: cruiseListings[3].imageLinkShip)
        image_Cruise_5.image = UIImage(named: cruiseListings[4].imageLinkShip)
        
        //set initial/default price information
        cruisePrice_1.text = String(cruiseListings[0].price)
        cruisePrice_2.text = String(cruiseListings[1].price)
        cruisePrice_3.text = String(cruiseListings[2].price)
        cruisePrice_4.text = String(cruiseListings[3].price)
        cruisePrice_5.text = String(cruiseListings[4].price)
        
        //set initial/default duration information
        cruiseDuration_1.text = String(cruiseListings[0].duration)
        cruiseDuration_2.text = String(cruiseListings[1].duration)
        cruiseDuration_3.text = String(cruiseListings[2].duration)
        cruiseDuration_4.text = String(cruiseListings[3].duration)
        cruiseDuration_5.text = String(cruiseListings[4].duration)
        
        // Do any additional setup after loading the view.
    }
    
    //To assist with the reordering process as the views do not moved but
    //instead the values are shuffled. This function is used to check which
    //cruise has been selected and then return the correct cruise object in the array
    //of cruise objects. This ensures that no matter what sort orientattion is used
    //the selected cruise will always display the correct detail page details when selected
    func checkCruise(labelIdentifyerToCheck:String) -> Cruise{
        
        switch labelIdentifyerToCheck{//check what the label text says
        case cruiseListings[0].cruiseName: //if it is this cruise, according to the name
            return cruiseListings[0]//send back this object
            //break -> no need for this statement as the return handles it
            
        case cruiseListings[1].cruiseName:
            return cruiseListings[1]
            //break
            
        case cruiseListings[2].cruiseName:
            return cruiseListings[2]
            //break
            
        case cruiseListings[3].cruiseName:
            return cruiseListings[3]
            //break
            
        case cruiseListings[4].cruiseName:
            return cruiseListings[4]
            //break
            
        default:
            return cruiseListings[0]
            //break
        }
        
    }
    
    //this function will be used to reorder the listed by shuffling the labels and images around,
    //By that we mean that the defined labels will be the same and in the same position but the
        //text and image values are changed accordingly.
    @IBAction func toggleSort(_ sender:UISegmentedControl){
        //used switch case for ease of sight and coding
        switch sender.selectedSegmentIndex{
            //The following are set to ascending order (top to bottom) for :
            //For now they are manually checked and done since it is a small finite list,
            //and will be changed as the project continues.
            
            
            //name (alphabetical order
        case 0:
            //set the name of the cruise in the correct position according to above
            //mention requirement using the names stored in the list of objects
            //They are in order from top to bottom in terms of label order.
            cruiseName_1.text = cruiseListings[0].cruiseName
            cruiseName_2.text = cruiseListings[1].cruiseName
            cruiseName_3.text = cruiseListings[2].cruiseName
            cruiseName_4.text = cruiseListings[3].cruiseName
            cruiseName_5.text = cruiseListings[4].cruiseName
            
            //do the same for the image that will be displayed alongside it
            image_Cruise_1.image = UIImage(named: cruiseListings[0].imageLinkShip)
            image_Cruise_2.image = UIImage(named: cruiseListings[1].imageLinkShip)
            image_Cruise_3.image = UIImage(named: cruiseListings[2].imageLinkShip)
            image_Cruise_4.image = UIImage(named: cruiseListings[3].imageLinkShip)
            image_Cruise_5.image = UIImage(named: cruiseListings[4].imageLinkShip)
            
            //do the same for each of the prices
            cruisePrice_1.text = String(cruiseListings[0].price)
            cruisePrice_2.text = String(cruiseListings[1].price)
            cruisePrice_3.text = String(cruiseListings[2].price)
            cruisePrice_4.text = String(cruiseListings[3].price)
            cruisePrice_5.text = String(cruiseListings[4].price)
            
            //do the same for each of the durations
            cruiseDuration_1.text = String(cruiseListings[0].duration)
            cruiseDuration_2.text = String(cruiseListings[1].duration)
            cruiseDuration_3.text = String(cruiseListings[2].duration)
            cruiseDuration_4.text = String(cruiseListings[3].duration)
            cruiseDuration_5.text = String(cruiseListings[4].duration)
            
            break
        //repeat the same steps for the ones below:
            
            
            //sort by price asc
        case 1:
            
            cruiseName_1.text = cruiseListings[2].cruiseName
            cruiseName_2.text = cruiseListings[3].cruiseName
            cruiseName_3.text = cruiseListings[0].cruiseName
            cruiseName_4.text = cruiseListings[1].cruiseName
            cruiseName_5.text = cruiseListings[4].cruiseName
            
            image_Cruise_1.image = UIImage(named: cruiseListings[2].imageLinkShip)
            image_Cruise_2.image = UIImage(named: cruiseListings[3].imageLinkShip)
            image_Cruise_3.image = UIImage(named: cruiseListings[0].imageLinkShip)
            image_Cruise_4.image = UIImage(named: cruiseListings[1].imageLinkShip)
            image_Cruise_5.image = UIImage(named: cruiseListings[4].imageLinkShip)
            
            cruisePrice_1.text = String(cruiseListings[2].price)
            cruisePrice_2.text = String(cruiseListings[3].price)
            cruisePrice_3.text = String(cruiseListings[0].price)
            cruisePrice_4.text = String(cruiseListings[1].price)
            cruisePrice_5.text = String(cruiseListings[4].price)
            
            cruiseDuration_1.text = String(cruiseListings[2].duration)
            cruiseDuration_2.text = String(cruiseListings[3].duration)
            cruiseDuration_3.text = String(cruiseListings[0].duration)
            cruiseDuration_4.text = String(cruiseListings[1].duration)
            cruiseDuration_5.text = String(cruiseListings[4].duration)
            break
            
            //sort by duration asc
        case 2:
            cruiseName_1.text = cruiseListings[2].cruiseName
            cruiseName_2.text = cruiseListings[0].cruiseName
            cruiseName_3.text = cruiseListings[3].cruiseName
            cruiseName_4.text = cruiseListings[1].cruiseName
            cruiseName_5.text = cruiseListings[4].cruiseName
            
            image_Cruise_1.image = UIImage(named: cruiseListings[2].imageLinkShip)
            image_Cruise_2.image = UIImage(named: cruiseListings[0].imageLinkShip)
            image_Cruise_3.image = UIImage(named: cruiseListings[3].imageLinkShip)
            image_Cruise_4.image = UIImage(named: cruiseListings[1].imageLinkShip)
            image_Cruise_5.image = UIImage(named: cruiseListings[4].imageLinkShip)
            
            cruisePrice_1.text = String(cruiseListings[2].price)
            cruisePrice_2.text = String(cruiseListings[0].price)
            cruisePrice_3.text = String(cruiseListings[3].price)
            cruisePrice_4.text = String(cruiseListings[1].price)
            cruisePrice_5.text = String(cruiseListings[4].price)
            
            cruiseDuration_1.text = String(cruiseListings[2].duration)
            cruiseDuration_2.text = String(cruiseListings[0].duration)
            cruiseDuration_3.text = String(cruiseListings[3].duration)
            cruiseDuration_4.text = String(cruiseListings[1].duration)
            cruiseDuration_5.text = String(cruiseListings[4].duration)
            break
        
            //sort by start date asc
        case 3:
            cruiseName_1.text = cruiseListings[2].cruiseName
            cruiseName_2.text = cruiseListings[0].cruiseName
            cruiseName_3.text = cruiseListings[3].cruiseName
            cruiseName_4.text = cruiseListings[4].cruiseName
            cruiseName_5.text = cruiseListings[1].cruiseName
            
            image_Cruise_1.image = UIImage(named: cruiseListings[2].imageLinkShip)
            image_Cruise_2.image = UIImage(named: cruiseListings[0].imageLinkShip)
            image_Cruise_3.image = UIImage(named: cruiseListings[3].imageLinkShip)
            image_Cruise_4.image = UIImage(named: cruiseListings[4].imageLinkShip)
            image_Cruise_5.image = UIImage(named: cruiseListings[1].imageLinkShip)
            
            cruisePrice_1.text = String(cruiseListings[2].price)
            cruisePrice_2.text = String(cruiseListings[0].price)
            cruisePrice_3.text = String(cruiseListings[3].price)
            cruisePrice_4.text = String(cruiseListings[4].price)
            cruisePrice_5.text = String(cruiseListings[1].price)
            
            cruiseDuration_1.text = String(cruiseListings[2].duration)
            cruiseDuration_2.text = String(cruiseListings[0].duration)
            cruiseDuration_3.text = String(cruiseListings[3].duration)
            cruiseDuration_4.text = String(cruiseListings[4].duration)
            cruiseDuration_5.text = String(cruiseListings[1].duration)
            break
        
            //default is to sort by name as a failsafe if something goes wrong
        default:
            cruiseName_1.text = cruiseListings[0].cruiseName
            cruiseName_2.text = cruiseListings[1].cruiseName
            cruiseName_3.text = cruiseListings[2].cruiseName
            cruiseName_4.text = cruiseListings[3].cruiseName
            cruiseName_5.text = cruiseListings[4].cruiseName
            
            image_Cruise_1.image = UIImage(named: cruiseListings[0].imageLinkShip)
            image_Cruise_2.image = UIImage(named: cruiseListings[1].imageLinkShip)
            image_Cruise_3.image = UIImage(named: cruiseListings[2].imageLinkShip)
            image_Cruise_4.image = UIImage(named: cruiseListings[3].imageLinkShip)
            image_Cruise_5.image = UIImage(named: cruiseListings[4].imageLinkShip)
            
            cruisePrice_1.text = String(cruiseListings[0].price)
            cruisePrice_2.text = String(cruiseListings[1].price)
            cruisePrice_3.text = String(cruiseListings[2].price)
            cruisePrice_4.text = String(cruiseListings[3].price)
            cruisePrice_5.text = String(cruiseListings[4].price)
            
            cruiseDuration_1.text = String(cruiseListings[0].duration)
            cruiseDuration_2.text = String(cruiseListings[1].duration)
            cruiseDuration_3.text = String(cruiseListings[2].duration)
            cruiseDuration_4.text = String(cruiseListings[3].duration)
            cruiseDuration_5.text = String(cruiseListings[4].duration)
            break
        }
    }
    
    //This function is used to go back to the Home Screen
    //when the Home UIButton is clicked,
    /*
    @IBAction func onHomeButtonClicked(_ sender: UIButton) {
        //set control to go back to previous screen as per:
        let previousScreen = storyboard?.instantiateViewController(identifier: "cruise_home")
        as! HomePage_ViewController //
        
        
        //change the view and present the previousScreen object
        previousScreen.view.frame = view.frame
        present(previousScreen, animated: true)
    }*/
    
    //This function will be used to send the user to the cruise detail page and populate that
    //page with the corresponding information that particular cruise has per per the list of cruise
    //objects we have been using so far.
    @IBAction func onCruiseChosen(_ sender: UIButton){
        //create a variable that will hold the selected cruise object
        var selectedCruise: Cruise
        
        //This switch case is important as it will be used to check which cruise is now sorted into
        //that position by sending the selectbutton reference to another function to check what
        //cruise it currently is associated to, since all five buttons will call this function
        //(onCruiseChosen) once they are pressed:
        switch sender {
        case selectButton_Cruise_1:
            selectedCruise = checkCruise(labelIdentifyerToCheck: cruiseName_1.text!)
            break
        case selectButton_Cruise_2:
            selectedCruise = checkCruise(labelIdentifyerToCheck: cruiseName_2.text!)
            break
        case selectButton_Cruise_3:
            selectedCruise = checkCruise(labelIdentifyerToCheck: cruiseName_3.text!)
            break
        case selectButton_Cruise_4:
            selectedCruise = checkCruise(labelIdentifyerToCheck: cruiseName_4.text!)
            break
        case bookNow_Cruise_5:
            selectedCruise = checkCruise(labelIdentifyerToCheck: cruiseName_5.text!)
            break
        
            
            //deafult to first cruise in case of issue with other case statements
        default: selectedCruise = cruiseListings[0]
        }
        
        //set a new control varaible that will be used to navigate the user to the next screen,
        //which is the cruise detail page
        /*
        let screenChange = storyboard?.instantiateViewController(identifier: "cruise_detail")
        as! CruiseDetail_ViewController //
        
        //send the relevent cruise information to the next page by setting the variables of
        //the next screen/view using the control screenChange as per:
        screenChange.cruiseImage = selectedCruise.imageLinkMain
        screenChange.cruiseName = selectedCruise.cruiseName
        screenChange.visitingPlaces = selectedCruise.visitingPlaces
        screenChange.duration = selectedCruise.duration
        screenChange.cruisePrice = selectedCruise.price
        screenChange.cruiseStartDate = selectedCruise.startDate
        screenChange.cruiseEndDate = selectedCruise.endDate
        
        //set the relevant images to the next page
        //set up three images as per requirements, which is why is diverts
        //from proposed mockup in milestone 1.
        screenChange.var_MainImage = selectedCruise.imageLinkMain
        screenChange.var_sideImage_1 = selectedCruise.imageLinkSide
        screenChange.var_sideImage_2 = selectedCruise.imageLinkShip
        //change the view and present the screenlChange object
        screenChange.view.frame = view.frame
        present(screenChange, animated: true)*/
        
        performSegue(withIdentifier: "to_details", sender: selectedCruise)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to_details"{
            if let cruiseDetailScreenChange = segue.destination as? CruiseDetail_ViewController {//segue.destination as?
                
                if let selectedCruise = sender as? Cruise{
                    cruiseDetailScreenChange.cruiseImage = selectedCruise.imageLinkMain
                    cruiseDetailScreenChange.cruiseName = selectedCruise.cruiseName
                    cruiseDetailScreenChange.visitingPlaces = selectedCruise.visitingPlaces
                    cruiseDetailScreenChange.duration = selectedCruise.duration
                    cruiseDetailScreenChange.cruisePrice = selectedCruise.price
                    cruiseDetailScreenChange.cruiseStartDate = selectedCruise.startDate
                    cruiseDetailScreenChange.cruiseEndDate = selectedCruise.endDate
                    
                    //set the relevant images to the next page
                    //set up three images as per requirements, which is why is diverts
                    //from proposed mockup in milestone 1.
                    cruiseDetailScreenChange.var_MainImage = selectedCruise.imageLinkMain
                    cruiseDetailScreenChange.var_sideImage_1 = selectedCruise.imageLinkSide
                    cruiseDetailScreenChange.var_sideImage_2 = selectedCruise.imageLinkShip
                }
            }
        }
    }

}
