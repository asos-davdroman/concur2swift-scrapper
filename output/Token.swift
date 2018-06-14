/// The internal authentication token.
struct Token {
	/// ID of the shop, for which the token is created. Always required.
	var shopId: String
	/// User ID of the current logged-in user. Preferably an ID that's safe for external use (e.g. hashed value or GUID).
	var shopUserId: String?
	/// Signature token for the shop user's ID, if required for this shop.
	var shopUserSignature: String?
	/// ID of the current shop user's session. Can be used instead user ID for anonymous users.
	var shopSessionId: String?
	/// Signature token for the shop user's session ID, if required for this shop.
	var shopSessionSignature: String?
	/// When set to true, the API will use (and accept) browser cookies for establishing the user session.
	var useCookieSession: Bool?
}