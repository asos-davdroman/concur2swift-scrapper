/// Represents a single user profile. Contains various attributes about the user that are used to provide a recommendation. Some attributes may be required required provide a recommendation for a Products with certain garment category.
/// Those attributes that may be (or must be) different for each garment category are prefixed with the category prefix (e.g. lowerExplicitPreference and upperExplicitPreference).
/// A user can have several profiles with the same gender and one (and only one) of them can be marked primary for that gender through isPrimary field.
struct Profile {
	/// (readonly) Gender of this profile. Can be set only when creating a new profile.
	var gender: String
	/// When true, this user profile is the primary profile for the current user. The value is exclusive per gender - once you set it on one profile, it will unset for all profiles with the same gender
	var isPrimary: Bool
	/// (deprecated) The last locale that was used with the widget
	var locale: String?
	/// Enable immediate recommendation. User-configurable setting that enables or disables automatic recommendation on product detail pages.
	var enableIR: Bool?
	/// User height in centimeters
	var height: Decimal?
	/// User weight in kilograms
	var weight: Decimal?
	/// Preferred display units for height
	var heightDisplayUnits: String?
	/// Preferred display units for weight
	var weightDisplayUnits: String?
	/// User's age as the number of years
	var age: Decimal?
	/// Preferred fit for upper-body garments; negative values mean tighter fit, positive values mean looser fit, zero means normal fit (default).
	var upperExplicitPreference: Decimal?
	/// (for upper-body garment) In certain cases the selected reference brand/size may fall well outside range expected based on current height/weight/etc values. In that case the user can choose to ignore these values and use only reference brand and size for the recommendation.
	var upperUseOnlyBC: Bool?
	/// Preferred fit for lower-body garments; negative values mean tighter fit, positive values mean looser fit, zero means normal fit (default).
	var lowerExplicitPreference: Decimal?
	/// In certain cases the reference size for the lower garment may contain both width and length components. The user may choose to skip the length component selection, which means that this flag will be set to true and the length component of the selected size will be ignored, when making a recommendation.
	var lowerSizeLengthUnknown: Bool?
	var lowerWaistbandFit: String?
	/// (for lower-body garment) In certain cases the selected reference brand/size may fall well outside range expected based on current height/weight/etc values. In that case the user can choose to ignore these values and use only reference brand and size for the recommendation.
	var lowerUseOnlyBC: Bool?
	var shoesWidth: Decimal?
	/// The selected body-shape
	var bodyShape: BodyShape?
	/// The selected bra size
	var braSize: Size?
	/// The selected reference brand for upper-body garments
	var upperReferenceBrand: Brand?
	/// The selected reference style for upper-body garments
	var upperReferenceStyle: Style?
	/// The selected reference size for upper-body garments
	var upperReferenceSize: Size?
	/// The selected reference brand for lower-body garments
	var lowerReferenceBrand: Brand?
	/// The selected reference style for lower-body garments
	var lowerReferenceStyle: Style?
	/// The selected reference size for lower-body garments
	var lowerReferenceSize: Size?
	/// The selected reference brand for shoes garments
	var shoesReferenceBrand: Brand?
	/// The selected reference style for shoes garments
	var shoesReferenceStyle: Style?
	/// The selected reference size for shoes garments
	var shoesReferenceSize: Size?
	/// Array of purchase references that should be excluded from recommendations based on user's past purchases
	var excludedPurchases: Purchase?
	/// (read-only) Array of purchase references that may be used for recommendations based on user's past purchases (except those that are listed in `excludedPurchases` array)
	var purchases: Purchase?
}