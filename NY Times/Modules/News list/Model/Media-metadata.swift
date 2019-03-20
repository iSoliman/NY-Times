//
//	Media-metadata.swift
//
//	Create by Islam Soliman on 20/3/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Media-metadata : NSObject, NSCoding, Mappable{

	var format : String?
	var height : Int?
	var url : String?
	var width : Int?


	class func newInstance(map: Map) -> Mappable?{
		return Media-metadata()
	}
	private override init(){}
	required init?(_ map: Map){}

	func mapping(_ map: Map)
	{
		format <- map["format"]
		height <- map["height"]
		url <- map["url"]
		width <- map["width"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         format = aDecoder.decodeObject(forKey: "format") as? String
         height = aDecoder.decodeObject(forKey: "height") as? Int
         url = aDecoder.decodeObject(forKey: "url") as? String
         width = aDecoder.decodeObject(forKey: "width") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if format != nil{
			aCoder.encodeConditionalObject(format, forKey: "format")
		}
		if height != nil{
			aCoder.encodeConditionalObject(height, forKey: "height")
		}
		if url != nil{
			aCoder.encodeConditionalObject(url, forKey: "url")
		}
		if width != nil{
			aCoder.encodeConditionalObject(width, forKey: "width")
		}

	}

}