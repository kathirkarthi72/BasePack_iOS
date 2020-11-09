//
//  BaseViewController.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import UIKit
import Alamofire

/// BaseViewController
class BaseViewController: UIViewController {
    
    private var bannerView: UIView = {
        let bannerView = UIView()
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        return bannerView
    }()
    
    private var bgImageView: UIImageView = {
        let bgImageView = UIImageView(image: UIImage.init(named: "homeHeaderImg"))
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.clipsToBounds = true
        return bgImageView
    }()
    
    private var logoImageView: UIImageView = {
        let bgImageView = UIImageView(image: UIImage.init(named: "JLP_Logo"))
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.contentMode = .scaleAspectFit
        return bgImageView
    }()
    
    func addBGImageView() {
        self.view.addSubview(bannerView)
        self.bannerView.addSubview(bgImageView)
        self.bannerView.addSubview(logoImageView)
        
        bannerView.roundCorners(corners: [.bottomLeft], radius: 20)
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.topAnchor),
            bannerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalToSystemSpacingBelow: bannerView.centerYAnchor, multiplier: 1),
            logoImageView.heightAnchor.constraint(equalTo: bannerView.heightAnchor, multiplier: 0.5),
            logoImageView.widthAnchor.constraint(equalTo: bannerView.heightAnchor, multiplier: 0.5),
            logoImageView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -20)
        ])
        //        NSLayoutConstraint(item: logoImageView, attribute: .bottom, relatedBy: .equal, toItem: bannerView, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
        
        view.sendSubviewToBack(bannerView)
        bgImageView.fillSuperview()
    }
    
    var isTransparent: Bool = false {
        didSet{
            if isTransparent {
                navigationController?.navigationBar.backgroundColor = UIColor.clear
                navigationController?.view.backgroundColor = UIColor.clear
                navigationController?.navigationBar.barTintColor = ColorManager.darkBlueTheme.color
                navigationController?.navigationBar.tintColor = ColorManager.white.color
                navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationController?.navigationBar.shadowImage = UIImage()
                navigationController?.navigationBar.isTranslucent = true
                navigationItem.titleView = nil
                
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.customFont(.ExoSemiBold, size: 17.0)]
                //self.navigationController!.navigationBar.topItem!.title = "";
            } else {
                self.navigationController?.navigationBar.isTranslucent = !isTransparent
                self.navigationController?.navigationBar.barTintColor = ColorManager.white.color
                self.navigationController?.navigationBar.tintColor = ColorManager.darkBlueTheme.color
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                
                //self.navigationController!.navigationBar.topItem!.title = "";
            }
        }
    }
    
    var isHideNavigationBar: Bool = false {
        didSet{
            self.navigationController?.navigationBar.isHidden = isHideNavigationBar
        }
    }
    
    private let net = NetworkReachabilityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupViews()
    }
    
    func setupViews() {
        logoutBarButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutButtonTapped))
        
        // Add Logout button
        self.navigationItem.rightBarButtonItem = logoutBarButton
        self.view.backgroundColor = ColorManager.backgroundGrey.color
        
        doOnMain {
            self.addBGImageView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        networkStartListener()
        syncUnCommits()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        networkStopListener()
    }
    
    func isHideLogoutButton() {
        navigationItem.rightBarButtonItem = nil
    }
    
    var logoutBarButton: UIBarButtonItem!
    
    /// Logout button tapped
    @objc func logoutButtonTapped() {
        print("BaseViewController - Logout button tapped.")
        showLogoutConformationAlert()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    /// Hide Keyboard
    func hideKeyboard() {
        self.view.endEditing(true)
    }
}

extension BaseViewController {
    
    func showLogoutConformationAlert() {
        hideKeyboard()
        
        if NetworkManager.isConnected() {
            
            if hasUnCommit() {
                syncUnCommits()
                
                self.presentAlert(withTitle: "Please wait!", message: "offline records are uploading to server. Stay online.")
            } else {
                doOnMain {
                    let actionSheet = UIAlertController(title: "",
                                                        message: "Are you sure to logout?",
                                                        preferredStyle: .actionSheet)
                    let logout = UIAlertAction(title: "Logout", style: .destructive) { (_) in
                        self.logoutAction()
                    }
                    actionSheet.addAction(logout)
                    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in })
                    actionSheet.addAction(cancel)
                    self.present(actionSheet, animated: true, completion: {})
                }
            }
        } else {
            self.presentAlert(withTitle: "Election",
                              message: "Please ensure that you have connected to internet before logging out")
        }
    }
    
    fileprivate func logoutAction() {
        
        UserDetails.shared.logout()
        UserDetails.shared.setLoggedIn = false
//        
//        let welcomeVC = LoginViewController.instantiateFromAppStoryboard(appStoryboard: .Auth)
//        let navigatinC = UINavigationController(rootViewController: welcomeVC)
//        UIApplication.shared.windows.first?.rootViewController = navigatinC
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

// MARK: - Offline
extension BaseViewController {
    
    func hasUnCommit() -> Bool {
        UnCommit.shared.hasUnCommitItemFound()
    }
    
    func syncUnCommits() {
        UnCommit.shared.commit()
    }
    
    // MARK: - Network listener
    
    /// Start lister
    func networkStartListener() {
        
        net?.startListening(onUpdatePerforming: { (status) in
            switch status {
            case .notReachable:
                // Not connected
                print("The network is not reachable")
                
            case .reachable( _):
                // Connected
                print("The network is reachable")
                if self.hasUnCommit() {
                    self.syncUnCommits()
                }
            case .unknown:
                // Unknown
                print("It is unknown whether the network is reachable")
            }
        })
    }
    
    /// Stop lister
    func networkStopListener() {
        net?.stopListening()
    }
}


