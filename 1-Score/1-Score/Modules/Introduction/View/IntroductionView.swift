//
//  IntroductionView.swift
//  1-Score
//
//  Created by TIMA on 6/10/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import CoreData

class IntroductionView: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let pageControl = UIPageControl()
    let leftButton = UIButton()
    let rightButton = UIButton()
    
    var introPresenter : IntroductionPresenterProtocol?
    
    lazy var subViewControllers:[UIViewController] = {
        return [
            Intro1View(),
            Intro2View()
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        view.backgroundColor = UIColor.white
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        
        initView()
    }
    
    func initView() {
        // pageControl
        self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.numberOfPages = subViewControllers.count
        self.pageControl.currentPage = 0
        self.view.addSubview(self.pageControl)
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -15).isActive = true
        self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        self.pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.leftButton.setImage(UIImage(named: "arrow_left_disable.png"), for: .normal)
        self.view.addSubview(self.leftButton)
        
        self.leftButton.translatesAutoresizingMaskIntoConstraints = false
        self.leftButton.centerYAnchor.constraint(equalTo: self.pageControl.centerYAnchor).isActive = true
        self.leftButton.rightAnchor.constraint(equalTo: self.pageControl.centerXAnchor, constant: -80).isActive = true
        self.leftButton.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        self.leftButton.isEnabled = false
        
        self.rightButton.setImage(UIImage(named: "arrow_right.png"), for: .normal)
        self.view.addSubview(self.rightButton)
        
        self.rightButton.translatesAutoresizingMaskIntoConstraints = false
        self.rightButton.centerYAnchor.constraint(equalTo: self.pageControl.centerYAnchor).isActive = true
        self.rightButton.leftAnchor.constraint(equalTo: self.pageControl.centerXAnchor, constant: 80).isActive = true
        self.rightButton.addTarget(self, action: #selector(actionNext), for: .touchUpInside)
    }
    
    @objc func actionNext(sender: UIButton!) {
        introPresenter?.nextPagePresenter(currentPage: self.pageControl.currentPage, countPage: subViewControllers.count)
//        if self.pageControl.currentPage < subViewControllers.count - 1 {
//            setViewControllers([subViewControllers[self.pageControl.currentPage + 1]], direction: .forward, animated: true, completion: nil)
//            self.pageControl.currentPage = self.pageControl.currentPage + 1
//            
//            self.leftButton.setImage(UIImage(named: "arrow_left.png"), for: .normal)
//            self.leftButton.isEnabled = true
//        } else {
//            let nextViewController = MainView()
//            self.present(nextViewController, animated:true, completion:nil)
//            //update data
////            self.updateConfig()
//        }
    }
    
    @objc func actionBack(sender: UIButton!) {
        introPresenter?.backPagePresenter(currentPage: self.pageControl.currentPage)
        //        if self.pageControl.currentPage > 0 {
        //            setViewControllers([subViewControllers[self.pageControl.currentPage - 1]], direction: .reverse, animated: true, completion: nil)
        //            self.pageControl.currentPage = self.pageControl.currentPage - 1
        //        }
        //        if self.pageControl.currentPage == 0 {
//                    self.leftButton.setImage(UIImage(named: "arrow_left_disable.png"), for: .normal)
//                    self.leftButton.isEnabled = false
        //        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        if currentIndex <= 0 {
            return nil
        }
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        if currentIndex >= subViewControllers.count - 1 {
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = subViewControllers.index(of: viewControllers[0]) {
                if viewControllerIndex > 0 {
                    self.leftButton.setImage(UIImage(named: "arrow_left.png"), for: .normal)
                    self.leftButton.isEnabled = true
                } else {
                    self.leftButton.setImage(UIImage(named: "arrow_left_disable.png"), for: .normal)
                    self.leftButton.isEnabled = false
                }
                self.pageControl.currentPage = viewControllerIndex
            }
        }
    }
    
}

extension IntroductionView : IntroductionViewProtocol {
    
    func setPage(changePage: Int) {
        setViewControllers([subViewControllers[changePage]], direction: .forward, animated: true, completion: nil)
        self.pageControl.currentPage = changePage
    }
    
    func disableButton() {
        self.leftButton.setImage(UIImage(named: "arrow_left_disable.png"), for: .normal)
        self.leftButton.isEnabled = false
    }
    
    func enableButton() {
        self.leftButton.setImage(UIImage(named: "arrow_left.png"), for: .normal)
        self.leftButton.isEnabled = true
    }
    
    func finishView() {
        
    }
    
}
