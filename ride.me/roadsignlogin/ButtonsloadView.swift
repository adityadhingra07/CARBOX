//
// ButtonsloadView.swift

import UIKit

protocol ButtonsloadViewDelegate {
	func logoutPressed(logout: UIButton)
	func helpPressed(help: UIButton)
	func feedbackPressed(feedback: UIButton)
}

@IBDesignable
class ButtonsloadView : UIView {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 768, height: 650))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	var buttonsloadViewDelegate: ButtonsloadViewDelegate?

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
		__scaling__.bounds = CGRect(x:0, y:0, width:768, height:650)
		__scaling__.center = CGPoint(x:384.0, y:325.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let feedback = UIButton.buttonWithType(.Custom) as! UIButton
		feedback.bounds = CGRect(x:0, y:0, width:311.0, height:311.0)
		var imgFeedback: UIImage!
		if let imagePath = bundle.pathForResource("feedback.jpg", ofType:nil) {
			imgFeedback = UIImage(contentsOfFile:imagePath)
		}
		feedback.setImage(imgFeedback, forState:.Normal)
		feedback.contentMode = .Center;
		feedback.layer.position = CGPoint(x:581.366, y:188.366)
		feedback.transform = CGAffineTransformMakeScale(1.21, 1.21)
		feedback.addTarget(self, action:"actionFeedbackPressed:", forControlEvents: .TouchUpInside)
		__scaling__.addSubview(feedback)
		viewsByName["feedback"] = feedback

		let help = UIButton.buttonWithType(.Custom) as! UIButton
		help.bounds = CGRect(x:0, y:0, width:300.0, height:300.0)
		var imgHelp: UIImage!
		if let imagePath = bundle.pathForResource("help.jpg", ofType:nil) {
			imgHelp = UIImage(contentsOfFile:imagePath)
		}
		help.setImage(imgHelp, forState:.Normal)
		help.contentMode = .Center;
		help.layer.position = CGPoint(x:188.177, y:188.177)
		help.transform = CGAffineTransformMakeScale(1.25, 1.25)
		help.addTarget(self, action:"actionHelpPressed:", forControlEvents: .TouchUpInside)
		__scaling__.addSubview(help)
		viewsByName["help"] = help

		let logout = UIButton.buttonWithType(.Custom) as! UIButton
		logout.bounds = CGRect(x:0, y:0, width:1752.0, height:500.0)
		var imgLogout: UIImage!
		if let imagePath = bundle.pathForResource("logout.jpg", ofType:nil) {
			imgLogout = UIImage(contentsOfFile:imagePath)
		}
		logout.setImage(imgLogout, forState:.Normal)
		logout.contentMode = .Center;
		logout.layer.position = CGPoint(x:370.884, y:509.000)
		logout.transform = CGAffineTransformMakeScale(0.50, 0.50)
		logout.addTarget(self, action:"actionLogoutPressed:", forControlEvents: .TouchUpInside)
		__scaling__.addSubview(logout)
		viewsByName["logout"] = logout

		self.viewsByName = viewsByName
	}

	// - MARK: buttonsload

	func addButtonsloadAnimation() {
		addButtonsloadAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addButtonsloadAnimation(completion: ((Bool) -> Void)?) {
		addButtonsloadAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addButtonsloadAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addButtonsloadAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addButtonsloadAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addButtonsloadAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addButtonsloadAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 1.000
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Buttonsload")
			self.animationCompletions[layer.animationForKey("Buttonsload")] = complete
		}

		let helpTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		helpTranslationXAnimation.duration = 1.000
		helpTranslationXAnimation.values = [780.000 as Float, 0.000 as Float]
		helpTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		helpTranslationXAnimation.timingFunctions = [anticOverTiming]
		helpTranslationXAnimation.beginTime = beginTime
		helpTranslationXAnimation.fillMode = fillMode
		helpTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["help"]?.layer.addAnimation(helpTranslationXAnimation, forKey:"buttonsload_TranslationX")

		let logoutTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		logoutTranslationYAnimation.duration = 1.000
		logoutTranslationYAnimation.values = [-650.000 as Float, 0.000 as Float]
		logoutTranslationYAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		logoutTranslationYAnimation.timingFunctions = [anticOverTiming]
		logoutTranslationYAnimation.beginTime = beginTime
		logoutTranslationYAnimation.fillMode = fillMode
		logoutTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["logout"]?.layer.addAnimation(logoutTranslationYAnimation, forKey:"buttonsload_TranslationY")

		let feedbackTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		feedbackTranslationXAnimation.duration = 1.000
		feedbackTranslationXAnimation.values = [-780.000 as Float, 0.000 as Float]
		feedbackTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		feedbackTranslationXAnimation.timingFunctions = [anticOverTiming]
		feedbackTranslationXAnimation.beginTime = beginTime
		feedbackTranslationXAnimation.fillMode = fillMode
		feedbackTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["feedback"]?.layer.addAnimation(feedbackTranslationXAnimation, forKey:"buttonsload_TranslationX")
	}

	func removeButtonsloadAnimation() {
		self.layer.removeAnimationForKey("Buttonsload")
		self.viewsByName["help"]?.layer.removeAnimationForKey("buttonsload_TranslationX")
		self.viewsByName["logout"]?.layer.removeAnimationForKey("buttonsload_TranslationY")
		self.viewsByName["feedback"]?.layer.removeAnimationForKey("buttonsload_TranslationX")
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
		self.layer.removeAnimationForKey("Buttonsload")
	}

	func actionFeedbackPressed(feedback: UIButton) {
		buttonsloadViewDelegate?.feedbackPressed(feedback)
	}

	func actionHelpPressed(help: UIButton) {
		buttonsloadViewDelegate?.helpPressed(help)
	}

	func actionLogoutPressed(logout: UIButton) {
		buttonsloadViewDelegate?.logoutPressed(logout)
	}
}