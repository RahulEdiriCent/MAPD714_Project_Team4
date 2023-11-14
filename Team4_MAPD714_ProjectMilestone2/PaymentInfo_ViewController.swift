//
//  PaymentInformation_ViewController.swift
//  Team4_MAPD714_ProjectMilestone2
//  Created and Submitted on 2023-11-13.
//  For MAPD 714 Milestone 3 Submission
//  For Team 4 -
//      Rahul Edirisinghe (301369991)
//      Salisha Giri      (301369710)


//Version 2.0 after new changes from Milestone 2 - Created new GitHub:

import UIKit
//this page will be used to accept user input regarding the payment method and details the user will use to confirm the booking being made.
class PaymentInfo_ViewController: UIViewController, UITextFieldDelegate {
    //set up and initialize vaiables that will be used to hold the information passsed on from previous page and information that will be passed along to next page, each has p_
    var p_duration:String = ""
    var p_cruiseName:String = ""
    var p_visitingPlaces:String = ""
    var p_totalPrice:Double = 0.0
    
    var p_numOfNights:Int = 0
    var p_cityCountry:String = ""
    var p_numOfGuests:Int = 0
    var p_customerName:String = ""
    var p_customerAddress:String = ""
    //set up the names for the references for the UI Lables and Input elements
    @IBOutlet weak var appleIdTextField: UITextField!
    
    //set up constraints, used later to hide and show elements depending on chosen payment method
    @IBOutlet weak var appleIdHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cardDetailsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var expiryDateTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var paymentTypeSegment: UISegmentedControl!
    
    @IBOutlet weak var button_purchase: UIButton!
    
    //@IBOutlet weak var test: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //handle input: TextField delegates initialization
        initializeSegmentControl()
        nameTextField.delegate = self
        cardNumberTextField.delegate = self
        expiryDateTextField.delegate = self
        appleIdTextField.delegate = self
    }
    //set up method to handle input of the textFields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func initializeSegmentControl() //set up segmented control values
    {
        paymentTypeSegment.setTitle("Credit Card", forSegmentAt: 0)
        paymentTypeSegment.setTitle("Debit Card", forSegmentAt: 1)
        paymentTypeSegment.setTitle("Apple Pay", forSegmentAt: 2)
        appleIdHeightConstraint.constant = 0
    }
    
    //handle hiding the correct view element depending on which payment method is selected:
    //using the segmented control, its current index
    @IBAction func paymentTypeSegmentAction(_ sender: Any) {
        
        if paymentTypeSegment.selectedSegmentIndex == 2
        {
            cardDetailsHeightConstraint.constant = 0
            appleIdHeightConstraint.constant = 45
        }
        else
        {
            cardDetailsHeightConstraint.constant = 200
            appleIdHeightConstraint.constant = 0
        }
    }
    /* - Removed Button Code -
    @IBAction func purchaseButtonClicked(_ sender: Any) {
        
        if paymentTypeSegment.selectedSegmentIndex != 2
        {
            guard let cardName = nameTextField.text, cardName.count != 0 else {
                showError(type: .noCardName)
                return
            }
            
            guard let cardNumber = cardNumberTextField.text, cardNumber.count != 0 else {
                showError(type: .noCardNumber)
                return
            }
            
            guard let expiry = expiryDateTextField.text, expiry.count != 0 else {
                showError(type: .noExpiry)
                return
            }
            
            //MARK: - Navigate to Confirmation page
        }
        else {
            
            guard let appleId = appleIdTextField.text, appleId.count != 0 else {
                showError(type: .noAppleId)
                return
            }
            
            //MARK: - Navigate to Confirmation page
            performSegue(withIdentifier: "to_confirm", sender: sender)
        }
    }*/
    
    @IBAction func onPConfirmationClicked(_ sender: Any) {
        //error handling, check whether user has entered values for the below fields, when the button to proceed has been clicked: - Corrected to check by which payment method is selected.
        if paymentTypeSegment.selectedSegmentIndex != 2
        {
            //check below fields for errors, preventing user from continuing if found/encountered
            guard let cardName = nameTextField.text, cardName.count != 0 else {
                showError(type: .noCardName)
                return
            }
            
            guard let cardNumber = cardNumberTextField.text, cardNumber.count != 0 else {
                showError(type: .noCardNumber)
                return
            }
            
            guard let expiry = expiryDateTextField.text, expiry.count != 0 else {
                showError(type: .noExpiry)
                return
            }
            
            //MARK: - Navigate to Confirmation page
            performSegue(withIdentifier: "to_confirm", sender: sender)
        }
        else {
            
            guard let appleId = appleIdTextField.text, appleId.count != 0 else {
                showError(type: .noAppleId)
                return
            }
            
            //MARK: - Navigate to Confirmation page
            performSegue(withIdentifier: "to_confirm", sender: sender)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to_confirm"{
            if let confirmationScreenChange = segue.destination as? Confirmation_ViewController {//segue.destination as?
                    confirmationScreenChange.c_cruiseName = p_cruiseName
                    confirmationScreenChange.c_visitingPlaces = p_visitingPlaces
                    confirmationScreenChange.c_numOfNights = p_numOfNights
                confirmationScreenChange.c_cruiseDuration = p_duration
                
                    confirmationScreenChange.c_numOfGuests = p_numOfGuests
                    confirmationScreenChange.c_totalPrice = p_totalPrice
                    confirmationScreenChange.c_cityCountry = p_cityCountry
                    confirmationScreenChange.c_customerName = p_customerName
                    confirmationScreenChange.c_customerAddress = p_customerAddress
            }
        }
    }
    //set up some error handling - the handling of the error pop up that will be shown to user
    func showError(type: PayError)
    {
        var errorMessage: String = ""
        
        switch type {
            
        case .noCardName:
            errorMessage = "Please enter card name to proceed."
        case .noCardNumber:
            errorMessage = "Please enter card number to proceed."
        case .noExpiry:
            errorMessage = "Please enter card expiry date to proceed."
        case .noAppleId:
            errorMessage = "Please enter Apple Id to proceed."
        }
        //show error message in the form of an alert popup message, customized as shown below
        let alert = UIAlertController(title: "ALERT", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    //set up e-num that houses the different error types.
    enum PayError {
        case noCardName
        case noCardNumber
        case noExpiry
        case noAppleId
    }

}
