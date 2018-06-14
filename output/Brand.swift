/// Represents the brand of a product or brand of a purchase or a reference brand. It may contain brand nickname and optionally various aliases.
struct Brand {
	/// Full name of the brand
	var name: String
	/// Alternative name of the brand
	var nickname: String?
	/// Array of possible brand aliases
	var aliases: Array<FIXME>?
	var rank: Int?
}