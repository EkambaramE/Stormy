//
//  Current.swift
//  Stormy

// MARK : Modeling the Current Weather

import Foundation
import UIKit

struct Current {
	
	var currentTime: String?
	var temperature: Int
	var humidity: Int
	var precipProbability: Int
	var summary: String
	
	init(weatherDictionary: NSDictionary) {
		let currentWeather = weatherDictionary["currently"] as! NSDictionary
		
		temperature = currentWeather["temperature"] as! Int
		let humidityFloat = currentWeather["humidity"] as! Double
		humidity = Int(humidityFloat * 100)
		
		let precipFloat = currentWeather["precipProbability"] as! Double
		precipProbability = Int(precipFloat * 100)
		
		summary = currentWeather["summary"] as! String
		
		let currentTimeIntVale = currentWeather["time"] as! Int
		currentTime = dateStringFromUnixTime(currentTimeIntVale)

	}
	
	func dateStringFromUnixTime(unixTime: Int) -> String {
		let timeInSeconds = NSTimeInterval(unixTime)
		let weatherDate = NSDate(timeIntervalSince1970: timeInSeconds)
		
		let dateFormatter = NSDateFormatter()
		dateFormatter.timeStyle = .ShortStyle
		
		return dateFormatter.stringFromDate(weatherDate)
	}
	
}
