//
// RoadsignSignupView.swift


import UIKit

protocol RoadsignSignupViewDelegate {
	func signupbuttonPressed(signupbutton: UIButton)
}

@IBDesignable
class RoadsignSignupView : UIView {


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

	var roadsignSignupViewDelegate: RoadsignSignupViewDelegate?

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

		let roadsignSignup = UIImageView()
		roadsignSignup.bounds = CGRect(x:0, y:0, width:600.0, height:600.0)
		var imgRoadsignmain: UIImage!
		if let imagePath = bundle.pathForResource("roadsignmain.png", ofType:nil) {
			imgRoadsignmain = UIImage(contentsOfFile:imagePath)
		}
		roadsignSignup.image = imgRoadsignmain
		roadsignSignup.contentMode = .Center;
		roadsignSignup.layer.position = CGPoint(x:384.000, y:462.547)
		roadsignSignup.transform = CGAffineTransformMakeScale(2.24, 2.24)
		__scaling__.addSubview(roadsignSignup)
		viewsByName["roadsignSignup"] = roadsignSignup

		let signupbutton = UIButton.buttonWithType(.Custom) as! UIButton
		signupbutton.bounds = CGRect(x:0, y:0, width:396.0, height:192.0)
		var imgRoadwaybuttonsignup: UIImage!
		if let imagePath = bundle.pathForResource("roadwaybuttonsignup.png", ofType:nil) {
			imgRoadwaybuttonsignup = UIImage(contentsOfFile:imagePath)
		}
		signupbutton.setImage(imgRoadwaybuttonsignup, forState:.Normal)
		signupbutton.contentMode = .Center;
		signupbutton.layer.position = CGPoint(x:384.000, y:840.801)
		signupbutton.transform = CGAffineTransformMakeScale(2.00, 2.00)
		signupbutton.addTarget(self, action:"actionSignupbuttonPressed:", forControlEvents: .TouchUpInside)
		__scaling__.addSubview(signupbutton)
		viewsByName["Signupbutton"] = signupbutton

		self.viewsByName = viewsByName
	}

	// - MARK: dismissSignup

	func addDismissSignupAnimation() {
		addDismissSignupAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addDismissSignupAnimation(completion: ((Bool) -> Void)?) {
		addDismissSignupAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addDismissSignupAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addDismissSignupAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addDismissSignupAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addDismissSignupAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addDismissSignupAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let easeOutTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 1.000
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "DismissSignup")
			self.animationCompletions[layer.animationForKey("DismissSignup")] = complete
		}

		let signupbuttonOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		signupbuttonOpacityAnimation.duration = 1.000
		signupbuttonOpacityAnimation.values = [1.000 as Float, 0.000 as Float, 0.000 as Float]
		signupbuttonOpacityAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		signupbuttonOpacityAnimation.timingFunctions = [easeOutTiming, linearTiming]
		signupbuttonOpacityAnimation.beginTime = beginTime
		signupbuttonOpacityAnimation.fillMode = fillMode
		signupbuttonOpacityAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Signupbutton"]?.layer.addAnimation(signupbuttonOpacityAnimation, forKey:"dismissSignup_Opacity")

		let roadsignSignupOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		roadsignSignupOpacityAnimation.duration = 1.000
		roadsignSignupOpacityAnimation.values = [1.000 as Float, 0.300 as Float]
		roadsignSignupOpacityAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		roadsignSignupOpacityAnimation.timingFunctions = [easeOutTiming]
		roadsignSignupOpacityAnimation.beginTime = beginTime
		roadsignSignupOpacityAnimation.fillMode = fillMode
		roadsignSignupOpacityAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsignSignup"]?.layer.addAnimation(roadsignSignupOpacityAnimation, forKey:"dismissSignup_Opacity")

		let roadsignSignupScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		roadsignSignupScaleXAnimation.duration = 1.000
		roadsignSignupScaleXAnimation.values = [2.245 as Float, 8.745 as Float]
		roadsignSignupScaleXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		roadsignSignupScaleXAnimation.timingFunctions = [easeOutTiming]
		roadsignSignupScaleXAnimation.beginTime = beginTime
		roadsignSignupScaleXAnimation.fillMode = fillMode
		roadsignSignupScaleXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsignSignup"]?.layer.addAnimation(roadsignSignupScaleXAnimation, forKey:"dismissSignup_ScaleX")

		let roadsignSignupScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		roadsignSignupScaleYAnimation.duration = 1.000
		roadsignSignupScaleYAnimation.values = [2.245 as Float, 8.745 as Float]
		roadsignSignupScaleYAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		roadsignSignupScaleYAnimation.timingFunctions = [easeOutTiming]
		roadsignSignupScaleYAnimation.beginTime = beginTime
		roadsignSignupScaleYAnimation.fillMode = fillMode
		roadsignSignupScaleYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsignSignup"]?.layer.addAnimation(roadsignSignupScaleYAnimation, forKey:"dismissSignup_ScaleY")
	}

	func removeDismissSignupAnimation() {
		self.layer.removeAnimationForKey("DismissSignup")
		self.viewsByName["Signupbutton"]?.layer.removeAnimationForKey("dismissSignup_Opacity")
		self.viewsByName["roadsignSignup"]?.layer.removeAnimationForKey("dismissSignup_Opacity")
		self.viewsByName["roadsignSignup"]?.layer.removeAnimationForKey("dismissSignup_ScaleX")
		self.viewsByName["roadsignSignup"]?.layer.removeAnimationForKey("dismissSignup_ScaleY")
	}

	// - MARK: showupSignup

	func addShowupSignupAnimation() {
		addShowupSignupAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addShowupSignupAnimation(completion: ((Bool) -> Void)?) {
		addShowupSignupAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addShowupSignupAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addShowupSignupAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addShowupSignupAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addShowupSignupAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addShowupSignupAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 2.000
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "ShowupSignup")
			self.animationCompletions[layer.animationForKey("ShowupSignup")] = complete
		}

		let signupbuttonRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		signupbuttonRotationAnimation.duration = 2.000
		signupbuttonRotationAnimation.values = [0.000 as Float, -0.147 as Float, 0.129 as Float, 0.005 as Float]
		signupbuttonRotationAnimation.keyTimes = [0.000 as Float, 0.250 as Float, 0.500 as Float, 1.000 as Float]
		signupbuttonRotationAnimation.timingFunctions = [anticOverTiming, anticOverTiming, anticOverTiming]
		signupbuttonRotationAnimation.beginTime = beginTime
		signupbuttonRotationAnimation.fillMode = fillMode
		signupbuttonRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Signupbutton"]?.layer.addAnimation(signupbuttonRotationAnimation, forKey:"showupSignup_Rotation")

		let signupbuttonTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		signupbuttonTranslationXAnimation.duration = 2.000
		signupbuttonTranslationXAnimation.values = [-5.596 as Float, -0.596 as Float, -0.596 as Float]
		signupbuttonTranslationXAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		signupbuttonTranslationXAnimation.timingFunctions = [anticOverTiming, linearTiming]
		signupbuttonTranslationXAnimation.beginTime = beginTime
		signupbuttonTranslationXAnimation.fillMode = fillMode
		signupbuttonTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Signupbutton"]?.layer.addAnimation(signupbuttonTranslationXAnimation, forKey:"showupSignup_TranslationX")

		let signupbuttonTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		signupbuttonTranslationYAnimation.duration = 2.000
		signupbuttonTranslationYAnimation.values = [1042.124 as Float, 22.124 as Float, 22.124 as Float]
		signupbuttonTranslationYAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		signupbuttonTranslationYAnimation.timingFunctions = [anticOverTiming, linearTiming]
		signupbuttonTranslationYAnimation.beginTime = beginTime
		signupbuttonTranslationYAnimation.fillMode = fillMode
		signupbuttonTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Signupbutton"]?.layer.addAnimation(signupbuttonTranslationYAnimation, forKey:"showupSignup_TranslationY")

		let roadsignSignupRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		roadsignSignupRotationAnimation.duration = 2.000
		roadsignSignupRotationAnimation.values = [0.000 as Float, -0.147 as Float, 0.129 as Float, 0.005 as Float]
		roadsignSignupRotationAnimation.keyTimes = [0.000 as Float, 0.250 as Float, 0.500 as Float, 1.000 as Float]
		roadsignSignupRotationAnimation.timingFunctions = [anticOverTiming, anticOverTiming, anticOverTiming]
		roadsignSignupRotationAnimation.beginTime = beginTime
		roadsignSignupRotationAnimation.fillMode = fillMode
		roadsignSignupRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsignSignup"]?.layer.addAnimation(roadsignSignupRotationAnimation, forKey:"showupSignup_Rotation")

		let roadsignSignupTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		roadsignSignupTranslationXAnimation.duration = 2.000
		roadsignSignupTranslationXAnimation.values = [-5.596 as Float, -0.596 as Float, -0.596 as Float]
		roadsignSignupTranslationXAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		roadsignSignupTranslationXAnimation.timingFunctions = [anticOverTiming, linearTiming]
		roadsignSignupTranslationXAnimation.beginTime = beginTime
		roadsignSignupTranslationXAnimation.fillMode = fillMode
		roadsignSignupTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsignSignup"]?.layer.addAnimation(roadsignSignupTranslationXAnimation, forKey:"showupSignup_TranslationX")

		let roadsignSignupTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		roadsignSignupTranslationYAnimation.duration = 2.000
		roadsignSignupTranslationYAnimation.values = [1042.124 as Float, 22.124 as Float, 22.124 as Float]
		roadsignSignupTranslationYAnimation.keyTimes = [0.000 as Float, 0.500 as Float, 1.000 as Float]
		roadsignSignupTranslationYAnimation.timingFunctions = [anticOverTiming, linearTiming]
		roadsignSignupTranslationYAnimation.beginTime = beginTime
		roadsignSignupTranslationYAnimation.fillMode = fillMode
		roadsignSignupTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsignSignup"]?.layer.addAnimation(roadsignSignupTranslationYAnimation, forKey:"showupSignup_TranslationY")
	}

	func removeShowupSignupAnimation() {
		self.layer.removeAnimationForKey("ShowupSignup")
		self.viewsByName["Signupbutton"]?.layer.removeAnimationForKey("showupSignup_Rotation")
		self.viewsByName["Signupbutton"]?.layer.removeAnimationForKey("showupSignup_TranslationX")
		self.viewsByName["Signupbutton"]?.layer.removeAnimationForKey("showupSignup_TranslationY")
		self.viewsByName["roadsignSignup"]?.layer.removeAnimationForKey("showupSignup_Rotation")
		self.viewsByName["roadsignSignup"]?.layer.removeAnimationForKey("showupSignup_TranslationX")
		self.viewsByName["roadsignSignup"]?.layer.removeAnimationForKey("showupSignup_TranslationY")
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
		self.layer.removeAnimationForKey("DismissSignup")
		self.layer.removeAnimationForKey("ShowupSignup")
	}

	func actionSignupbuttonPressed(signupbutton: UIButton) {
		roadsignSignupViewDelegate?.signupbuttonPressed(signupbutton)
	}
}