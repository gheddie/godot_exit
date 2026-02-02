class_name CollectableCash
extends Object

var collectables : Dictionary[String, int] = {}

func acceptCollectables(collectable: BaseCollectable, amount: int) -> void:
	if collectables.has(collectable.getDescriptor()):
		increaseAmount(collectable, amount)
	else:
		collectables.set(collectable.getDescriptor(), amount)

func increaseAmount(collectable: BaseCollectable, amount: int) -> void:
	var oldAmount = collectables.get(collectable.getDescriptor())
	collectables.set(collectable.getDescriptor(), oldAmount + amount)

func debug() -> void:
	print("=============================================")
	for key in collectables:
		print(str(key, "::", collectables[key]))
	print("=============================================")

func getTotalAmount() -> int:
	var sum: int = 0
	for key in collectables:
		sum += collectables[key]
	return sum
