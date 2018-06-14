struct Size {
	/// The human-readable name of the size
	var name: String
	/// Tags are used for grouping various sizes visually by type (e.g. "S", "M", "L" are tagged as letter sizes).
	var tags: Array<FIXME>
	/// The size can be composed from one or more components. For example a size of jeans can be "W29 L32", which means that there are two components:main component (the width), which has code 29 and sizeType normallength component, which has code 32 and type sizeType length
	var components: object
	var sizingSystem: SizingSystem?
}