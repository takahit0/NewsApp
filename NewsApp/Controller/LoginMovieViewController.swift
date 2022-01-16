//
//  LoginMovieViewController.swift
//  NewsApp
//
//

import UIKit
import AVFoundation

class LoginMovieViewController: UIViewController {
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "supernews", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        playerLayer.videoGravity = .resizeAspect
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            self.player.seek(to: .zero)
            self.player.play()
        }
        self.player.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func login(_ sender: Any) {
        player.pause()
    }
}

