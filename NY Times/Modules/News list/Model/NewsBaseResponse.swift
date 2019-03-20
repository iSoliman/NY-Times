//
//	RootClass.swift
//
//	Create by Islam Soliman on 20/3/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class NewsBaseResponse : NSObject, NSCoding, Mappable{

	var copyright : String?
	var numResults : Int?
	var results : [Result]?
	var status : String?


	class func newInstance(map: Map) -> Mappable?{
		return RootClass()
	}
	private override init(){}
	required init?(_ map: Map){}

	func mapping(_ map: Map)
	{
		copyright <- map["copyright"]
		numResults <- map["num_results"]
		results <- map["results"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         copyright = aDecoder.decodeObject(forKey: "copyright") as? String
         numResults = aDecoder.decodeObject(forKey: "num_results") as? Int
         results = aDecoder.decodeObjectForKey("results") as? [Result]
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if copyright != nil{
			aCoder.encodeConditionalObject(copyright, forKey: "copyright")
		}
		if numResults != nil{
			aCoder.encodeConditionalObject(numResults, forKey: "num_results")
		}
		if results != nil{
			aCoder.encodeObject(results, forKey: "results")
		}
		if status != nil{
			aCoder.encodeConditionalObject(status, forKey: "status")
		}

	}

}
