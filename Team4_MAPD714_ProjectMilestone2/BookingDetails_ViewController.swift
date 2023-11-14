//
//  BookingDetails_ViewController.swift
//  Team4_MAPD714_ProjectMilestone2
//  Created and Submitted on 2023-11-13.
//  For MAPD 714 Milestone 3 Submission
//  For Team 4 -
//      Rahul Edirisinghe (301369991)
//      Salisha Giri      (301369710)


//Version 2.0 after new changes from Milestone 2 - Created new GitHub:

import UIKit
//This controller/page will be used to accept use input in regards to the booking information
//for the chosen booking
class BookingDetails_ViewController: UIViewController, UITextFieldDelegate {
    //set up and initialize vaiables that will be used to hold the information passsed on from previous page and information that will be passed along to next page, each has b_
    var b_duration:String = ""
    var b_numOfNights:Int = 0
    var b_seniorsOnBoard: DarwinBoolean = false
    var b_cruiseName:String = ""
    var b_visitingPlaces:String = ""
    var b_cruisePrice:Double = 0.0
    
    var b_numOfChildren:Int = 0
    var b_numOfGuests:Int = 0
    var b_calculatedPrice:Double = 0.0
    
    
//set up the names for the references for the UI Lables and Input elements
    @IBOutlet weak var seniorLabel: UILabel!
    @IBOutlet weak var kidCountLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var seniorSwitch: UISwitch!
    @IBOutlet weak var adultCountLabel: UILabel!
    
    @IBOutlet weak var button_proceedToPayment: UIButton!
    
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //handle input: TextField delegates
        nameTextField.delegate = self
        addressTextField.delegate = self
        cityTextField.delegate = self
        countryTextField.delegate = self
    }
    
    //set up method to handle input of the textFields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //Handle the input buttons for the Number of adults and children that will be on the
    //cruise----------------------
    @IBAction func plusAdultButtonAction(_ sender: Any) {
        
        guard var adults = Int(adultCountLabel.text ?? "0") else {
            return
        }
        
        if adults == 10 //more than 10 adults not allowed
        {
            return
        }
        
        adults = adults + 1
        adultCountLabel.text = "\(adults)"
    }
    
    @IBAction func minusAdultButtonAction(_ sender: Any) {
        
        guard var adults = Int(adultCountLabel.text ?? "0") else {
            return
        }
        
        if adults == 0
        {
            return
        }
        
        adults = adults - 1
        adultCountLabel.text = "\(adults)"
    }
    
    @IBAction func plusKidButtonAction(_ sender: Any) {
        
        guard var kids = Int(kidCountLabel.text ?? "0") else {
            return
        }
        
        if kids == 10 //more than 10 kids not allowed
        {
            return
        }
        
        kids = kids + 1
        kidCountLabel.text = "\(kids)"
    }
    
    @IBAction func minusKidButtonAction(_ sender: Any) {
        
        guard var kids = Int(kidCountLabel.text ?? "0") else {
            return
        }
        
        if kids == 0
        {
            return
        }
        
        kids = kids - 1
        kidCountLabel.text = "\(kids)"
    }
    //------------------------
    
    //When the switch, used to indicate whether there are seniors OnBoard is toggled
    @IBAction func seniorSwitchAction(_ sender: Any) {
                
        seniorLabel.text = seniorSwitch.isOn ? "Yes" : "No" //set value
    }
    
    @IBAction func goToPaymentButtonAction(_ sender: Any) {
        
        //error handling, check whether user has entered values for the below fields, when the button to proceed has been clicked:
        guard let name = nameTextField.text, name.count != 0 else {
            showError(type: .noName)
            return //prevent user from continuing on if there is an error
        }
        //repeat for below fields as well:
        guard let address = addressTextField.text, address.count != 0 else {
            showError(type: .noAddress)
            return
        }
        
        guard let city = cityTextField.text, city.count != 0 else {
            showError(type: .noCity)
            return
        }
        
        guard let country = countryTextField.text, country.count != 0 else {
            showError(type: .noCountry)
            return
        }
        
        guard let adults = Int(adultCountLabel.text ?? "0"), adults != 0 else {
            showError(type: .noAdult)
            return
        }
        
        let kids: Int = Int(kidCountLabel.text ?? "0") ?? 0
        
        //do calculations for price and number of guests
        b_calculatedPrice = Double(kids)*(b_cruisePrice/2) + Double(adults)*b_cruisePrice
        
        b_numOfGuests = kids + adults
        //MARK: - Navigate to Payment Page via Segue
        
        performSegue(withIdentifier: "to_payment", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to_payment"{
            if let paymentInfoScreenChange = segue.destination as? PaymentInfo_ViewController {
                //set customer details to be passed
                    paymentInfoScreenChange.p_cruiseName = b_cruiseName
                    paymentInfoScreenChange.p_visitingPlaces = b_visitingPlaces
                    paymentInfoScreenChange.p_duration = b_duration
                    
                    paymentInfoScreenChange.p_numOfGuests = b_numOfGuests
                    paymentInfoScreenChange.p_totalPrice = b_calculatedPrice
                    paymentInfoScreenChange.p_cityCountry = cityTextField.text! + " - " + countryTextField.text!
                    paymentInfoScreenChange.p_customerName = addressTextField.text!
                    paymentInfoScreenChange.p_customerAddress = nameTextField.text!
                
                paymentInfoScreenChange.p_numOfNights = b_numOfNights
            }
        }
    }
    
    //set up some error handling - the handling of the error pop up that will be shown to user
    func showError(type: ErrorType)
    {
        var errorMessage: String = ""
        
        switch type {
            
        case .noName:
            errorMessage = "Please enter customer name to proceed."
        case .noAddress:
            errorMessage = "Please enter customer address to proceed."
        case .noCity:
            errorMessage = "Please enter customer city name to proceed."
        case .noCountry:
            errorMessage = "Please enter customer country name to proceed."
        case .noAdult:
            errorMessage = "Minimum customer count one required to proceed."
        }
        
        //show error message in the form of an alert popup message, customized as shown below
        let alert = UIAlertController(title: "ALERT", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //set up e-num that houses the different error types.
    enum ErrorType {
        
        case noName
        case noAddress
        case noCity
        case noCountry
        case noAdult
    }
}
