/// The representation of possible (supported) body shapes.
/// Each body shape has two image URLs, corresponding to the two steps in the body shape selection process. We first present the user with the set of imageUrl1 images. Once they choose one of those, we present them with the imageURL2 images for body shapes matching his choice.
/// Once an image from the second set has been selected, the ID of the corresponding body-shape object can be assigned as relationship to the Profile object.
struct BodyShape {
	/// The Gender of the body shape. Possible values:m .. menw .. women
	var gender: String
	/// BMI value associated with this body shape
	var bmi: Decimal
	/// Image URL for the 1st step of the body shape selection
	var imageUrl1: String
	/// Image URL for the 2nd step of the body shape selection
	var imageUrl2: String
}