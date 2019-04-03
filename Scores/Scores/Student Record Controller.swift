//
//  Student Record Controller.swift
//  Scores
//
//  Created by Nicholas Yee on 3/4/19.
//  Copyright © 2019 Nicholas Yee. All rights reserved.
//

import UIKit

class Student_Record_Controller: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        if let loadedStudents = loadStudents() {
            students = loadedStudents
        } else {
            dataFill()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
    
   
        
 var students : [Student] = []
    
    func dataFill() {
        students.append(Student(name: "Nicholas Yee", age: 17, year: "Junior", grade: 99, school: "Riordan"))
        students.append(Student(name: "Fernando Cuellar", age: 16, year: "Junior", grade: 89, school: "Riordan"))
        students.append(Student(name: "Felipe Jun Iglesia", age: 14, year: "Freshman", grade: 69, school: "Riordan"))
        students.append(Student(name: "Matthew Mandoza", age: 14, year: "Freshman", grade: 100, school: "Riordan"))
        students.append(Student(name: "Kirby", age: 69, year: "Junior", grade: 69, school: "LOL HS"))
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student Cell", for: indexPath)

        // Configure the cell...

        

        
        let myCell = cell as! Student_Record
        
        //grade
        myCell.gradeLabel.text = String(students[indexPath.row].grade)
        if (students[indexPath.row].grade) >= 90 {
            myCell.gradeLabel.text = "A"
            myCell.gradeLabel.textColor = .green
            print("you pass")
        }
        else if (students[indexPath.row].grade) >= 80 {
            myCell.gradeLabel.textColor = .orange
            myCell.gradeLabel.text = "B"
            print("meh")
        }
        else if (students[indexPath.row].grade) >= 70 {
            myCell.gradeLabel.text = "C"
            myCell.gradeLabel.textColor = .yellow
            print("unacceptable")
        }
        else if (students[indexPath.row].grade) >= 60 {
            myCell.gradeLabel.text = "D"
            myCell.gradeLabel.textColor = .red
            print("d for...")
        }
        else if (students[indexPath.row].grade) <= 50 {
            myCell.gradeLabel.text = "F"
            myCell.gradeLabel.textColor = .red
            //myCell.gradeLabel.font
            //myCell.gradeLabel.text
            print("failure")
        }
        
        
        //age
        myCell.ageLabel.text = String(students[indexPath.row].age)
        if (students[indexPath.row].age) >= 1{
            myCell.ageLabel.textColor = .green
            print("your young")
        }
        
        myCell.ageLabel.text = String(students[indexPath.row].age)
        if (students[indexPath.row].age) >= 19{
            myCell.ageLabel.textColor = .blue
            print("your in college")
        }
        
        myCell.ageLabel.text = String(students[indexPath.row].age)
        if (students[indexPath.row].age) >= 28 {
            myCell.ageLabel.textColor = .orange
            print("mom wants you to have a baby")
        }
        myCell.ageLabel.text = String(students[indexPath.row].age)
        if (students[indexPath.row].age) >= 50{
            myCell.ageLabel.textColor = .red
            print("your hella old")
        } else {
            
        }
        
        
        

            
        myCell.nameLabel.text = students[indexPath.row].name
        myCell.yearLabel.text = students[indexPath.row].year
        
        myCell.schoolLabel.text = students[indexPath.row].school
        //myCell.ageLabel.text = students[indexPath.row].age
        
        
        

        return cell
    }
    
    @IBAction func name(_ sender: UITextField) {
        self.textInputMode
    }
    
    @IBAction func grade(_ sender: UITextField) {
        self.textInputMode
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let studentController = segue.destination as? ChangeGrade {
            if let selectedStudent = sender as? Student_Record {
                if let studentIndex = tableView.indexPath(for: selectedStudent) {
                    studentController.selectedStudent = students[studentIndex.row]
                }
            }
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
   
    
    
    func saveStudents() {
        NSKeyedArchiver.archiveRootObject(students, toFile: Student.archiveURL.path)
    }
    
    func loadStudents() -> [Student]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Student.archiveURL.path) as! [Student]
    }
    
    
    
    
    
    
    @IBAction func returnToList(slender: UIStoryboardSegue) {
        if let editController = slender.source as? ChangeGrade, let student = editController.selectedStudent {
            if let selectedIndex = tableView.indexPathForSelectedRow {
                students[selectedIndex.row] = student
                tableView.reloadRows(at: [selectedIndex], with: .none)
                saveStudents()
            } else {
                print("LMAO")
                
                students.append(student)
                tableView.insertRows(at: [IndexPath(row: students.count-1, section: 0)], with:.fade)
                saveStudents()
            }
        }
    }
    
    
    

    
//     Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//         Return false if you do not want the specified item to be editable.
        return true
    }



//     Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            students.remove(at: indexPath.row)
            saveStudents()
//             Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
//             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
 
    @IBAction func report(_ sender: Any) {
        let alertController = UIAlertController(title: "LISTEN FRESHMAN", message: "YOU ARE A FAILURE", preferredStyle: .alert)
        let action = UIAlertAction(title: "Lit", style: .destructive, handler: nil)
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
