//
//  ImgViewController.swift
//  NavControler
//
//  Created by Grantrae Rhoades on 2019-05-30.
//  Copyright © 2019 Grantrae Rhoades. All rights reserved.
//

import UIKit

class ImgViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var imgplaceholder: UIImageView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var img: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    struct resetImg {
        static var ogImg = UIImage.init()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        resetImg.ogImg = imgplaceholder.image!

        // Do any additional setup after loading the view.
    }
    
    

  /*  @IBAction func changeImg(_ sender: Any) {
    
     imgplaceholder.image = UIImage(named: "brain")
        
    } */
    
    
    @IBAction func imgNior(_ sender: Any)
    {
    
        let inputImg = imgplaceholder.image!
        
        let rawImg = CIImage(image: inputImg)        //Change to CI
        
        let sepiaParams: [String : Any] = [kCIInputImageKey : rawImg! ] // Modifying image
        
        let sepiaFilter = CIFilter(name: "CIPhotoEffectNoir", parameters: sepiaParams) //Adding parameters
        
        let context = CIContext(options: nil)
        if let output = sepiaFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent)
            {
                
                imgplaceholder.image = UIImage(cgImage: ciImg)
            }
            
        }
    
    }
    
    
    @IBAction func imgTonal(_ sender: Any)
    {
    
        let inputImg = imgplaceholder.image!
        
        let rawImg = CIImage(image: inputImg)        //Change to CI
        
        let tonalParams: [String : Any] = [kCIInputImageKey : rawImg! ] // Modifying image
        
        let tonalFilter = CIFilter(name: "CIPhotoEffectTonal", parameters: tonalParams) //Adding parameters
        
        let context = CIContext(options: nil)
        if let output = tonalFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                imgplaceholder.image = UIImage(cgImage: ciImg)
            }
            
        }
        
    }
    
    
    
    @IBAction func imgTransfer(_ sender: Any)
    {
    
        let inputImg = imgplaceholder.image!
    
        let rawImg = CIImage(image: inputImg)        //Change to CI
        
        let transferParams: [String : Any] = [kCIInputImageKey : rawImg! ] // Modifying image
        
        let transferFilter = CIFilter(name: "CIPhotoEffectTransfer", parameters: transferParams) //Adding parameters
        
        let context = CIContext(options: nil)
        if let output = transferFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                imgplaceholder.image = UIImage(cgImage: ciImg)
            }
            
        }
        
    }
    
  
    @IBAction func btnReturn(_ sender: Any)
    {
        
        imgplaceholder.image = resetImg.ogImg
    }
    

    
    @IBAction func niorSlider(_ sender: Any) {
       
        let inputImg = imgplaceholder.image!
        
        let rawImg = CIImage(image: inputImg)        //Change to CI
        
        let sepiaParams: [String : Any] = [kCIInputImageKey : rawImg! ] // Modifying image
        
        let sepiaFilter = CIFilter(name: "CIPhotoEffectNoir", parameters: sepiaParams) //Adding parameters
        
        let context = CIContext(options: nil)
        if let output = sepiaFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent)
            {
                
                imgplaceholder.image = UIImage(cgImage: ciImg)
            }
            
        }
    }
    
    
    @IBAction func tonalSlider(_ sender: Any) {
      
        let inputImg = imgplaceholder.image!
        
        let rawImg = CIImage(image: inputImg)        //Change to CI
        
        let tonalParams: [String : Any] = [kCIInputImageKey : rawImg! ] // Modifying image
        
        let tonalFilter = CIFilter(name: "CIPhotoEffectTonal", parameters: tonalParams) //Adding parameters
        
        let context = CIContext(options: nil)
        if let output = tonalFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                imgplaceholder.image = UIImage(cgImage: ciImg)
            }
            
        }
    }
    
    
    @IBAction func transSlider(_ sender: Any) {
      
        let inputImg = imgplaceholder.image!
        let rawImg = CIImage(image: inputImg)        //Change to CI
        let transferParams: [String : Any] = [kCIInputImageKey : rawImg! ] // Modifying image
        let transferFilter = CIFilter(name: "CIPhotoEffectTransfer", parameters: transferParams)
        //Adding parameters
        
        let context = CIContext(options: nil)
        if let output = transferFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                imgplaceholder.image = UIImage(cgImage: ciImg)
            }
            
        }
    }
    
    

    @IBAction func addBtn(_ sender: Any) {
    imagePicker.sourceType = .photoLibrary
       imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) != nil {
            imgplaceholder.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    

    
}



/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


