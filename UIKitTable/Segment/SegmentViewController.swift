//
//  SegmentViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 7/2/24.
//

import UIKit

class SegmentViewController: UIViewController {
    
    @IBOutlet weak var segments: UISegmentedControl!
    @IBOutlet weak var segmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegments()
    }
    
    private func setupSegments() {
        segments.removeAllSegments()
        segments.insertSegment(withTitle: "First", at: 0, animated: false)
        segments.insertSegment(withTitle: "Second", at: 1, animated: false)
        segments.selectedSegmentIndex = 0
        
        segmentLabel.text = "First Segment Selected"
        
        segments.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentLabel.text = "First Segment Selected"
        case 1:
            segmentLabel.text = "Second Segment Selected"
        default:
            break
        }
    }
}
