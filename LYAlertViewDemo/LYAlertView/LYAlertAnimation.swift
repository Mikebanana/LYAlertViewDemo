//
//  LYAlertAnimation.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/12.
//

import UIKit
public enum LYAlertAnimationPopType {
    case `default`
    case scale
    case shakeFromTop
    case shakeFromBottom
    case shakeFromLeft
    case shakeFromRight
    case dropFromLeft
    case dropFromRight
    
}
public enum LYAlertAnimationDissType {
    case `default`
    case scale
    case shakeToTop
    case shakeToBottom
    case shakeToLeft
    case shakeToRight
    case dropFromLeft
    case dropFromRight
    
}

class  LYAlertAnimation:NSObject {
    
    private var targerView:UIView = UIView()
    
    func show(_ type:LYAlertAnimationPopType,_ during:CFTimeInterval,_ target:UIView){
        let  start = target.layer.position
        
        switch type {
        case .default:
            UIView.animate(withDuration: during) {
                target.alpha = 1
            }
        case .scale:
            target.alpha = 1
            animation(target.layer, during, [0.8,1.25,1.0])
        case .shakeFromTop:
            target.alpha = 1
            target.layer.position = CGPoint(x: start.x, y: -start.y)
            dampingAnimation(target, during, start)
        case .shakeFromBottom:
            target.alpha = 1
            target.layer.position = CGPoint(x: start.x, y: LYCommonSet.Kheith + start.y)
            dampingAnimation(target, during, start)
        case .shakeFromLeft:
            target.alpha = 1
            target.layer.position = CGPoint(x: -start.x, y: start.y)
            dampingAnimation(target, during, start)
        case .shakeFromRight:
            target.alpha = 1
            target.layer.position = CGPoint(x:LYCommonSet.Kwidth+start.x, y: start.y)
            dampingAnimation(target, during, start)
        case.dropFromLeft:
            target.alpha = 1
            target.layer.position = CGPoint(x: start.x, y: -start.y)
            target.transform = CGAffineTransform.init(rotationAngle: 15/180.0 * CGFloat.pi)

            dropAnimation(target, during, start, .dropFromLeft)
        case.dropFromRight:
            target.alpha = 1
            target.layer.position = CGPoint(x: start.x, y: -start.y)
            target.transform = CGAffineTransform.init(rotationAngle: -15/180.0 * CGFloat.pi)

            dropAnimation(target, during, start, .dropFromRight)
        }
        self.targerView = target
    }
    
    
    func hide(_ type:LYAlertAnimationDissType,_ during:CFTimeInterval,_ target:UIView){
        let  start = target.layer.position
        var   end = target.layer.position
        switch type {
        case .default:
            UIView.animate(withDuration: during) {
                target.alpha = 0
            } completion: { (isCom) in
                target.removeFromSuperview()
            }

        case .scale:
        
            animation(target.layer, during, [1.0,0.66,0.33,0.01])
        case .shakeToTop:
            end = CGPoint(x: start.x, y: -start.y)
            dampingAnimationDiss(target, during, start,end, type)
        case .shakeToBottom:
           
            end = CGPoint(x: start.x, y: LYCommonSet.Kheith + start.y)
            dampingAnimationDiss(target, during, start,end, type)
        case .shakeToLeft:
            
            end = CGPoint(x: -start.x, y: start.y)
            dampingAnimationDiss(target, during, start,end, type)
        case .shakeToRight:
            
            end = CGPoint(x:LYCommonSet.Kwidth+start.x, y: start.y)
            dampingAnimationDiss(target, during, start,end, type)
        case.dropFromLeft:
           
            end = CGPoint(x: start.x, y: LYCommonSet.Kheith + start.y)

            dropAnimationDiss(target, during, end, type)
        case.dropFromRight:
           
            end = CGPoint(x: start.x, y: LYCommonSet.Kheith + start.y)

            dropAnimationDiss(target, during, end, type)
        }
    }
    
    
    
   private func dropAnimation(_ target:UIView,_ duration:TimeInterval,_ start:CGPoint,_ type:LYAlertAnimationPopType){
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1.0, options: .curveEaseIn) {
            target.layer.position = start
        } completion: { (isCom) in
        }
        UIView.animate(withDuration: duration*0.6) {
            target.layer.transform = CATransform3DMakeRotation(type == .dropFromLeft ? 6/180.0 * CGFloat.pi : -6/180.0 * CGFloat.pi , 0, 0, 0)
        } completion: { (isCom) in
            UIView.animate(withDuration: duration*0.2) {
                target.transform = CGAffineTransform.init(rotationAngle: type == .dropFromLeft ? 1/180.0 * CGFloat.pi : -1/180.0 * CGFloat.pi)

            } completion: { (isCom) in
                UIView.animate(withDuration: duration*0.2) {
                    target.transform = CGAffineTransform.identity
                }
            }

            
        }
        
    }
    private func dropAnimationDiss(_ target:UIView,_ duration:TimeInterval,_ end:CGPoint,_ type:LYAlertAnimationDissType){
        UIView.animate(withDuration: duration) {
            target.layer.position = end
        } completion: { (isCom) in
            
        }
        animationRo(target.layer, duration, type == .dropFromLeft ? 15/180.0 * CGFloat.pi : -15/180.0 * CGFloat.pi)
     

        
    }
    
    private func dampingAnimation(_ target:UIView,_ duration:TimeInterval,_ start:CGPoint){
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseIn) {
            target.layer.position = start
        } completion: { (isCom) in
            
        }
    }
    private func dampingAnimationDiss(_ target:UIView,_ duration:TimeInterval,_ start:CGPoint,_ end:CGPoint,_ type:LYAlertAnimationDissType){
        UIView.animate(withDuration: duration*0.2) {
            switch type{
            case .shakeToTop:
            target.layer.position = CGPoint(x: start.x, y: start.y+50.0)
            case .shakeToBottom:
            target.layer.position = CGPoint(x: start.x, y: start.y-50.0)
            case .shakeToLeft:
            target.layer.position = CGPoint(x: start.x+50.0, y: start.y)
            case .shakeToRight:
            target.layer.position = CGPoint(x: start.x-50.0, y: start.y)
            default:
                break
            }
        } completion: { (isCom) in
            UIView.animate(withDuration: duration*0.8) {
                target.layer.position = end
            }
        }

    }
    private func animationRo(_ layer:CALayer,_ duration:CFTimeInterval,_ rangle:CGFloat){
        let animation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.fromValue = 0
        animation.toValue = rangle
       
        
        animation.timingFunction = CAMediaTimingFunction.init(name: .easeIn)
        layer.add(animation, forKey: nil)
    }
    private func animation(_ layer:CALayer,_ duration:CFTimeInterval,_ values:[CGFloat]){
        let animation = CAKeyframeAnimation.init(keyPath: "transform")
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        var arr = [NSValue]()
        for i in values{
            arr.append(NSValue.init(caTransform3D: CATransform3DMakeScale(i, i, 1)))
            
        }
        animation.values = arr
       
        
        animation.timingFunction = CAMediaTimingFunction.init(name: .easeIn)
        layer.add(animation, forKey: nil)
    }
 
}
