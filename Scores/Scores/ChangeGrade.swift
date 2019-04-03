//
//  ChangeGrade.swift
//  Scores
//
//  Created by Nicholas Yee on 3/12/19.
//  Copyright © 2019 Nicholas Yee. All rights reserved.
//

import UIKit

class ChangeGrade: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var gradeField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var schoolField: UITextField!
    @IBOutlet weak var saveButton2: UIButton!
    
    var selectedStudent : Student?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let students = selectedStudent {
            print(students.name)
            nameField.text = students.name
            ageField.text = String(students.age)
            gradeField.text = String(students.grade)
            yearField.text = String(students.year)
            schoolField.text = String(students.school)
        } else {
            print("halo")
            
        }
        
        

        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        print("ho ho ho")
        if let button = sender as? UIButton, button === saveButton2 {
            selectedStudent = Student(name: nameField.text!, age: Int(ageField.text!)!, year: yearField.text!, grade: Int(gradeField.text!)!, school: schoolField.text!)
            selectedStudent!.age = Int(ageField.text!)!
            selectedStudent!.grade = Int(gradeField.text!)!
            print("i like pie")
        }
    }
    
    
   

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  

}
