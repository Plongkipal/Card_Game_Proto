extends CardState


func enter() -> void:

	card_ui.color.color = Color.NAVY_BLUE
	card_ui.state_label.text = "DRAGGING"

	card_ui.should_return_to_hand = true

	card_ui.z_index = 100


func on_gui_input(event: InputEvent) -> void:

	if event is InputEventMouseMotion:

		card_ui.global_position = (
			card_ui.get_global_mouse_position()
			- card_ui.pivot_offset
		)

	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT:

			if not event.pressed:

				var valid_drop: bool = (
					card_ui.drop_point_detector
					.get_overlapping_areas()
					.size() > 0
				)

				card_ui.should_return_to_hand = (
					not valid_drop
				)

				transition_requested.emit(
					self,
					CardState.State.RELEASED
				)
