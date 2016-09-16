//
//  TodayViewController.swift
//  MuhammedTestExtension
//
//  Created by Scotty Shaw on 9/15/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    var currentSize = CGSize()
    var isWidgetExpanded = Bool()
    
    @IBOutlet weak var widgetSizeButton: UIButton!
    
    @IBAction func expandWidget(sender: AnyObject) {
        if (!isWidgetExpanded) {
            expandWidget()
        }
        else {
            shrinkWidget()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        currentSize = self.preferredContentSize
        shrinkWidget()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    func shrinkWidget() {
        currentSize.height = 80.0
        self.preferredContentSize = currentSize
        isWidgetExpanded = false
        widgetSizeButton.setTitle("Expand", forState: UIControlState.Normal)
    }
    
    func expandWidget() {
        currentSize.height = 160.0
        self.preferredContentSize = currentSize
        isWidgetExpanded = true
        widgetSizeButton.setTitle("Shrink", forState: UIControlState.Normal)
    }
    
}
