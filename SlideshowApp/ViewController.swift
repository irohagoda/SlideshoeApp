//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 郷田彩巴 on 2017/12/01.
//  Copyright © 2017 iroha.goda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var onPrev: UIButton!
    
    @IBOutlet weak var onNext: UIButton!
    
    @IBOutlet weak var startStopbutton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var timer: Timer!
   
    @IBAction func onTapImage(_ sender: Any) {
         print("タップされました")
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
        if self.timer != nil{
        self.timer.invalidate()
        }
        
        
    }
  
    
    @IBAction func onNext(_ sender: Any) {
        // 1増やす
        dispImageNo += 1
        
        // 番号を元に画像を表示する
        displayImage()
    }
    
   
    @IBAction func onPrev(_ sender: Any) {
        // 1減らす
        dispImageNo -= 1
        
        // 番号を元に画像を表示する
        displayImage()
    }
   
    @IBAction func startTimer(_ sender: Any) {
        if self.timer == nil {
         self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            onNext.isEnabled = false
            onPrev.isEnabled = false
            startStopbutton.setTitle("■", for: .normal)
    }
        else if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            onNext.isEnabled = true
            onPrev.isEnabled = true
            startStopbutton.setTitle("▶︎", for: .normal)
        }
      
    }
    func updateTimer(timer: Timer) {
        
         dispImageNo += 1
         displayImage()
        
    }
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "h1.jpg","h2.jpg","h3.jpg",
            ]
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
       
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "h1.jpg")
        
       imageView.image = image
       
    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next:NextViewController = segue.destination as! NextViewController
         next.image = imageView.image
      

    
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
          self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
}

