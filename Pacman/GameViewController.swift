//
//  GameViewController.swift
//  Pacman
//
//  Created by JackyShen on 2017/8/13.
//  Copyright © 2017年 JackyShen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CDJoystick

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let joystick = CDJoystick()
        joystick.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        joystick.backgroundColor = .clear
        
        joystick.substrateColor = .lightGray
        joystick.substrateBorderColor = .gray
        joystick.substrateBorderWidth = 1.0
        joystick.stickSize = CGSize(width: 50, height: 50)
        joystick.stickColor = .darkGray
        joystick.stickBorderColor = .black
        joystick.stickBorderWidth = 2.0
        joystick.fade = 0.5
        
        joystick.trackingHandler = { joystickData in
            //            self.objectView.center.x += joystickData.velocity.x
            //            self.objectView.center.y += joystickData.velocity.y
            print(joystickData.velocity.x)
            print(joystickData.velocity.y)
        }

        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true

            view.addSubview(joystick)
        }
        
     }

    
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
