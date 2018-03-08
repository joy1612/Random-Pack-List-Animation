//
//  ViewController.swift
//  Random Pack List Animation
//
//  Created by Jay Zalawadia on 3/2/18.
//  Copyright © 2018 Jay Zalawadia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var plusBUtton: UIButton!
    
    let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]
    
    var items: [Int] = [5,6,7]
    
    @IBOutlet weak var itemlistTableView: UITableView!
    
    let tableHeaderLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 20.0))

    override func viewDidLoad() {
        super.viewDidLoad()

        tableHeaderLabel.text = "\(items.count) items to pack"
        tableHeaderLabel.textAlignment = .center
        
    }
    
    @IBAction func plusActionButton(_ sender: Any) {
        //plusBUtton.isEnabled = false
        UIView.animate(withDuration: 1.0, delay: 0.0, options : [] , animations: {
            self.plusBUtton.transform = self.plusBUtton.transform.rotated(by: CGFloat(Double.pi / 2))
            self.plusBUtton.layer.cornerRadius = 62.5
            self.plusBUtton.layer.borderWidth = 2.0
            self.plusBUtton.layer.borderColor = UIColor.gray.cgColor
            }, completion: { _ in
                
                //You can add multiple animation options like
                // UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseOut, .repeat]
                
                UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseOut] , animations: {
                    self.plusBUtton.layer.cornerRadius = 0.0
                    self.plusBUtton.layer.borderWidth = 0.0
                }, completion: nil )
                self.addRandomItem()
        })     
    }
    
    /*for demo
 
     UIView.animate(withDuration: 1, animations: {
     view.frame.origin.x += 200
     }, completion: { _ in
     UIView.animate(withDuration: 1, animations: {
     view.backgroundColor = .green
     }, completion: { _ in
     UIView.animate(withDuration: 1, animations: {
     view.frame.origin.y += 200
     }, completion: { _ in
     UIView.animate(withDuration: 1, animations: {
     view.transform = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
     }, completion: { _ in
     UIView.animate(withDuration: 1, animations: {
     view.alpha = 0
     }, completion: { _ in
     print("I'm done!")
     })
     })
     })
     })
     })
     
     */
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRandomItem(){
        tableHeaderLabel.text = "\(items.count + 1) items to pack"
        items.insert(Int(arc4random_uniform(UInt32(itemTitles.count))), at: 0)
        itemlistTableView.insertRows(at: [NSIndexPath(row : 0, section : 0) as IndexPath], with: UITableViewRowAnimation.automatic)
        
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.accessoryType = .none
        cell.textLabel?.text = itemTitles[items[indexPath.row]]
        print(itemTitles[items[indexPath.row]])
        cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableHeaderLabel
    }
    
}

