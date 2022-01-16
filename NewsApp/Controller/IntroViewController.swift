//
//  IntroViewController.swift
//  NewsApp
//
//

import UIKit
import Lottie

class IntroViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    var onboardArray = ["4","2","3","5","6"]
    var onboardStringArray = ["ニュースアプリ","通勤中のちょっとした時間でも","日々の生活に役立つライフハック","天気予報","最新のニュースをチェック！"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isPagingEnabled = true
        setUpScroll()
        for i in 0...4{
            let animationView = AnimationView()
            let animation = Animation.named(onboardArray[i])
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUpScroll(){
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.width * 5, height: view.frame.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let leading = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        let trailing = scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        let top = scrollView.topAnchor.constraint(equalTo:  view.topAnchor, constant: 0)
        let bottom = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        //制約を有効化
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
        for i in 0...4 {
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width * 0.995, y: view.frame.size.height * 0.25, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textAlignment = .center
            onboardLabel.text = onboardStringArray[i]
            scrollView.addSubview(onboardLabel)
        }
    }
}
