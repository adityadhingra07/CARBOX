//BOOT ANIMATION

import UIKit

@IBDesignable
class BootView : UIView {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

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
		__scaling__.bounds = CGRect(x:0, y:0, width:375, height:667)
		__scaling__.center = CGPoint(x:187.5, y:333.5)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let b1 = UIImageView()
		b1.bounds = CGRect(x:0, y:0, width:103.0, height:103.0)
		var imgB1: UIImage!
		if let imagePath = bundle.pathForResource("b1.png", ofType:nil) {
			imgB1 = UIImage(contentsOfFile:imagePath)
		}
		b1.image = imgB1
		b1.contentMode = .Center;
		b1.layer.position = CGPoint(x:247.000, y:380.000)
		b1.transform = CGAffineTransformMakeScale(0.30, 0.30)
		__scaling__.addSubview(b1)
		viewsByName["b1"] = b1

		let b2 = UIImageView()
		b2.bounds = CGRect(x:0, y:0, width:103.0, height:103.0)
		var imgB2: UIImage!
		if let imagePath = bundle.pathForResource("b2.png", ofType:nil) {
			imgB2 = UIImage(contentsOfFile:imagePath)
		}
		b2.image = imgB2
		b2.contentMode = .Center;
		b2.layer.position = CGPoint(x:207.000, y:380.000)
		b2.transform = CGAffineTransformMakeScale(0.30, 0.30)
		__scaling__.addSubview(b2)
		viewsByName["b2"] = b2

		let cARBOX = UIImageView()
		cARBOX.bounds = CGRect(x:0, y:0, width:1074.0, height:217.0)
		var imgCARBOX: UIImage!
		if let imagePath = bundle.pathForResource("CARBOX.png", ofType:nil) {
			imgCARBOX = UIImage(contentsOfFile:imagePath)
		}
		cARBOX.image = imgCARBOX
		cARBOX.contentMode = .Center;
		cARBOX.layer.position = CGPoint(x:187.500, y:274.029)
		cARBOX.transform = CGAffineTransformMakeScale(0.30, 0.30)
		__scaling__.addSubview(cARBOX)
		viewsByName["CARBOX"] = cARBOX

		let line = UIImageView()
		line.bounds = CGRect(x:0, y:0, width:1239.0, height:10.0)
		var imgLine: UIImage!
		if let imagePath = bundle.pathForResource("Line.png", ofType:nil) {
			imgLine = UIImage(contentsOfFile:imagePath)
		}
		line.image = imgLine
		line.contentMode = .Center;
		line.layer.position = CGPoint(x:187.500, y:334.900)
		line.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(0.00), 0.26, 0.26)
		__scaling__.addSubview(line)
		viewsByName["Line"] = line

		let r1 = UIImageView()
		r1.bounds = CGRect(x:0, y:0, width:103.0, height:103.0)
		var imgR1: UIImage!
		if let imagePath = bundle.pathForResource("r1.png", ofType:nil) {
			imgR1 = UIImage(contentsOfFile:imagePath)
		}
		r1.image = imgR1
		r1.contentMode = .Center;
		r1.layer.position = CGPoint(x:167.000, y:380.000)
		r1.transform = CGAffineTransformMakeScale(0.30, 0.30)
		__scaling__.addSubview(r1)
		viewsByName["r1"] = r1

		let r2 = UIImageView()
		r2.bounds = CGRect(x:0, y:0, width:103.0, height:103.0)
		var imgR2: UIImage!
		if let imagePath = bundle.pathForResource("r2.png", ofType:nil) {
			imgR2 = UIImage(contentsOfFile:imagePath)
		}
		r2.image = imgR2
		r2.contentMode = .Center;
		r2.layer.position = CGPoint(x:127.000, y:380.000)
		r2.transform = CGAffineTransformMakeScale(0.30, 0.30)
		__scaling__.addSubview(r2)
		viewsByName["r2"] = r2

		self.viewsByName = viewsByName
	}

	// - MARK: boot

	func addBootAnimation() {
		addBootAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addBootAnimation(completion: ((Bool) -> Void)?) {
		addBootAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addBootAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addBootAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addBootAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addBootAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addBootAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 4.250
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Boot")
			self.animationCompletions[layer.animationForKey("Boot")] = complete
		}

		let r2TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		r2TranslationXAnimation.duration = 4.250
		r2TranslationXAnimation.values = [0.000 as Float, -20.000 as Float, -190.000 as Float, -190.000 as Float, 0.000 as Float]
		r2TranslationXAnimation.keyTimes = [0.000 as Float, 0.824 as Float, 0.882 as Float, 0.941 as Float, 1.000 as Float]
		r2TranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, anticOverTiming]
		r2TranslationXAnimation.beginTime = beginTime
		r2TranslationXAnimation.fillMode = fillMode
		r2TranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["r2"]?.layer.addAnimation(r2TranslationXAnimation, forKey:"boot_TranslationX")

		let r2TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		r2TranslationYAnimation.duration = 4.250
		r2TranslationYAnimation.values = [-400.000 as Float, 0.000 as Float, -10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 0.000 as Float, 0.000 as Float, -10.000 as Float, -10.000 as Float, 0.000 as Float]
		r2TranslationYAnimation.keyTimes = [0.000 as Float, 0.059 as Float, 0.118 as Float, 0.176 as Float, 0.235 as Float, 0.294 as Float, 0.353 as Float, 0.412 as Float, 0.471 as Float, 0.529 as Float, 0.588 as Float, 0.647 as Float, 0.706 as Float, 0.765 as Float, 0.824 as Float, 0.941 as Float, 1.000 as Float]
		r2TranslationYAnimation.timingFunctions = [anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, linearTiming, linearTiming, linearTiming, linearTiming, anticOverTiming]
		r2TranslationYAnimation.beginTime = beginTime
		r2TranslationYAnimation.fillMode = fillMode
		r2TranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["r2"]?.layer.addAnimation(r2TranslationYAnimation, forKey:"boot_TranslationY")

		let b2TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		b2TranslationXAnimation.duration = 4.250
		b2TranslationXAnimation.values = [0.000 as Float, 20.000 as Float, 190.000 as Float, 190.000 as Float, 0.000 as Float]
		b2TranslationXAnimation.keyTimes = [0.000 as Float, 0.824 as Float, 0.882 as Float, 0.941 as Float, 1.000 as Float]
		b2TranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, anticOverTiming]
		b2TranslationXAnimation.beginTime = beginTime
		b2TranslationXAnimation.fillMode = fillMode
		b2TranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["b2"]?.layer.addAnimation(b2TranslationXAnimation, forKey:"boot_TranslationX")

		let b2TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		b2TranslationYAnimation.duration = 4.250
		b2TranslationYAnimation.values = [-400.000 as Float, -400.000 as Float, -400.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 0.000 as Float, 0.000 as Float, 10.000 as Float, 10.000 as Float, 0.000 as Float]
		b2TranslationYAnimation.keyTimes = [0.000 as Float, 0.059 as Float, 0.118 as Float, 0.176 as Float, 0.235 as Float, 0.294 as Float, 0.353 as Float, 0.412 as Float, 0.471 as Float, 0.529 as Float, 0.588 as Float, 0.647 as Float, 0.706 as Float, 0.765 as Float, 0.824 as Float, 0.941 as Float, 1.000 as Float]
		b2TranslationYAnimation.timingFunctions = [linearTiming, linearTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, linearTiming, linearTiming, linearTiming, linearTiming, anticOverTiming]
		b2TranslationYAnimation.beginTime = beginTime
		b2TranslationYAnimation.fillMode = fillMode
		b2TranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["b2"]?.layer.addAnimation(b2TranslationYAnimation, forKey:"boot_TranslationY")

		let cARBOXOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		cARBOXOpacityAnimation.duration = 4.250
		cARBOXOpacityAnimation.values = [0.000 as Float, 0.000 as Float, 1.000 as Float, 1.000 as Float]
		cARBOXOpacityAnimation.keyTimes = [0.000 as Float, 0.882 as Float, 0.941 as Float, 1.000 as Float]
		cARBOXOpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		cARBOXOpacityAnimation.beginTime = beginTime
		cARBOXOpacityAnimation.fillMode = fillMode
		cARBOXOpacityAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["CARBOX"]?.layer.addAnimation(cARBOXOpacityAnimation, forKey:"boot_Opacity")

		let r1TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		r1TranslationXAnimation.duration = 4.250
		r1TranslationXAnimation.values = [0.000 as Float, -20.000 as Float, -190.000 as Float, -190.000 as Float, 0.000 as Float]
		r1TranslationXAnimation.keyTimes = [0.000 as Float, 0.824 as Float, 0.882 as Float, 0.941 as Float, 1.000 as Float]
		r1TranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, anticOverTiming]
		r1TranslationXAnimation.beginTime = beginTime
		r1TranslationXAnimation.fillMode = fillMode
		r1TranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["r1"]?.layer.addAnimation(r1TranslationXAnimation, forKey:"boot_TranslationX")

		let r1TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		r1TranslationYAnimation.duration = 4.250
		r1TranslationYAnimation.values = [-400.000 as Float, -400.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 0.000 as Float, -10.000 as Float, -10.000 as Float, 0.000 as Float]
		r1TranslationYAnimation.keyTimes = [0.000 as Float, 0.059 as Float, 0.118 as Float, 0.176 as Float, 0.235 as Float, 0.294 as Float, 0.353 as Float, 0.412 as Float, 0.471 as Float, 0.529 as Float, 0.588 as Float, 0.647 as Float, 0.706 as Float, 0.765 as Float, 0.824 as Float, 0.941 as Float, 1.000 as Float]
		r1TranslationYAnimation.timingFunctions = [linearTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, linearTiming, linearTiming, linearTiming, anticOverTiming]
		r1TranslationYAnimation.beginTime = beginTime
		r1TranslationYAnimation.fillMode = fillMode
		r1TranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["r1"]?.layer.addAnimation(r1TranslationYAnimation, forKey:"boot_TranslationY")

		let lineRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		lineRotationAnimation.duration = 4.250
		lineRotationAnimation.values = [1.571 as Float, 1.571 as Float, 1.571 as Float, 2.356 as Float, 3.142 as Float, 3.142 as Float]
		lineRotationAnimation.keyTimes = [0.000 as Float, 0.706 as Float, 0.765 as Float, 0.824 as Float, 0.882 as Float, 1.000 as Float]
		lineRotationAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		lineRotationAnimation.beginTime = beginTime
		lineRotationAnimation.fillMode = fillMode
		lineRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Line"]?.layer.addAnimation(lineRotationAnimation, forKey:"boot_Rotation")

		let lineScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		lineScaleXAnimation.duration = 4.250
		lineScaleXAnimation.values = [0.076 as Float, 0.076 as Float, 0.076 as Float, 0.150 as Float, 0.250 as Float, 0.250 as Float]
		lineScaleXAnimation.keyTimes = [0.000 as Float, 0.706 as Float, 0.765 as Float, 0.824 as Float, 0.882 as Float, 1.000 as Float]
		lineScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		lineScaleXAnimation.beginTime = beginTime
		lineScaleXAnimation.fillMode = fillMode
		lineScaleXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Line"]?.layer.addAnimation(lineScaleXAnimation, forKey:"boot_ScaleX")

		let lineScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		lineScaleYAnimation.duration = 4.250
		lineScaleYAnimation.values = [0.076 as Float, 0.076 as Float, 0.076 as Float, 0.150 as Float, 0.250 as Float, 0.250 as Float]
		lineScaleYAnimation.keyTimes = [0.000 as Float, 0.706 as Float, 0.765 as Float, 0.824 as Float, 0.882 as Float, 1.000 as Float]
		lineScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		lineScaleYAnimation.beginTime = beginTime
		lineScaleYAnimation.fillMode = fillMode
		lineScaleYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Line"]?.layer.addAnimation(lineScaleYAnimation, forKey:"boot_ScaleY")

		let lineTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		lineTranslationXAnimation.duration = 4.250
		lineTranslationXAnimation.values = [0.000 as Float, 0.000 as Float, 0.000 as Float]
		lineTranslationXAnimation.keyTimes = [0.000 as Float, 0.706 as Float, 1.000 as Float]
		lineTranslationXAnimation.timingFunctions = [linearTiming, linearTiming]
		lineTranslationXAnimation.beginTime = beginTime
		lineTranslationXAnimation.fillMode = fillMode
		lineTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Line"]?.layer.addAnimation(lineTranslationXAnimation, forKey:"boot_TranslationX")

		let lineTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		lineTranslationYAnimation.duration = 4.250
		lineTranslationYAnimation.values = [-391.604 as Float, -391.604 as Float, 38.396 as Float, 0.000 as Float]
		lineTranslationYAnimation.keyTimes = [0.000 as Float, 0.706 as Float, 0.765 as Float, 1.000 as Float]
		lineTranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		lineTranslationYAnimation.beginTime = beginTime
		lineTranslationYAnimation.fillMode = fillMode
		lineTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Line"]?.layer.addAnimation(lineTranslationYAnimation, forKey:"boot_TranslationY")

		let b1TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		b1TranslationXAnimation.duration = 4.250
		b1TranslationXAnimation.values = [0.000 as Float, 20.000 as Float, 190.000 as Float, 190.000 as Float, 0.000 as Float]
		b1TranslationXAnimation.keyTimes = [0.000 as Float, 0.824 as Float, 0.882 as Float, 0.941 as Float, 1.000 as Float]
		b1TranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, anticOverTiming]
		b1TranslationXAnimation.beginTime = beginTime
		b1TranslationXAnimation.fillMode = fillMode
		b1TranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["b1"]?.layer.addAnimation(b1TranslationXAnimation, forKey:"boot_TranslationX")

		let b1TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		b1TranslationYAnimation.duration = 4.250
		b1TranslationYAnimation.values = [-400.000 as Float, -400.000 as Float, -400.000 as Float, -400.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 10.000 as Float, 0.000 as Float, 0.000 as Float, 10.000 as Float, 10.000 as Float, 0.000 as Float]
		b1TranslationYAnimation.keyTimes = [0.000 as Float, 0.059 as Float, 0.118 as Float, 0.176 as Float, 0.235 as Float, 0.294 as Float, 0.353 as Float, 0.412 as Float, 0.471 as Float, 0.529 as Float, 0.588 as Float, 0.647 as Float, 0.706 as Float, 0.765 as Float, 0.824 as Float, 0.941 as Float, 1.000 as Float]
		b1TranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, linearTiming, linearTiming, linearTiming, anticOverTiming]
		b1TranslationYAnimation.beginTime = beginTime
		b1TranslationYAnimation.fillMode = fillMode
		b1TranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["b1"]?.layer.addAnimation(b1TranslationYAnimation, forKey:"boot_TranslationY")
	}

	func removeBootAnimation() {
		self.layer.removeAnimationForKey("Boot")
		self.viewsByName["r2"]?.layer.removeAnimationForKey("boot_TranslationX")
		self.viewsByName["r2"]?.layer.removeAnimationForKey("boot_TranslationY")
		self.viewsByName["b2"]?.layer.removeAnimationForKey("boot_TranslationX")
		self.viewsByName["b2"]?.layer.removeAnimationForKey("boot_TranslationY")
		self.viewsByName["CARBOX"]?.layer.removeAnimationForKey("boot_Opacity")
		self.viewsByName["r1"]?.layer.removeAnimationForKey("boot_TranslationX")
		self.viewsByName["r1"]?.layer.removeAnimationForKey("boot_TranslationY")
		self.viewsByName["Line"]?.layer.removeAnimationForKey("boot_Rotation")
		self.viewsByName["Line"]?.layer.removeAnimationForKey("boot_ScaleX")
		self.viewsByName["Line"]?.layer.removeAnimationForKey("boot_ScaleY")
		self.viewsByName["Line"]?.layer.removeAnimationForKey("boot_TranslationX")
		self.viewsByName["Line"]?.layer.removeAnimationForKey("boot_TranslationY")
		self.viewsByName["b1"]?.layer.removeAnimationForKey("boot_TranslationX")
		self.viewsByName["b1"]?.layer.removeAnimationForKey("boot_TranslationY")
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
		self.layer.removeAnimationForKey("Boot")
	}
}