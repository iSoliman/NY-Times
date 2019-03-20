//
//	Result.swift
//
//	Create by Islam Soliman on 20/3/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Result : NSObject, NSCoding, Mappable{

	var abstractField : String?
	var adxKeywords : String?
	var assetId : Int?
	var byline : String?
	var column : String?
	var desFacet : [String]?
	var geoFacet : String?
	var id : Int?
	var media : [Media]?
	var orgFacet : [String]?
	var perFacet : [String]?
	var publishedDate : String?
	var section : String?
	var source : String?
	var title : String?
	var type : String?
	var uri : String?
	var url : String?
	var views : Int?


	class func newInstance(map: Map) -> Mappable?{
		return Result()
	}
	private override init(){}
	required init?(_ map: Map){}

	func mapping(_ map: Map)
	{
		abstractField <- map["abstract"]
		adxKeywords <- map["adx_keywords"]
		assetId <- map["asset_id"]
		byline <- map["byline"]
		column <- map["column"]
		desFacet <- map["des_facet"]
		geoFacet <- map["geo_facet"]
		id <- map["id"]
		media <- map["media"]
		orgFacet <- map["org_facet"]
		perFacet <- map["per_facet"]
		publishedDate <- map["published_date"]
		section <- map["section"]
		source <- map["source"]
		title <- map["title"]
		type <- map["type"]
		uri <- map["uri"]
		url <- map["url"]
		views <- map["views"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         abstractField = aDecoder.decodeObject(forKey: "abstract") as? String
         adxKeywords = aDecoder.decodeObject(forKey: "adx_keywords") as? String
         assetId = aDecoder.decodeObject(forKey: "asset_id") as? Int
         byline = aDecoder.decodeObject(forKey: "byline") as? String
         column = aDecoder.decodeObject(forKey: "column") as? String
         desFacet = aDecoder.decodeObject(forKey: "des_facet") as? [String]
         geoFacet = aDecoder.decodeObject(forKey: "geo_facet") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         media = aDecoder.decodeObjectForKey("media") as? [Media]
         orgFacet = aDecoder.decodeObject(forKey: "org_facet") as? [String]
         perFacet = aDecoder.decodeObject(forKey: "per_facet") as? [String]
         publishedDate = aDecoder.decodeObject(forKey: "published_date") as? String
         section = aDecoder.decodeObject(forKey: "section") as? String
         source = aDecoder.decodeObject(forKey: "source") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         uri = aDecoder.decodeObject(forKey: "uri") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         views = aDecoder.decodeObject(forKey: "views") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if abstractField != nil{
			aCoder.encodeConditionalObject(abstractField, forKey: "abstract")
		}
		if adxKeywords != nil{
			aCoder.encodeConditionalObject(adxKeywords, forKey: "adx_keywords")
		}
		if assetId != nil{
			aCoder.encodeConditionalObject(assetId, forKey: "asset_id")
		}
		if byline != nil{
			aCoder.encodeConditionalObject(byline, forKey: "byline")
		}
		if column != nil{
			aCoder.encodeConditionalObject(column, forKey: "column")
		}
		if desFacet != nil{
			aCoder.encodeConditionalObject(desFacet, forKey: "des_facet")
		}
		if geoFacet != nil{
			aCoder.encodeConditionalObject(geoFacet, forKey: "geo_facet")
		}
		if id != nil{
			aCoder.encodeConditionalObject(id, forKey: "id")
		}
		if media != nil{
			aCoder.encodeObject(media, forKey: "media")
		}
		if orgFacet != nil{
			aCoder.encodeConditionalObject(orgFacet, forKey: "org_facet")
		}
		if perFacet != nil{
			aCoder.encodeConditionalObject(perFacet, forKey: "per_facet")
		}
		if publishedDate != nil{
			aCoder.encodeConditionalObject(publishedDate, forKey: "published_date")
		}
		if section != nil{
			aCoder.encodeConditionalObject(section, forKey: "section")
		}
		if source != nil{
			aCoder.encodeConditionalObject(source, forKey: "source")
		}
		if title != nil{
			aCoder.encodeConditionalObject(title, forKey: "title")
		}
		if type != nil{
			aCoder.encodeConditionalObject(type, forKey: "type")
		}
		if uri != nil{
			aCoder.encodeConditionalObject(uri, forKey: "uri")
		}
		if url != nil{
			aCoder.encodeConditionalObject(url, forKey: "url")
		}
		if views != nil{
			aCoder.encodeConditionalObject(views, forKey: "views")
		}

	}

}