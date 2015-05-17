//
//  ViewController.swift
//  demo-carousel
//
//  Created by Joshua Bisch on 5/13/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introScrollView.contentSize = introImageView.image!.size
        
        // Do any additional setup after loading the view, typically from a nib.
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        
        var offset = Float(introScrollView.contentOffset.y)
        
        var tile1x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -60, r2Max: 0)
        var tile1y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var tile1Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var tile1Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tile1x), CGFloat(tile1y))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(tile1Scale), CGFloat(tile1Scale))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(tile1Rotation) * M_PI / 180))
        
        var tile2x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 30, r2Max: 0)
        var tile2y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        var tile2Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var tile2Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(tile2x), CGFloat(tile2y))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(tile2Scale), CGFloat(tile2Scale))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(tile2Rotation) * M_PI / 180))
        
        var tile3x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 40, r2Max: 0)
        var tile3y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -430, r2Max: 0)
        var tile3Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        var tile3Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(tile3x), CGFloat(tile3y))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(tile3Scale), CGFloat(tile3Scale))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(tile3Rotation) * M_PI / 180))
        
        var tile4x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 70, r2Max: 0)
        var tile4y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        var tile4Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        var tile4Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 8, r2Max: 0)
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(tile4x), CGFloat(tile4y))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(tile4Scale), CGFloat(tile4Scale))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(tile4Rotation) * M_PI / 180))
        
        var tile5x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        var tile5y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        var tile5Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var tile5Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(tile5x), CGFloat(tile5y))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(tile5Scale), CGFloat(tile5Scale))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(tile5Rotation) * M_PI / 180))
        
        var tile6x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -190, r2Max: 0)
        var tile6y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -520, r2Max: 0)
        var tile6Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var tile6Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(tile6x), CGFloat(tile6y))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(tile6Scale), CGFloat(tile6Scale))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(tile6Rotation) * M_PI / 180))
        
        
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func tranformView(view : UIView!, atIndex index : Int, offset : Float){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        var offset = Float(introScrollView.contentOffset.y)
        
        //Reposition tile1View
        //content offset 0->568
        //x offset: -30->0
        //x offset: -285->0
        var tile1x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -60, r2Max: 0)
        var tile1y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var tile1Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var tile1Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tile1x), CGFloat(tile1y))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(tile1Scale), CGFloat(tile1Scale))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(tile1Rotation) * M_PI / 180))
        
        var tile2x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 30, r2Max: 0)
        var tile2y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        var tile2Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var tile2Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(tile2x), CGFloat(tile2y))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(tile2Scale), CGFloat(tile2Scale))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(tile2Rotation) * M_PI / 180))
        
        var tile3x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 40, r2Max: 0)
        var tile3y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -430, r2Max: 0)
        var tile3Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        var tile3Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(tile3x), CGFloat(tile3y))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(tile3Scale), CGFloat(tile3Scale))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(tile3Rotation) * M_PI / 180))
        
        var tile4x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 70, r2Max: 0)
        var tile4y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        var tile4Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        var tile4Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 8, r2Max: 0)
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(tile4x), CGFloat(tile4y))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(tile4Scale), CGFloat(tile4Scale))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(tile4Rotation) * M_PI / 180))
        
        var tile5x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        var tile5y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        var tile5Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var tile5Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(tile5x), CGFloat(tile5y))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(tile5Scale), CGFloat(tile5Scale))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(tile5Rotation) * M_PI / 180))
        
        var tile6x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -190, r2Max: 0)
        var tile6y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -520, r2Max: 0)
        var tile6Scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var tile6Rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(tile6x), CGFloat(tile6y))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(tile6Scale), CGFloat(tile6Scale))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(tile6Rotation) * M_PI / 180))
    
    }


}