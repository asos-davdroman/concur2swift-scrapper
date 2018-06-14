/// The additional shop configuration for a particular Product. Contains various client-specific flags and settings. Mostly for configuring and customizing various aspects of the user interface.
struct Shop {
	/// The prefix that will be used and is expected in Product ID's for products that belong to this shop.
	var prefix: String
}