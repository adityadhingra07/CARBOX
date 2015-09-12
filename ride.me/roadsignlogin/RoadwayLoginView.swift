//
// RoadwayLoginView.swift

import UIKit

protocol RoadwayLoginViewDelegate {
	func loginbuttonPressed(loginbutton: UIButton)
}

@IBDesignable
class RoadwayLoginView : UIView {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 768, height: 1136))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	var roadwayloginViewDelegate: RoadwayLoginViewDelegate?

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .ScaleToFill:
				break
			case .ScaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransformMakeScale(xScale, yScale)
			scalingView.center = CGPoint(x:CGRectGetMidX(self.bounds), y:CGRectGetMidY(self.bounds))
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = NSBundle(forClass:self.dynamicType)
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:768, height:1136)
		__scaling__.center = CGPoint(x:384.0, y:568.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let roadsign = UIImageView()
		roadsign.bounds = CGRect(x:0, y:0, width:600.0, height:600.0)
		var imgRoadsignmain: UIImage!
		if let imagePath = bundle.pathForResource("roadsignmain.png", ofType:nil) {
			imgRoadsignmain = UIImage(contentsOfFile:imagePath)
		}
		roadsign.image = imgRoadsignmain
		roadsign.contentMode = .Center;
		roadsign.layer.position = CGPoint(x:384.000, y:462.547)
		roadsign.transform = CGAffineTransformMakeScale(2.24, 2.24)
		__scaling__.addSubview(roadsign)
		viewsByName["roadsign"] = roadsign

		let loginbutton = UIButton.buttonWithType(.Custom) as! UIButton
		loginbutton.bounds = CGRect(x:0, y:0, width:396.0, height:192.0)
		var imgLoginbtnroadway: UIImage!
		if let imagePath = bundle.pathForResource("loginbtnroadway.png", ofType:nil) {
			imgLoginbtnroadway = UIImage(contentsOfFile:imagePath)
		}
		loginbutton.setImage(imgLoginbtnroadway, forState:.Normal)
		loginbutton.contentMode = .Center;
		loginbutton.layer.position = CGPoint(x:384.000, y:840.801)
		loginbutton.transform = CGAffineTransformMakeScale(2.00, 2.00)
		loginbutton.addTarget(self, action:"actionLoginbuttonPressed:", forControlEvents: .TouchUpInside)
		__scaling__.addSubview(loginbutton)
		viewsByName["loginbutton"] = loginbutton

		self.viewsByName = viewsByName
	}

	// - MARK: dismisslogin

	func addDismissloginAnimation() {
		addDismissloginAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addDismissloginAnimation(completion: ((Bool) -> Void)?) {
		addDismissloginAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addDismissloginAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addDismissloginAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addDismissloginAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addDismissloginAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addDismissloginAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let easeOutTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 1.000
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Dismisslogin")
			self.animationCompletions[layer.animationForKey("Dismisslogin")] = complete
		}

		let loginbuttonOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		loginbuttonOpacityAnimation.duration = 1.000
		loginbuttonOpacityAnimation.values = [1.000 as Float, 0.000 as Float, 0.000 as Float]
		loginbuttonOpacityAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		loginbuttonOpacityAnimation.timingFunctions = [easeOutTiming, linearTiming]
		loginbuttonOpacityAnimation.beginTime = beginTime
		loginbuttonOpacityAnimation.fillMode = fillMode
		loginbuttonOpacityAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["loginbutton"]?.layer.addAnimation(loginbuttonOpacityAnimation, forKey:"dismisslogin_Opacity")

		let roadsignOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		roadsignOpacityAnimation.duration = 1.000
		roadsignOpacityAnimation.values = [1.000 as Float, 0.300 as Float]
		roadsignOpacityAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		roadsignOpacityAnimation.timingFunctions = [easeOutTiming]
		roadsignOpacityAnimation.beginTime = beginTime
		roadsignOpacityAnimation.fillMode = fillMode
		roadsignOpacityAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsign"]?.layer.addAnimation(roadsignOpacityAnimation, forKey:"dismisslogin_Opacity")

		let roadsignScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		roadsignScaleXAnimation.duration = 1.000
		roadsignScaleXAnimation.values = [2.245 as Float, 8.745 as Float]
		roadsignScaleXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		roadsignScaleXAnimation.timingFunctions = [easeOutTiming]
		roadsignScaleXAnimation.beginTime = beginTime
		roadsignScaleXAnimation.fillMode = fillMode
		roadsignScaleXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsign"]?.layer.addAnimation(roadsignScaleXAnimation, forKey:"dismisslogin_ScaleX")

		let roadsignScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		roadsignScaleYAnimation.duration = 1.000
		roadsignScaleYAnimation.values = [2.245 as Float, 8.745 as Float]
		roadsignScaleYAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		roadsignScaleYAnimation.timingFunctions = [easeOutTiming]
		roadsignScaleYAnimation.beginTime = beginTime
		roadsignScaleYAnimation.fillMode = fillMode
		roadsignScaleYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsign"]?.layer.addAnimation(roadsignScaleYAnimation, forKey:"dismisslogin_ScaleY")
	}

	func removeDismissloginAnimation() {
		self.layer.removeAnimationForKey("Dismisslogin")
		self.viewsByName["loginbutton"]?.layer.removeAnimationForKey("dismisslogin_Opacity")
		self.viewsByName["roadsign"]?.layer.removeAnimationForKey("dismisslogin_Opacity")
		self.viewsByName["roadsign"]?.layer.removeAnimationForKey("dismisslogin_ScaleX")
		self.viewsByName["roadsign"]?.layer.removeAnimationForKey("dismisslogin_ScaleY")
	}

	// - MARK: showuplogin

	func addShowuploginAnimation() {
		addShowuploginAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addShowuploginAnimation(completion: ((Bool) -> Void)?) {
		addShowuploginAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addShowuploginAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addShowuploginAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addShowuploginAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addShowuploginAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addShowuploginAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 2.000
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Showuplogin")
			self.animationCompletions[layer.animationForKey("Showuplogin")] = complete
		}

		let loginbuttonRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		loginbuttonRotationAnimation.duration = 2.000
		loginbuttonRotationAnimation.values = [0.000 as Float, -0.147 as Float, 0.129 as Float, 0.005 as Float]
		loginbuttonRotationAnimation.keyTimes = [0.000 as Float, 0.250 as Float, 0.500 as Float, 1.000 as Float]
		loginbuttonRotationAnimation.timingFunctions = [anticOverTiming, anticOverTiming, anticOverTiming]
		loginbuttonRotationAnimation.beginTime = beginTime
		loginbuttonRotationAnimation.fillMode = fillMode
		loginbuttonRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["loginbutton"]?.layer.addAnimation(loginbuttonRotationAnimation, forKey:"showuplogin_Rotation")

		let loginbuttonTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		loginbuttonTranslationXAnimation.duration = 2.000
		loginbuttonTranslationXAnimation.values = [-5.596 as Float, -0.596 as Float, -0.596 as Float]
		loginbuttonTranslationXAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		loginbuttonTranslationXAnimation.timingFunctions = [anticOverTiming, linearTiming]
		loginbuttonTranslationXAnimation.beginTime = beginTime
		loginbuttonTranslationXAnimation.fillMode = fillMode
		loginbuttonTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["loginbutton"]?.layer.addAnimation(loginbuttonTranslationXAnimation, forKey:"showuplogin_TranslationX")

		let loginbuttonTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		loginbuttonTranslationYAnimation.duration = 2.000
		loginbuttonTranslationYAnimation.values = [1042.124 as Float, 22.124 as Float, 22.124 as Float]
		loginbuttonTranslationYAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		loginbuttonTranslationYAnimation.timingFunctions = [anticOverTiming, linearTiming]
		loginbuttonTranslationYAnimation.beginTime = beginTime
		loginbuttonTranslationYAnimation.fillMode = fillMode
		loginbuttonTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["loginbutton"]?.layer.addAnimation(loginbuttonTranslationYAnimation, forKey:"showuplogin_TranslationY")

		let roadsignRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		roadsignRotationAnimation.duration = 2.000
		roadsignRotationAnimation.values = [0.000 as Float, -0.147 as Float, 0.129 as Float, 0.005 as Float]
		roadsignRotationAnimation.keyTimes = [0.000 as Float, 0.250 as Float, 0.500 as Float, 1.000 as Float]
		roadsignRotationAnimation.timingFunctions = [anticOverTiming, anticOverTiming, anticOverTiming]
		roadsignRotationAnimation.beginTime = beginTime
		roadsignRotationAnimation.fillMode = fillMode
		roadsignRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsign"]?.layer.addAnimation(roadsignRotationAnimation, forKey:"showuplogin_Rotation")

		let roadsignTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		roadsignTranslationXAnimation.duration = 2.000
		roadsignTranslationXAnimation.values = [-5.596 as Float, -0.596 as Float, -0.596 as Float]
		roadsignTranslationXAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		roadsignTranslationXAnimation.timingFunctions = [anticOverTiming, linearTiming]
		roadsignTranslationXAnimation.beginTime = beginTime
		roadsignTranslationXAnimation.fillMode = fillMode
		roadsignTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsign"]?.layer.addAnimation(roadsignTranslationXAnimation, forKey:"showuplogin_TranslationX")

		let roadsignTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		roadsignTranslationYAnimation.duration = 2.000
		roadsignTranslationYAnimation.values = [1042.124 as Float, 22.124 as Float, 22.124 as Float]
		roadsignTranslationYAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		roadsignTranslationYAnimation.timingFunctions = [anticOverTiming, linearTiming]
		roadsignTranslationYAnimation.beginTime = beginTime
		roadsignTranslationYAnimation.fillMode = fillMode
		roadsignTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsign"]?.layer.addAnimation(roadsignTranslationYAnimation, forKey:"showuplogin_TranslationY")
	}

	func removeShowuploginAnimation() {
		self.layer.removeAnimationForKey("Showuplogin")
		self.viewsByName["loginbutton"]?.layer.removeAnimationForKey("showuplogin_Rotation")
		self.viewsByName["loginbutton"]?.layer.removeAnimationForKey("showuplogin_TranslationX")
		self.viewsByName["loginbutton"]?.layer.removeAnimationForKey("showuplogin_TranslationY")
		self.viewsByName["roadsign"]?.layer.removeAnimationForKey("showuplogin_Rotation")
		self.viewsByName["roadsign"]?.layer.removeAnimationForKey("showuplogin_TranslationX")
		self.viewsByName["roadsign"]?.layer.removeAnimationForKey("showuplogin_TranslationY")
	}

	override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValueForKey(anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimationForKey("Showuplogin")
		self.layer.removeAnimationForKey("Dismisslogin")
	}

	func actionLoginbuttonPressed(loginbutton: UIButton) {
		roadwayloginViewDelegate?.loginbuttonPressed(loginbutton)
	}
}