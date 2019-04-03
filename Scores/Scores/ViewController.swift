//
//  ViewController.swift
//  Scores
//
//  Created by Nicholas Yee on 2/27/19.
//  Copyright © 2019 Nicholas Yee. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var students : [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataFill()
    }
    
    func dataFill() {
        students.append(Student(name: "Nicholas Yee", age: 17, year: "Junior", grade: 11, school: "Riordan"))
        students.append(Student(name: "Fernando Cuellar", age: 16, year: "Junior", grade: 11, school: "Riordan"))
        students.append(Student(name: "Felipe Jun Iglesia", age: 14, year: "Freshman", grade: 09, school: "Riordan"))
        students.append(Student(name: "Matthew Mandoza", age: 14, year: "Freshman", grade: 09, school: "Riordan"))
        students.append(Student(name: "Kirby", age: 69, year: "Junior", grade: 11, school: "LOL HS"))
//        students[0].setGrade(newGrade:95)
//        students[1].setGrade(newGrade:95)
//        students[2].setGrade(newGrade:95)
//        students[3].setGrade(newGrade:95)
        
        for i in 0..<students.count{
            students[i].setGrade(newGrade: 95 - i)
        }
        
        //foreach
        for student in students {
            print(student.name + ": " + String(student.grade))
        }
        
    }
    
}

