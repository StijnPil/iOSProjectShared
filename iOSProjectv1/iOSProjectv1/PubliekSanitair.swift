import Foundation


class PubliekSanitair
{

    let type_sanit: String
    
    init(type_sanit: String){
        self.type_sanit = type_sanit
    }
}



extension PubliekSanitair
{
    convenience init(json: NSDictionary) throws {
        guard let document = json["Document"] as? NSDictionary else{
            throw Service.Error.MissingJsonProperty(name: "Document")
        }
        guard let folder = document["Folder"] as? NSDictionary else{
            throw Service.Error.MissingJsonProperty(name: "Folder")
        }
        guard let placemark = folder["Placemark"] as? NSDictionary else{
            throw Service.Error.MissingJsonProperty(name: "Placemark")
        }
        
        guard let extendedData = placemark["ExtendedData"] as? NSDictionary else{
            throw Service.Error.MissingJsonProperty(name: "Placemark")
        }
        guard let schemaData = extendedData["SchemaData"] as? NSDictionary else{
            throw Service.Error.MissingJsonProperty(name: "Placemark")
        }
        guard let simpleData = schemaData["SimpleData"] as? NSDictionary else{
            throw Service.Error.MissingJsonProperty(name: "Placemark")
        }
        
        guard let type_sanit = simpleData[0]!["@text"] as? String else{
            throw Service.Error.MissingJsonProperty(name: "@text in type_sanit")
        }
        
        self.init(type_sanit: type_sanit)
          }
}