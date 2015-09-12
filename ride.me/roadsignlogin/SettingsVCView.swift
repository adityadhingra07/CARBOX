//
// SettingsVCView.swift


import UIKit

@IBDesignable
class SettingsVCView : UIView {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 768, height: 500))
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
		__scaling__.bounds = CGRect(x:0, y:0, width:768, height:500)
		__scaling__.center = CGPoint(x:384.0, y:250.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let emailsetting = UIImageView()
		emailsetting.bounds = CGRect(x:0, y:0, width:333.0, height:99.0)
		var imgEmailsetting: UIImage!
		if let imagePath = bundle.pathForResource("emailsetting.png", ofType:nil) {
			imgEmailsetting = UIImage(contentsOfFile:imagePath)
		}
		emailsetting.image = imgEmailsetting
		emailsetting.contentMode = .Center;
		emailsetting.layer.position = CGPoint(x:384.000, y:250.000)
		emailsetting.transform = CGAffineTransformMakeScale(1.50, 1.50)
		__scaling__.addSubview(emailsetting)
		viewsByName["emailsetting"] = emailsetting

		let phonesetting = UIImageView()
		phonesetting.bounds = CGRect(x:0, y:0, width:333.0, height:99.0)
		var imgPhonesetting: UIImage!
		if let imagePath = bundle.pathForResource("phonesetting.png", ofType:nil) {
			imgPhonesetting = UIImage(contentsOfFile:imagePath)
		}
		phonesetting.image = imgPhonesetting
		phonesetting.contentMode = .Center;
		phonesetting.layer.position = CGPoint(x:384.000, y:402.787)
		phonesetting.transform = CGAffineTransformMakeScale(1.50, 1.50)
		__scaling__.addSubview(phonesetting)
		viewsByName["phonesetting"] = phonesetting

		let usernamesetting = UIImageView()
		usernamesetting.bounds = CGRect(x:0, y:0, width:333.0, height:99.0)
		var imgUsernamesetting: UIImage!
		if let imagePath = bundle.pathForResource("usernamesetting.png", ofType:nil) {
			imgUsernamesetting = UIImage(contentsOfFile:imagePath)
		}
		usernamesetting.image = imgUsernamesetting
		usernamesetting.contentMode = .Center;
		usernamesetting.layer.position = CGPoint(x:384.000, y:96.641)
		usernamesetting.transform = CGAffineTransformMakeScale(1.50, 1.50)
		__scaling__.addSubview(usernamesetting)
		viewsByName["usernamesetting"] = usernamesetting

		self.viewsByName = viewsByName
	}

	// - MARK: loadsettings

	func addLoadsettingsAnimation() {
		addLoadsettingsAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addLoadsettingsAnimation(completion: ((Bool) -> Void)?) {
		addLoadsettingsAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addLoadsettingsAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addLoadsettingsAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addLoadsettingsAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addLoadsettingsAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addLoadsettingsAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 0.750
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Loadsettings")
			self.animationCompletions[layer.animationForKey("Loadsettings")] = complete
		}

		let emailsettingTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		emailsettingTranslationXAnimation.duration = 0.750
		emailsettingTranslationXAnimation.values = [-650.000 as Float, -650.000 as Float, 0.000 as Float, 0.000 as Float]
		emailsettingTranslationXAnimation.keyTimes = [0.000 as Float, 0.333 as Float, 0.667 as Float, 1.000 as Float]
		emailsettingTranslationXAnimation.timingFunctions = [linearTiming, anticOverTiming, linearTiming]
		emailsettingTranslationXAnimation.beginTime = beginTime
		emailsettingTranslationXAnimation.fillMode = fillMode
		emailsettingTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["emailsetting"]?.layer.addAnimation(emailsettingTranslationXAnimation, forKey:"loadsettings_TranslationX")

		let usernamesettingTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		usernamesettingTranslationXAnimation.duration = 0.750
		usernamesettingTranslationXAnimation.values = [-650.000 as Float, 0.000 as Float, 0.000 as Float]
		usernamesettingTranslationXAnimation.keyTimes = [0.000 as Float, 0.333 as Float, 1.000 as Float]
		usernamesettingTranslationXAnimation.timingFunctions = [anticOverTiming, linearTiming]
		usernamesettingTranslationXAnimation.beginTime = beginTime
		usernamesettingTranslationXAnimation.fillMode = fillMode
		usernamesettingTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["usernamesetting"]?.layer.addAnimation(usernamesettingTranslationXAnimation, forKey:"loadsettings_TranslationX")

		let phonesettingTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		phonesettingTranslationXAnimation.duration = 0.750
		phonesettingTranslationXAnimation.values = [-650.000 as Float, -650.000 as Float, -650.000 as Float, 0.000 as Float]
		phonesettingTranslationXAnimation.keyTimes = [0.000 as Float, 0.333 as Float, 0.667 as Float, 1.000 as Float]
		phonesettingTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, anticOverTiming]
		phonesettingTranslationXAnimation.beginTime = beginTime
		phonesettingTranslationXAnimation.fillMode = fillMode
		phonesettingTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["phonesetting"]?.layer.addAnimation(phonesettingTranslationXAnimation, forKey:"loadsettings_TranslationX")
	}

	func removeLoadsettingsAnimation() {
		self.layer.removeAnimationForKey("Loadsettings")
		self.viewsByName["emailsetting"]?.layer.removeAnimationForKey("loadsettings_TranslationX")
		self.viewsByName["usernamesetting"]?.layer.removeAnimationForKey("loadsettings_TranslationX")
		self.viewsByName["phonesetting"]?.layer.removeAnimationForKey("loadsettings_TranslationX")
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
		self.layer.removeAnimationForKey("Loadsettings")
	}
}