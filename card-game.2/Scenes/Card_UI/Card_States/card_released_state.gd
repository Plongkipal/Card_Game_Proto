extends CardState


func enter() -> void:

	card_ui.color.color = Color.DARK_ORANGE
	card_ui.state_label.text = "RELEASED"

	if card_ui.should_return_to_hand:
		card_ui.return_to_original_position()

	card_ui.scale = Vector2.ONE
	card_ui.z_index = 0

	await get_tree().create_timer(0.05).timeout

	transition_requested.emit(
		self,
		CardState.State.BASE
	)
