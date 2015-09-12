//
// MainviewView.swift


import UIKit

protocol MainviewViewDelegate {
	func loginbtnPressed(loginbtn: UIButton)
	func signupbtnPressed(signupbtn: UIButton)
}

@IBDesignable
class MainviewView : UIView {


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

	var mainviewViewDelegate: MainviewViewDelegate?

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

		let loginbg = UIImageView()
		loginbg.bounds = CGRect(x:0, y:0, width:768.0, height:1136.0)
		var imgLoginbgnew: UIImage!
		if let imagePath = bundle.pathForResource("loginbgnew.png", ofType:nil) {
			imgLoginbgnew = UIImage(contentsOfFile:imagePath)
		}
		loginbg.image = imgLoginbgnew
		loginbg.contentMode = .Center;
		loginbg.layer.position = CGPoint(x:384.000, y:568.000)
		__scaling__.addSubview(loginbg)
		viewsByName["loginbg"] = loginbg

		let whitepolygon2 = UIImageView()
		whitepolygon2.bounds = CGRect(x:0, y:0, width:600.0, height:600.0)
		var imgWhitepolygon: UIImage!
		if let imagePath = bundle.pathForResource("whitepolygon.png", ofType:nil) {
			imgWhitepolygon = UIImage(contentsOfFile:imagePath)
		}
		whitepolygon2.image = imgWhitepolygon
		whitepolygon2.contentMode = .Center;
		whitepolygon2.layer.position = CGPoint(x:533.069, y:568.000)
		__scaling__.addSubview(whitepolygon2)
		viewsByName["whitepolygon 2"] = whitepolygon2

		let whitepolygon = UIImageView()
		whitepolygon.bounds = CGRect(x:0, y:0, width:600.0, height:600.0)
		whitepolygon.image = imgWhitepolygon
		whitepolygon.contentMode = .Center;
		whitepolygon.layer.position = CGPoint(x:300.000, y:568.000)
		__scaling__.addSubview(whitepolygon)
		viewsByName["whitepolygon"] = whitepolygon

		let roadsign = UIView()
		roadsign.bounds = CGRect(x:0, y:0, width:800.0, height:600.0)
		roadsign.layer.position = CGPoint(x:400.000, y:1436.000)
		__scaling__.addSubview(roadsign)
		viewsByName["roadsign"] = roadsign

		let rod = UIImageView()
		rod.bounds = CGRect(x:0, y:0, width:800.0, height:600.0)
		var imgRod: UIImage!
		if let imagePath = bundle.pathForResource("rod.png", ofType:nil) {
			imgRod = UIImage(contentsOfFile:imagePath)
		}
		rod.image = imgRod
		rod.contentMode = .Center;
		rod.layer.position = CGPoint(x:400.000, y:300.000)
		roadsign.addSubview(rod)
		viewsByName["rod"] = rod

		let signupbtn = UIButton.buttonWithType(.Custom) as! UIButton
		signupbtn.bounds = CGRect(x:0, y:0, width:300.0, height:100.0)
		var imgSignupbtn: UIImage!
		if let imagePath = bundle.pathForResource("signupbtn.png", ofType:nil) {
			imgSignupbtn = UIImage(contentsOfFile:imagePath)
		}
		signupbtn.setImage(imgSignupbtn, forState:.Normal)
		signupbtn.contentMode = .Center;
		signupbtn.layer.position = CGPoint(x:231.961, y:245.293)
		signupbtn.addTarget(self, action:"actionSignupbtnPressed:", forControlEvents: .TouchUpInside)
		roadsign.addSubview(signupbtn)
		viewsByName["signupbtn"] = signupbtn

		let loginbtn = UIButton.buttonWithType(.Custom) as! UIButton
		loginbtn.bounds = CGRect(x:0, y:0, width:300.0, height:100.0)
		var imgLoginbtn: UIImage!
		if let imagePath = bundle.pathForResource("loginbtn.png", ofType:nil) {
			imgLoginbtn = UIImage(contentsOfFile:imagePath)
		}
		loginbtn.setImage(imgLoginbtn, forState:.Normal)
		loginbtn.contentMode = .Center;
		loginbtn.layer.position = CGPoint(x:548.000, y:383.293)
		loginbtn.addTarget(self, action:"actionLoginbtnPressed:", forControlEvents: .TouchUpInside)
		roadsign.addSubview(loginbtn)
		viewsByName["loginbtn"] = loginbtn

		let ridemelogo = UIImageView()
		ridemelogo.bounds = CGRect(x:0, y:0, width:500.0, height:250.0)
		var imgRidemelogo: UIImage!
		if let imagePath = bundle.pathForResource("ridemelogo.png", ofType:nil) {
			imgRidemelogo = UIImage(contentsOfFile:imagePath)
		}
		ridemelogo.image = imgRidemelogo
		ridemelogo.contentMode = .Center;
		ridemelogo.layer.position = CGPoint(x:384.000, y:282.825)
		__scaling__.addSubview(ridemelogo)
		viewsByName["ridemelogo"] = ridemelogo

		self.viewsByName = viewsByName
	}

	// - MARK: loadanimation

	func addLoadanimationAnimation() {
		addLoadanimationAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addLoadanimationAnimation(completion: ((Bool) -> Void)?) {
		addLoadanimationAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addLoadanimationAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addLoadanimationAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addLoadanimationAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addLoadanimationAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addLoadanimationAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 2.000
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Loadanimation")
			self.animationCompletions[layer.animationForKey("Loadanimation")] = complete
		}

		let signupbtnTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		signupbtnTranslationXAnimation.duration = 2.000
		signupbtnTranslationXAnimation.values = [2.869 as Float, 2.869 as Float]
		signupbtnTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		signupbtnTranslationXAnimation.timingFunctions = [linearTiming]
		signupbtnTranslationXAnimation.beginTime = beginTime
		signupbtnTranslationXAnimation.fillMode = fillMode
		signupbtnTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["signupbtn"]?.layer.addAnimation(signupbtnTranslationXAnimation, forKey:"loadanimation_TranslationX")

		let signupbtnTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		signupbtnTranslationYAnimation.duration = 2.000
		signupbtnTranslationYAnimation.values = [320.946 as Float, 320.946 as Float]
		signupbtnTranslationYAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		signupbtnTranslationYAnimation.timingFunctions = [linearTiming]
		signupbtnTranslationYAnimation.beginTime = beginTime
		signupbtnTranslationYAnimation.fillMode = fillMode
		signupbtnTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["signupbtn"]?.layer.addAnimation(signupbtnTranslationYAnimation, forKey:"loadanimation_TranslationY")

		let whitepolygon2RotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		whitepolygon2RotationAnimation.duration = 2.000
		whitepolygon2RotationAnimation.values = [0.000 as Float, -6.283 as Float, -6.283 as Float]
		whitepolygon2RotationAnimation.keyTimes = [0.000 as Float, 0.750 as Float, 1.000 as Float]
		whitepolygon2RotationAnimation.timingFunctions = [anticOverTiming, linearTiming]
		whitepolygon2RotationAnimation.beginTime = beginTime
		whitepolygon2RotationAnimation.fillMode = fillMode
		whitepolygon2RotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["whitepolygon 2"]?.layer.addAnimation(whitepolygon2RotationAnimation, forKey:"loadanimation_Rotation")

		let whitepolygon2TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		whitepolygon2TranslationXAnimation.duration = 2.000
		whitepolygon2TranslationXAnimation.values = [490.000 as Float, -130.000 as Float, -130.000 as Float]
		whitepolygon2TranslationXAnimation.keyTimes = [0.000 as Float, 0.750 as Float, 1.000 as Float]
		whitepolygon2TranslationXAnimation.timingFunctions = [anticOverTiming, linearTiming]
		whitepolygon2TranslationXAnimation.beginTime = beginTime
		whitepolygon2TranslationXAnimation.fillMode = fillMode
		whitepolygon2TranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["whitepolygon 2"]?.layer.addAnimation(whitepolygon2TranslationXAnimation, forKey:"loadanimation_TranslationX")

		let whitepolygon2TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		whitepolygon2TranslationYAnimation.duration = 2.000
		whitepolygon2TranslationYAnimation.values = [0.000 as Float, 0.000 as Float, -110.000 as Float]
		whitepolygon2TranslationYAnimation.keyTimes = [0.000 as Float, 0.750 as Float, 1.000 as Float]
		whitepolygon2TranslationYAnimation.timingFunctions = [linearTiming, anticOverTiming]
		whitepolygon2TranslationYAnimation.beginTime = beginTime
		whitepolygon2TranslationYAnimation.fillMode = fillMode
		whitepolygon2TranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["whitepolygon 2"]?.layer.addAnimation(whitepolygon2TranslationYAnimation, forKey:"loadanimation_TranslationY")

		let ridemelogoScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		ridemelogoScaleXAnimation.duration = 2.000
		ridemelogoScaleXAnimation.values = [1.000 as Float, 1.000 as Float, 1.100 as Float]
		ridemelogoScaleXAnimation.keyTimes = [0.000 as Float, 0.875 as Float, 1.000 as Float]
		ridemelogoScaleXAnimation.timingFunctions = [linearTiming, anticOverTiming]
		ridemelogoScaleXAnimation.beginTime = beginTime
		ridemelogoScaleXAnimation.fillMode = fillMode
		ridemelogoScaleXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["ridemelogo"]?.layer.addAnimation(ridemelogoScaleXAnimation, forKey:"loadanimation_ScaleX")

		let ridemelogoScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		ridemelogoScaleYAnimation.duration = 2.000
		ridemelogoScaleYAnimation.values = [1.000 as Float, 1.000 as Float, 1.100 as Float]
		ridemelogoScaleYAnimation.keyTimes = [0.000 as Float, 0.875 as Float, 1.000 as Float]
		ridemelogoScaleYAnimation.timingFunctions = [linearTiming, anticOverTiming]
		ridemelogoScaleYAnimation.beginTime = beginTime
		ridemelogoScaleYAnimation.fillMode = fillMode
		ridemelogoScaleYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["ridemelogo"]?.layer.addAnimation(ridemelogoScaleYAnimation, forKey:"loadanimation_ScaleY")

		let ridemelogoTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		ridemelogoTranslationXAnimation.duration = 2.000
		ridemelogoTranslationXAnimation.values = [0.000 as Float, 0.000 as Float, -0.095 as Float, -0.095 as Float]
		ridemelogoTranslationXAnimation.keyTimes = [0.000 as Float, 0.250 as Float, 0.875 as Float, 1.000 as Float]
		ridemelogoTranslationXAnimation.timingFunctions = [linearTiming, anticOverTiming, linearTiming]
		ridemelogoTranslationXAnimation.beginTime = beginTime
		ridemelogoTranslationXAnimation.fillMode = fillMode
		ridemelogoTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["ridemelogo"]?.layer.addAnimation(ridemelogoTranslationXAnimation, forKey:"loadanimation_TranslationX")

		let ridemelogoTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		ridemelogoTranslationYAnimation.duration = 2.000
		ridemelogoTranslationYAnimation.values = [-430.000 as Float, -430.000 as Float, 272.831 as Float, 272.831 as Float, 152.831 as Float]
		ridemelogoTranslationYAnimation.keyTimes = [0.000 as Float, 0.250 as Float, 0.875 as Float, 0.925 as Float, 1.000 as Float]
		ridemelogoTranslationYAnimation.timingFunctions = [linearTiming, anticOverTiming, linearTiming, anticOverTiming]
		ridemelogoTranslationYAnimation.beginTime = beginTime
		ridemelogoTranslationYAnimation.fillMode = fillMode
		ridemelogoTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["ridemelogo"]?.layer.addAnimation(ridemelogoTranslationYAnimation, forKey:"loadanimation_TranslationY")

		let rodTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		rodTranslationXAnimation.duration = 2.000
		rodTranslationXAnimation.values = [0.000 as Float, 0.000 as Float]
		rodTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		rodTranslationXAnimation.timingFunctions = [linearTiming]
		rodTranslationXAnimation.beginTime = beginTime
		rodTranslationXAnimation.fillMode = fillMode
		rodTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["rod"]?.layer.addAnimation(rodTranslationXAnimation, forKey:"loadanimation_TranslationX")

		let rodTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		rodTranslationYAnimation.duration = 2.000
		rodTranslationYAnimation.values = [320.842 as Float, 320.842 as Float]
		rodTranslationYAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		rodTranslationYAnimation.timingFunctions = [linearTiming]
		rodTranslationYAnimation.beginTime = beginTime
		rodTranslationYAnimation.fillMode = fillMode
		rodTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["rod"]?.layer.addAnimation(rodTranslationYAnimation, forKey:"loadanimation_TranslationY")

		let whitepolygonRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		whitepolygonRotationAnimation.duration = 2.000
		whitepolygonRotationAnimation.values = [0.000 as Float, 6.283 as Float, 6.283 as Float]
		whitepolygonRotationAnimation.keyTimes = [0.000 as Float, 0.750 as Float, 1.000 as Float]
		whitepolygonRotationAnimation.timingFunctions = [anticOverTiming, linearTiming]
		whitepolygonRotationAnimation.beginTime = beginTime
		whitepolygonRotationAnimation.fillMode = fillMode
		whitepolygonRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["whitepolygon"]?.layer.addAnimation(whitepolygonRotationAnimation, forKey:"loadanimation_Rotation")

		let whitepolygonTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		whitepolygonTranslationXAnimation.duration = 2.000
		whitepolygonTranslationXAnimation.values = [-550.000 as Float, 60.000 as Float, 60.000 as Float]
		whitepolygonTranslationXAnimation.keyTimes = [0.000 as Float, 0.750 as Float, 1.000 as Float]
		whitepolygonTranslationXAnimation.timingFunctions = [anticOverTiming, linearTiming]
		whitepolygonTranslationXAnimation.beginTime = beginTime
		whitepolygonTranslationXAnimation.fillMode = fillMode
		whitepolygonTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["whitepolygon"]?.layer.addAnimation(whitepolygonTranslationXAnimation, forKey:"loadanimation_TranslationX")

		let whitepolygonTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		whitepolygonTranslationYAnimation.duration = 2.000
		whitepolygonTranslationYAnimation.values = [0.000 as Float, 0.000 as Float, -110.000 as Float]
		whitepolygonTranslationYAnimation.keyTimes = [0.000 as Float, 0.725 as Float, 1.000 as Float]
		whitepolygonTranslationYAnimation.timingFunctions = [linearTiming, anticOverTiming]
		whitepolygonTranslationYAnimation.beginTime = beginTime
		whitepolygonTranslationYAnimation.fillMode = fillMode
		whitepolygonTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["whitepolygon"]?.layer.addAnimation(whitepolygonTranslationYAnimation, forKey:"loadanimation_TranslationY")

		let roadsignRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		roadsignRotationAnimation.duration = 2.000
		roadsignRotationAnimation.values = [0.000 as Float, 0.150 as Float, -0.070 as Float, 0.000 as Float, 0.000 as Float]
		roadsignRotationAnimation.keyTimes = [0.000 as Float, 0.250 as Float, 0.500 as Float, 0.750 as Float, 1.000 as Float]
		roadsignRotationAnimation.timingFunctions = [anticOverTiming, anticOverTiming, anticOverTiming, linearTiming]
		roadsignRotationAnimation.beginTime = beginTime
		roadsignRotationAnimation.fillMode = fillMode
		roadsignRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsign"]?.layer.addAnimation(roadsignRotationAnimation, forKey:"loadanimation_Rotation")

		let roadsignTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		roadsignTranslationXAnimation.duration = 2.000
		roadsignTranslationXAnimation.values = [-4.000 as Float, -4.000 as Float]
		roadsignTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		roadsignTranslationXAnimation.timingFunctions = [linearTiming]
		roadsignTranslationXAnimation.beginTime = beginTime
		roadsignTranslationXAnimation.fillMode = fillMode
		roadsignTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsign"]?.layer.addAnimation(roadsignTranslationXAnimation, forKey:"loadanimation_TranslationX")

		let roadsignTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		roadsignTranslationYAnimation.duration = 2.000
		roadsignTranslationYAnimation.values = [-461.000 as Float, -811.000 as Float, -811.000 as Float]
		roadsignTranslationYAnimation.keyTimes = [0.000 as Float, 0.750 as Float, 1.000 as Float]
		roadsignTranslationYAnimation.timingFunctions = [anticOverTiming, linearTiming]
		roadsignTranslationYAnimation.beginTime = beginTime
		roadsignTranslationYAnimation.fillMode = fillMode
		roadsignTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["roadsign"]?.layer.addAnimation(roadsignTranslationYAnimation, forKey:"loadanimation_TranslationY")

		let loginbtnTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		loginbtnTranslationXAnimation.duration = 2.000
		loginbtnTranslationXAnimation.values = [1.168 as Float, 1.168 as Float]
		loginbtnTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		loginbtnTranslationXAnimation.timingFunctions = [linearTiming]
		loginbtnTranslationXAnimation.beginTime = beginTime
		loginbtnTranslationXAnimation.fillMode = fillMode
		loginbtnTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["loginbtn"]?.layer.addAnimation(loginbtnTranslationXAnimation, forKey:"loadanimation_TranslationX")

		let loginbtnTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		loginbtnTranslationYAnimation.duration = 2.000
		loginbtnTranslationYAnimation.values = [322.168 as Float, 322.168 as Float]
		loginbtnTranslationYAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		loginbtnTranslationYAnimation.timingFunctions = [linearTiming]
		loginbtnTranslationYAnimation.beginTime = beginTime
		loginbtnTranslationYAnimation.fillMode = fillMode
		loginbtnTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["loginbtn"]?.layer.addAnimation(loginbtnTranslationYAnimation, forKey:"loadanimation_TranslationY")
	}

	func removeLoadanimationAnimation() {
		self.layer.removeAnimationForKey("Loadanimation")
		self.viewsByName["signupbtn"]?.layer.removeAnimationForKey("loadanimation_TranslationX")
		self.viewsByName["signupbtn"]?.layer.removeAnimationForKey("loadanimation_TranslationY")
		self.viewsByName["whitepolygon 2"]?.layer.removeAnimationForKey("loadanimation_Rotation")
		self.viewsByName["whitepolygon 2"]?.layer.removeAnimationForKey("loadanimation_TranslationX")
		self.viewsByName["whitepolygon 2"]?.layer.removeAnimationForKey("loadanimation_TranslationY")
		self.viewsByName["ridemelogo"]?.layer.removeAnimationForKey("loadanimation_ScaleX")
		self.viewsByName["ridemelogo"]?.layer.removeAnimationForKey("loadanimation_ScaleY")
		self.viewsByName["ridemelogo"]?.layer.removeAnimationForKey("loadanimation_TranslationX")
		self.viewsByName["ridemelogo"]?.layer.removeAnimationForKey("loadanimation_TranslationY")
		self.viewsByName["rod"]?.layer.removeAnimationForKey("loadanimation_TranslationX")
		self.viewsByName["rod"]?.layer.removeAnimationForKey("loadanimation_TranslationY")
		self.viewsByName["whitepolygon"]?.layer.removeAnimationForKey("loadanimation_Rotation")
		self.viewsByName["whitepolygon"]?.layer.removeAnimationForKey("loadanimation_TranslationX")
		self.viewsByName["whitepolygon"]?.layer.removeAnimationForKey("loadanimation_TranslationY")
		self.viewsByName["roadsign"]?.layer.removeAnimationForKey("loadanimation_Rotation")
		self.viewsByName["roadsign"]?.layer.removeAnimationForKey("loadanimation_TranslationX")
		self.viewsByName["roadsign"]?.layer.removeAnimationForKey("loadanimation_TranslationY")
		self.viewsByName["loginbtn"]?.layer.removeAnimationForKey("loadanimation_TranslationX")
		self.viewsByName["loginbtn"]?.layer.removeAnimationForKey("loadanimation_TranslationY")
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
		self.layer.removeAnimationForKey("Loadanimation")
	}

	func actionSignupbtnPressed(signupbtn: UIButton) {
		mainviewViewDelegate?.signupbtnPressed(signupbtn)
	}

	func actionLoginbtnPressed(loginbtn: UIButton) {
		mainviewViewDelegate?.loginbtnPressed(loginbtn)
	}
}