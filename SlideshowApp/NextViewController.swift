//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 郷田彩巴 on 2017/12/01.
//  Copyright © 2017 iroha.goda. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var nextImge: UIImageView!
var image: UIImage? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
self.nextImge.image = self.image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
