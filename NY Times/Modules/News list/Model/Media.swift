//
//	Media.swift
//
//	Create by Islam Soliman on 20/3/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Media : NSObject, NSCoding, Mappable{

	var approvedForSyndication : Int?
	var caption : String?
	var copyright : String?
	var mediametadata : [Media-metadata]?
	var subtype : String?
	var type : String?


	class func newInstance(map: Map) -> Mappable?{
		return Media()
	}
	private override init(){}
	required init?(_ map: Map){}

	func mapping(_ map: Map)
	{
		approvedForSyndication <- map["approved_for_syndication"]
		caption <- map["caption"]
		copyright <- map["copyright"]
		mediametadata <- map["media-metadata"]
		subtype <- map["subtype"]
		type <- map["type"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         approvedForSyndication = aDecoder.decodeObject(forKey: "approved_for_syndication") as? Int
         caption = aDecoder.decodeObject(forKey: "caption") as? String
         copyright = aDecoder.decodeObject(forKey: "copyright") as? String
         mediametadata = aDecoder.decodeObjectForKey("media-metadata") as? [Media-metadata]
         subtype = aDecoder.decodeObject(forKey: "subtype") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if approvedForSyndication != nil{
			aCoder.encodeConditionalObject(approvedForSyndication, forKey: "approved_for_syndication")
		}
		if caption != nil{
			aCoder.encodeConditionalObject(caption, forKey: "caption")
		}
		if copyright != nil{
			aCoder.encodeConditionalObject(copyright, forKey: "copyright")
		}
		if mediametadata != nil{
			aCoder.encodeObject(mediametadata, forKey: "media-metadata")
		}
		if subtype != nil{
			aCoder.encodeConditionalObject(subtype, forKey: "subtype")
		}
		if type != nil{
			aCoder.encodeConditionalObject(type, forKey: "type")
		}

	}

}