//
//  FriendsTableViewController.swift
//  wether
//
//  Created by Catalina on 24/08/2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var arrayOfFriends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        appendFriends()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    private func appendFriends() {
        let friend1 = Friend(name: "Valery", imageName: "1", photosByFriend: [UIImage(named: "sea1.png"),
             UIImage(named: "sea2.png"),
             UIImage(named: "sea3.png"),
             UIImage(named: "sea4.png")])
        let friend2 = Friend(name: "Kate", imageName: "5", photosByFriend: [UIImage(named: "sea5.png")])
        let friend3 = Friend(name: "Mike", imageName: "7",  photosByFriend: [UIImage(named: "sea6.png")])
                                                                             
        arrayOfFriends.append(friend1)
        arrayOfFriends.append(friend2)
        arrayOfFriends.append(friend3)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfFriends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableViewCell
        let friend = arrayOfFriends[indexPath.row]
        cell.configure(for: friend)
        //cell.NameFriend.text = friend.name
        //cell.AvatarFriend.image = UIImage.init(named: friend.imageName)

        // Configure the cell...

        return cell
    }
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoFriendsController = segue.destination as? FriendPhotosCollectionViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let friend =  arrayOfFriends[indexPath.row]
                photoFriendsController.friend = friend
            }
            }
        }  //
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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


