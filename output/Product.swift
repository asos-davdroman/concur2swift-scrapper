/// A representation of a garment in our database.
struct Product {
	/// Full product title
	var title: String
	/// Garment category of the product
	var category: String
	/// Gender of the product. Possible values are:m .. menw .. womenu .. unisexb .. boys (kids male)g .. girls (kids female)y .. youth (kids unisex)
	var gender: String
	/// The URL of the product thumbnail. This thumbnail should be only used as fallback, when other means of getting a product thumbnail aren't available (it may have a wrong color etc).
	var thumbnailUrl: String
	/// Brand of the product
	var brand: Brand?
	/// Shop configuration for the product
	var shopConfig: Shop?
	/// Garment type of the product
	var garmentType: GarmentType?
}