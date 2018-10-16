//
//  CanvasViewController.swift
//  Canvas
//
//  Created by student on 10/16/18.
//  Copyright © 2018 hu. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet var trayView: UIView!
    var trayOriginalCenter: CGPoint!
    @IBAction func didPanTray(_ sender: Any) {
        let translation = (sender as AnyObject).translation(in: view)
        
        var velocity = (sender as AnyObject).velocity(in: view)
        let trayDownOffset: CGFloat!
        var trayUp: CGPoint!
        var trayDown: CGPoint!
        
        trayDownOffset = 160
        trayUp = trayView.center // The initial position of the tray
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset) // The position of the tray transposed down
        
        if (sender as AnyObject).state == .began {
            trayOriginalCenter = trayView.center
        } else if (sender as AnyObject).state == .changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if (sender as AnyObject).state == .ended {
            if velocity.y > 0 {
                trayView.center = trayDown
            } else {
                trayView.center = trayUp
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
