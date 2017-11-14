import UIKit


class ContainerViewController: UIViewController {
    
    lazy var leftViewController: SidePanelViewController? = {
        let vc = SidePanelViewController()
        return vc
    }()
    
    lazy var centerViewController: CenterViewController = {
        let vc = CenterViewController()
        vc.delegate = self
        vc.view.backgroundColor = .white
        return vc
    }()
    
    var centerNavigationController: UINavigationController!
    
    enum SlideOutState {
        case bothCollapsed
        case leftPanelExpanded
    }
    
    var currentState: SlideOutState = .bothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .bothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }

    let centerPanelExpandedOffset: CGFloat = 50
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        
        centerNavigationController.didMove(toParentViewController: self)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        centerNavigationController.view.addGestureRecognizer(panGestureRecognizer)
    }
}

// MARK: CenterViewController delegate

extension ContainerViewController: CenterViewControllerDelegate {
    
    func toggleLeftPanel() {
        print(currentState)
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)

        if notAlreadyExpanded {
            addLeftPanelViewController()
        }

        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    
    func collapseSidePanels() {
        
        switch currentState {
        case .leftPanelExpanded:
            toggleLeftPanel()
        default:
            break
        }
    }
    
    func addLeftPanelViewController() {
        
        if let vc = leftViewController {

            vc.pages = Page.allPages()
            addChildSidePanelController(vc)
            leftViewController = vc
        }
        guard leftViewController == nil else { return }
    }
    
    func addChildSidePanelController(_ sidePanelController: SidePanelViewController) {
        
        sidePanelController.delegate = centerViewController
        view.insertSubview(sidePanelController.view, at: 0)
        addChildViewController(sidePanelController)
        sidePanelController.didMove(toParentViewController: self)
    }
    

    func animateLeftPanel(shouldExpand: Bool) {
        
        if shouldExpand {
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(targetPosition: centerNavigationController.view.frame.width - centerPanelExpandedOffset)
            
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { _ in
                self.currentState = .bothCollapsed
                self.leftViewController?.view.removeFromSuperview()
                //self.leftViewController = nil
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.centerNavigationController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
    
    
    func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
        if shouldShowShadow {
            centerNavigationController.view.layer.shadowOpacity = 0.8
        } else {
            centerNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
}

// MARK: Gesture recognizer

extension ContainerViewController: UIGestureRecognizerDelegate {
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)
        
        switch recognizer.state {
            
        case .began:
            if currentState == .bothCollapsed {
                if gestureIsDraggingFromLeftToRight {
                    addLeftPanelViewController()
                } else {
                    //addRightPanelViewController()
                }
                
                showShadowForCenterViewController(true)
            }
            
        case .changed:
            if let rview = recognizer.view {
                rview.center.x = rview.center.x + recognizer.translation(in: view).x
                recognizer.setTranslation(CGPoint.zero, in: view)
            }
            
        case .ended:
            if let _ = leftViewController,
                let rview = recognizer.view {
                // animate the side panel open or closed based on whether the view has moved more or less than halfway
                let hasMovedGreaterThanHalfway = rview.center.x > view.bounds.size.width
                animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
                
            }
            
        default:
            break
        }
    }
}


