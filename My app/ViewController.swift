//
//  ViewController.swift
//  My app
//
//  Created by Erika Aviles on 9/17/16.
//  Copyright © 2016 Bass drop. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
//the connector to the collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images:[UIImage] = []
    var imagesDirectoryPath:String!
    
    
    @IBAction func choosePhoto(sender: AnyObject) {
        
        //present the imagePicker
        let imagePicker = UIImagePickerController()
        //presnts to the screen in order to pick an image
        presentViewController(imagePicker, animated: true, completion: nil)
        //the IP(imagePicker) is set default to photo library
        imagePicker.delegate = self
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        //start creating the folder in directory to save the images
        images = []
        
        //create a new path fo the new folder under the document directory
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        //get the document directory 
        let documentDirectorPath: String = paths[0]
        
        //create a new path for the new images folder
        imagesDirectoryPath = documentDirectorPath.stringByAppendingString("/ImagePicker")
        var objcBool:ObjCBool = true
         let isExist = NSFileManager.defaultManager().fileExistsAtPath(imagesDirectoryPath, isDirectory: &objcBool)
  // if the folder does not exist than create it 
        
        if isExist == false {
            do{
                let isExist = NSFileManager.defaultManager().fileExistsAtPath(imagesDirectoryPath, isDirectory: &objcBool)
            }catch{
                print("OH NO! Something went wrong while creating a new folder")
            }
        }
        
        
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }//lines 64-77 is for the ViewController to accept UICollectionView
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
        //number of cells
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        as! CollectionViewCell
        
        cell.imageView?.image = self.images[indexPath.row]
        return cell
    }
    
    
    
    
    

}


































