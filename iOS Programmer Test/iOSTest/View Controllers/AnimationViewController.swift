//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     **/
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    private var fadeIn: Bool = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
        
        mainButton.backgroundColor = .headerBackground
        mainButton.setTitleColor(.white, for: .normal)
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(gesture:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gesture)
    }
    
    // MARK: - Actions
    @objc func panGesture(gesture: UIPanGestureRecognizer) {
        let point = gesture.location(in: self.view)
        imageView.center = point
    }
    
    @IBAction func didPressFade(_ sender: Any) {
        fadeIn = !fadeIn
        animation(for: fadeIn)
        mainButton.setTitle( fadeIn ? "FADE OUT" : "FADE IN" , for: .normal)
    }
    
    private func animation(for fadeIn: Bool) {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut) {
            let alpha: CGFloat = fadeIn ? 1.0 : 0.0
            let scale: CGFloat = fadeIn ? 1.0 : 0.0
            
            self.imageView.alpha = alpha
            self.imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        } completion: { _ in
            self.view.layoutIfNeeded()
        }
    }
    
}
